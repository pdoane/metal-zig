const std = @import("std");

const foundation = @import("../foundation/package.zig");
const metal = @import("../metal/package.zig");

pub const pkg = std.build.Pkg{
    .name = "quartz_core",
    .source = .{ .path = thisDir() ++ "/src/main.zig" },
    .dependencies = &[_]std.build.Pkg{ foundation.pkg, metal.pkg },
};

pub fn link(exe: *std.build.LibExeObjStep) void {
    _ = exe;
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
