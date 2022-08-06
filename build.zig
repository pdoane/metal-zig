const std = @import("std");

const example_00_window = @import("example/00-window/build.zig");
const example_compute_test = @import("example/compute_test/build.zig");

pub fn example(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode, exe: *std.build.LibExeObjStep, comptime name: []const u8) !void {
    //exe.emit_asm = std.build.LibExeObjStep.EmitOption.emit;
    //exe.strip = true;
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step(name ++ "-run", "Run " ++ name);
    run_step.dependOn(&run_cmd.step);
}

pub fn build(b: *std.build.Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    try example(b, target, mode, example_00_window.build(b), "00-window");
    try example(b, target, mode, example_compute_test.build(b), "compute_test");
}
