const std = @import("std");
const path = std.fs.path;
const Builder = std.build.Builder;

pub fn build(b: *Builder) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("metal-zig", "src/00-window.zig");
    exe.addCSourceFile("src/abi_workarounds.c", &[_][]const u8 {});
    //exe.emit_asm = std.build.LibExeObjStep.EmitOption.emit;
    //exe.strip = true;
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.linkFramework("AppKit");
    exe.linkFramework("CoreFoundation");
    exe.linkFramework("CoreGraphics");
    exe.linkFramework("Metal");
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_tests = b.addTest("src/main.zig");
    exe_tests.setTarget(target);
    exe_tests.setBuildMode(mode);
    exe_tests.linkFramework("CoreFoundation");
    exe_tests.linkFramework("CoreGraphics");
    exe_tests.linkFramework("Metal");

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);

    try addMetalShader(b, exe, "add.metal", "add.air");
    try addMetalLibrary(b, exe, "add.air", "default.metallib");
}

fn addMetalShader(b: *Builder, exe: anytype, in_file: []const u8, out_file: []const u8) !void {
    // example:
    // xcrun -sdk macosx metal -c add.metal -o add.air
    const dirname = "shaders";
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

fn addMetalLibrary(b: *Builder, exe: anytype, in_file: []const u8, out_file: []const u8) !void {
    // example:
    // xcrun -sdk macosx metallib add.air -o default.metallib

    // TODO - support array of files
    const dirname = "shaders";
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
