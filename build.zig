const std = @import("std");
const path = std.fs.path;
const Builder = std.build.Builder;
const Pkg = std.build.Pkg;

const pkgs = struct {
    pub const metal = Pkg{
        .name = "metal-zig",
        .source = .{ .path = "src/main.zig" }
    };
};

fn addPackages(exe: *std.build.LibExeObjStep) void {
    exe.addPackage(pkgs.metal);
    exe.addCSourceFile("src/abi_workarounds.c", &[_][]const u8 {});
    exe.linkFramework("AppKit");
    exe.linkFramework("CoreFoundation");
    exe.linkFramework("CoreGraphics");
    exe.linkFramework("Metal");
} 

pub fn example(b: *Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode, name: []const u8) !void {
    const full_path = try std.fmt.allocPrint(b.allocator, "examples/{s}.zig", .{ name });

    const exe = b.addExecutable(name, full_path);
    //exe.emit_asm = std.build.LibExeObjStep.EmitOption.emit;
    //exe.strip = true;
    exe.setTarget(target);
    exe.setBuildMode(mode);
    addPackages(exe);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step(name, "Run this example");
    run_step.dependOn(&run_cmd.step);

    // TODO - make step for processing shaders
    try addMetalShader(b, exe, "add.metal", "add.air");
    try addMetalLibrary(b, exe, "add.air", "default.metallib");
} 

pub fn build(b: *Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    try example(b, target, mode, "00-window");
    try example(b, target, mode, "compute_test");

    const exe_tests = b.addTest("src/main.zig");
    exe_tests.setTarget(target);
    exe_tests.setBuildMode(mode);
    addPackages(exe_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);
}

fn addMetalShader(b: *Builder, exe: *std.build.LibExeObjStep, in_file: []const u8, out_file: []const u8) !void {
    // example:
    // xcrun -sdk macosx metal -c add.metal -o add.air
    const dirname = "examples/shaders";
    const full_in = try path.join(b.allocator, &[_][]const u8{ dirname, in_file });
    const full_out = try path.join(b.allocator, &[_][]const u8{ dirname, out_file });

    const run_cmd = b.addSystemCommand(&[_][]const u8{
        "xcrun",
        "-sdk",
        "macosx",
        "metal",
        "-c",
        full_in,
        "-o",
        full_out,
    });
    exe.step.dependOn(&run_cmd.step);
}

fn addMetalLibrary(b: *Builder, exe: *std.build.LibExeObjStep, in_file: []const u8, out_file: []const u8) !void {
    // example:
    // xcrun -sdk macosx metallib add.air -o default.metallib

    // TODO - support array of files
    const dirname = "examples/shaders";
    const full_in = try path.join(b.allocator, &[_][]const u8{ dirname, in_file });
    const full_out = try path.join(b.allocator, &[_][]const u8{ dirname, out_file });

    const run_cmd = b.addSystemCommand(&[_][]const u8{
        "xcrun",
        "-sdk",
        "macosx",
        "metallib",
        full_in,
        "-o",
        full_out,
    });
    exe.step.dependOn(&run_cmd.step);
}
