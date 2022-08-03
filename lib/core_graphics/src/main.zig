pub const cg = @import("cg.zig");

const std = @import("std");

fn _init() void {
    cg._init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}
