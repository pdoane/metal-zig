const std = @import("std");

pub const pkg = std.build.Pkg{
    .name = "core_graphics",
    .source = .{ .path = thisDir() ++ "/src/main.zig" },
    .dependencies = &[_]std.build.Pkg{},
};

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.linkFramework("CoreGraphics");
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
