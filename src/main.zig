const std = @import("std");
const ns = @import("ns.zig");
const mtl = @import("mtl.zig");

pub fn main() !void {
    ns.init();
    mtl.init();

    var device = mtl.createSystemDefaultDevice() orelse {
        std.log.err("Metal device not found", .{});
        return;
    };

    std.log.info("Device: name={s}", .{device.name().utf8String()});

    const libraryPath = ns.String.stringWithZigString("shaders/default.metallib");
    var err: ?*ns.Error = undefined;
    var library = device.newLibraryWithFileAndError(libraryPath, &err) orelse {
        std.log.err("newLibraryWithFileAndError failed: {s} {s}", .{libraryPath.utf8String(), err.?.localizedDescription().utf8String()});
        return;
    };

    const functionName = ns.String.stringWithZigString("add");
    const function = library.newFunctionWithName(functionName) orelse {
        std.log.err("newFunctionWithName failed: {s} function not found", .{functionName.utf8String()});
        return;
    };

    std.log.info("Function: name={s}", .{function.name().utf8String()});
}
