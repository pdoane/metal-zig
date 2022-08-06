pub const ns = @import("ns.zig");
pub const objc = @import("objc.zig");

const std = @import("std");

fn _init() void {
    ns._foundation_init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}

test {
    const refAllDecls = std.testing.refAllDecls;
    refAllDecls(ns);
    refAllDecls(objc);
}
