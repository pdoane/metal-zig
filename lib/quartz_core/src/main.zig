pub const ca = @import("ca.zig");

const std = @import("std");
const foundation = @import("foundation");
const metal = @import("metal");

fn _init() void {
    foundation.init();
    metal.init();
    ca._init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}
