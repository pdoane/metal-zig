const std = @import("std");
const ns = @import("ns.zig");
const mtl = @import("mtl.zig");

pub fn main() !void {
    ns.registerSelectors();
    mtl.registerSelectors();

    const device = mtl.createSystemDefaultDevice();
    const name = device.name();
    std.log.info("Device: name={s}", .{name.utf8String()});
}
