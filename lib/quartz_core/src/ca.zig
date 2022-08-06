const std = @import("std");
const foundation = @import("foundation");
const metal = @import("metal");

const objc = foundation.objc;
const mtl = metal.mtl;

var sel_layer: objc.SEL = undefined;
var sel_texture: objc.SEL = undefined;

pub fn _init() void {
    sel_layer = objc.selector("layer");
    sel_texture = objc.selector("texture");
}

pub const MetalDrawable = opaque {
    const Self = @This();
    pub const Super = mtl.Drawable;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn layer(self: *T) *MetalLayer {
                return objc.msgSend(*MetalLayer, self, sel_layer, .{});
            }

            pub fn texture(self: *T) *mtl.Texture {
                return objc.msgSend(*mtl.Texture, self, sel_texture, .{});
            }
        };
    }
};

pub const MetalLayer = opaque {};
