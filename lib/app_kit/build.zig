const std = @import("std");

const foundation = @import("../foundation/build.zig");

pub const pkg = std.build.Pkg{
    .name = "app_kit",
    .source = .{ .path = thisDir() ++ "/src/main.zig" },
    .dependencies = &[_]std.build.Pkg{foundation.pkg},
};

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.addCSourceFile(thisDir() ++ "/src/abi_workarounds.c", &[_][]const u8{});
    exe.linkFramework("AppKit");
}

fn thisDir() []const u8 {
    comptime {
        return std.fs.path.dirname(@src().file) orelse ".";
    }
}
