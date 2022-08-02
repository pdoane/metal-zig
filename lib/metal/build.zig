const std = @import("std");

const foundation = @import("../foundation/build.zig");

pub const pkg = std.build.Pkg{
    .name = "metal",
    .source = .{ .path = thisDir() ++ "/src/main.zig" },
    .dependencies = &[_]std.build.Pkg{foundation.pkg},
};

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.linkFramework("CoreGraphics");
    exe.linkFramework("Metal");
}

pub fn addShader(b: *std.build.Builder, exe: *std.build.LibExeObjStep, dirname: []const u8, in_file: []const u8, out_file: []const u8) void {
    // example:
    // xcrun -sdk macosx metal -c add.metal -o add.air
    const full_in = std.fs.path.join(b.allocator, &[_][]const u8{ dirname, in_file }) catch "";
    const full_out = std.fs.path.join(b.allocator, &[_][]const u8{ dirname, out_file }) catch "";

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

pub fn addLibrary(b: *std.build.Builder, exe: *std.build.LibExeObjStep, dirname: []const u8, in_file: []const u8, out_file: []const u8) void {
    // example:
    // xcrun -sdk macosx metallib add.air -o default.metallib

    // TODO - support array of files
    const full_in = std.fs.path.join(b.allocator, &[_][]const u8{ dirname, in_file }) catch "";
    const full_out = std.fs.path.join(b.allocator, &[_][]const u8{ dirname, out_file }) catch "";

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

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
