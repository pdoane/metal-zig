pub const ns = @import("ns.zig");

const std = @import("std");
const foundation = @import("foundation");

fn _init() void {
    foundation.init();
    ns._app_kit_init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}

test {
    const refAllDecls = std.testing.refAllDecls;
    refAllDecls(ns);
}
