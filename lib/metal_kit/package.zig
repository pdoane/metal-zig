const std = @import("std");

const app_kit = @import("../app_kit/package.zig");
const core_graphics = @import("../core_graphics/package.zig");
const foundation = @import("../foundation/package.zig");
const metal = @import("../metal/package.zig");
const quartz_core = @import("../quartz_core/package.zig");

pub const pkg = std.build.Pkg{
    .name = "metal_kit",
    .source = .{ .path = thisDir() ++ "/src/main.zig" },
    .dependencies = &[_]std.build.Pkg{ app_kit.pkg, core_graphics.pkg, foundation.pkg, metal.pkg, quartz_core.pkg },
};

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.addCSourceFile(thisDir() ++ "/src/abi_workarounds.c", &[_][]const u8{});
    exe.linkFramework("MetalKit");
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
