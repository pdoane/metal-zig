const std = @import("std");

const foundation = @import("../../lib/foundation/build.zig");
const app_kit = @import("../../lib/app_kit/build.zig");
const metal = @import("../../lib/metal/build.zig");

pub const name = "compute_test";

pub fn build(b: *std.build.Builder) *std.build.LibExeObjStep {
    const exe = b.addExecutable(name, thisDir() ++ "/src/main.zig");

    exe.addPackage(foundation.pkg);
    exe.addPackage(app_kit.pkg);
    exe.addPackage(metal.pkg);

    foundation.link(exe);
    app_kit.link(exe);
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
