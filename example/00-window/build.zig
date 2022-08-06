const std = @import("std");

const app_kit = @import("../../lib/app_kit/package.zig");
const core_graphics = @import("../../lib/core_graphics/package.zig");
const foundation = @import("../../lib/foundation/package.zig");
const metal = @import("../../lib/metal/package.zig");
const metal_kit = @import("../../lib/metal_kit/package.zig");
const quartz_core = @import("../../lib/quartz_core/package.zig");

pub const name = "00-window";

pub fn build(b: *std.build.Builder) *std.build.LibExeObjStep {
    const exe = b.addExecutable(name, thisDir() ++ "/src/00-window.zig");

    exe.addPackage(app_kit.pkg);
    exe.addPackage(core_graphics.pkg);
    exe.addPackage(foundation.pkg);
    exe.addPackage(metal_kit.pkg);
    exe.addPackage(metal.pkg);
    exe.addPackage(quartz_core.pkg);

    app_kit.link(exe);
    core_graphics.link(exe);
    foundation.link(exe);
    metal_kit.link(exe);
    metal.link(exe);
    quartz_core.link(exe);

    return exe;
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
