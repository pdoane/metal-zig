pub const mtl = @import("mtl.zig");

const std = @import("std");
const core_graphics = @import("core_graphics");
const foundation = @import("foundation");

fn _init() void {
    core_graphics.init();
    foundation.init();
    mtl._init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}

test {
    @setEvalBranchQuota(10000);
    const refAllDecls = std.testing.refAllDecls;
    refAllDecls(mtl);
}
