const std = @import("std");

const app_kit = @import("../../lib/app_kit/package.zig");
const core_graphics = @import("../../lib/core_graphics/package.zig");
const foundation = @import("../../lib/foundation/package.zig");
const metal = @import("../../lib/metal/package.zig");

pub const name = "compute_test";

pub fn build(b: *std.build.Builder) *std.build.LibExeObjStep {
    const exe = b.addExecutable(name, thisDir() ++ "/src/compute_test.zig");

    exe.addPackage(app_kit.pkg);
    exe.addPackage(core_graphics.pkg);
    exe.addPackage(foundation.pkg);
    exe.addPackage(metal.pkg);

    app_kit.link(exe);
    core_graphics.link(exe);
    foundation.link(exe);
    metal.link(exe);

    // TODO - make step for processing shaders
    metal.addShader(b, exe, thisDir() ++ "/shaders", "add.metal", "add.air");
    metal.addLibrary(b, exe, thisDir() ++ "/shaders", "add.air", "default.metallib");

    return exe;
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
