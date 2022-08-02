pub const ns = @import("ns.zig");
pub const objc = @import("objc.zig");

pub fn init() void {
    ns._foundation_init();
}
