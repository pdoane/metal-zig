const std = @import("std");

const lib_app_kit = @import("lib/app_kit/package.zig");
const lib_core_graphics = @import("lib/core_graphics/package.zig");
const lib_foundation = @import("lib/foundation/package.zig");
const lib_metal = @import("lib/metal/package.zig");
const lib_metal_kit = @import("lib/metal_kit/package.zig");
const lib_quartz_core = @import("lib/quartz_core/package.zig");

const example_00_window = @import("example/00-window/build.zig");
const example_compute_test = @import("example/compute_test/build.zig");

pub fn example(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode, exe: *std.build.LibExeObjStep, comptime name: []const u8) void {
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

pub fn addTest(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode, all_tests_step: *std.build.Step, lib: anytype) void {
    const exe = b.addTest(lib.pkg.source.path);
    exe.setTarget(target);
    exe.setBuildMode(mode);
    if (lib.pkg.dependencies) |dependencies| {
        for (dependencies) |dependency| {
            exe.addPackage(dependency);
        }
    }

    // No access to link function from packages so just link everything
    lib_app_kit.link(exe);
    lib_core_graphics.link(exe);
    lib_foundation.link(exe);
    lib_metal.link(exe);
    lib_metal_kit.link(exe);
    lib_quartz_core.link(exe);

    all_tests_step.dependOn(&exe.step);
}

pub fn build(b: *std.build.Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    example(b, target, mode, example_00_window.build(b), "00-window");
    example(b, target, mode, example_compute_test.build(b), "compute_test");

    const all_tests_step = b.step("test", "Run all tests");
    addTest(b, target, mode, all_tests_step, lib_app_kit);
    addTest(b, target, mode, all_tests_step, lib_core_graphics);
    addTest(b, target, mode, all_tests_step, lib_foundation);
    addTest(b, target, mode, all_tests_step, lib_metal);
    addTest(b, target, mode, all_tests_step, lib_metal_kit);
    addTest(b, target, mode, all_tests_step, lib_quartz_core);
}
