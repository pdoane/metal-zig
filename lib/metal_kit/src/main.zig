pub const mtk = @import("mtk.zig");

const std = @import("std");
const app_kit = @import("app_kit");
const core_graphics = @import("core_graphics");
const foundation = @import("foundation");
const metal = @import("metal");
const quartz_core = @import("quartz_core");

fn _init() void {
    app_kit.init();
    core_graphics.init();
    foundation.init();
    metal.init();
    quartz_core.init();
    mtk._init();
}
var global_once = std.once(_init);

pub fn init() void {
    global_once.call();
}
