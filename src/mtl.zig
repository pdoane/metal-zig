const std = @import("std");
const objc = @import("objc.zig");
const ns = @import("ns.zig");

extern fn MTLCreateSystemDefaultDevice() objc.id;

var sel_name : objc.SEL = undefined;

pub fn registerSelectors() void {
    sel_name = objc.selector("name");
}

pub const Device = struct {
    _device: objc.id,

    pub fn name(self: *const Device) ns.String {
        return ns.String{ ._string = objc.msgSend(objc.id, self._device, sel_name, .{}) };
    }
};

pub fn createSystemDefaultDevice() Device {
    return Device{ ._device = MTLCreateSystemDefaultDevice() };
}
