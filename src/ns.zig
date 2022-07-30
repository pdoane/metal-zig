const std = @import("std");
const objc = @import("objc.zig");

var sel_utf8String : objc.SEL = undefined;

pub fn registerSelectors() void {
    sel_utf8String = objc.selector("UTF8String");
}

pub const String = struct {
    _string: objc.id,

    pub fn utf8String(self: *const String) [:0]const u8 {
        return std.mem.span(objc.msgSend([*c]u8, self._string, sel_utf8String, .{}));
    }
};
