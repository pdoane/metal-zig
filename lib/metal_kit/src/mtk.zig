const std = @import("std");
const core_graphics = @import("core_graphics");
const foundation = @import("foundation");
const app_kit = @import("app_kit");
const metal = @import("metal");
const quartz_core = @import("quartz_core");

const ca = quartz_core.ca;
const cg = core_graphics.cg;
const objc = foundation.objc;
const mtl = metal.mtl;
const ns = struct {
    usingnamespace foundation.ns;
    usingnamespace app_kit.ns;
};

var class_MTKView: objc.Class = undefined;
var class_NSValue: objc.Class = undefined;

var sel_alloc: objc.SEL = undefined;
var sel_autoresizeDrawable: objc.SEL = undefined;
var sel_clearColor: objc.SEL = undefined;
var sel_clearDepth: objc.SEL = undefined;
var sel_clearStencil: objc.SEL = undefined;
var sel_colorPixelFormat: objc.SEL = undefined;
var sel_colorspace: objc.SEL = undefined;
var sel_currentDrawable: objc.SEL = undefined;
var sel_currentRenderPassDescriptor: objc.SEL = undefined;
var sel_depthStencilAttachmentTextureUsage: objc.SEL = undefined;
var sel_depthStencilPixelFormat: objc.SEL = undefined;
var sel_depthStencilTexture: objc.SEL = undefined;
var sel_device: objc.SEL = undefined;
var sel_draw: objc.SEL = undefined;
var sel_drawableSize: objc.SEL = undefined;
var sel_drawInMTKView_: objc.SEL = undefined;
var sel_enableSetNeedsDisplay: objc.SEL = undefined;
var sel_framebufferOnly: objc.SEL = undefined;
var sel_initWithFrame_device_: objc.SEL = undefined;
var sel_isPaused: objc.SEL = undefined;
var sel_mtkView_drawableSizeWillChange_: objc.SEL = undefined;
var sel_multisampleColorAttachmentTextureUsage: objc.SEL = undefined;
var sel_multisampleColorTexture: objc.SEL = undefined;
var sel_preferredDevice: objc.SEL = undefined;
var sel_preferredDrawableSize: objc.SEL = undefined;
var sel_preferredFramesPerSecond: objc.SEL = undefined;
var sel_presentsWithTransaction: objc.SEL = undefined;
var sel_releaseDrawables: objc.SEL = undefined;
var sel_sampleCount: objc.SEL = undefined;
var sel_setAutoresizeDrawable_: objc.SEL = undefined;
var sel_setClearColor_: objc.SEL = undefined;
var sel_setClearDepth_: objc.SEL = undefined;
var sel_setClearStencil_: objc.SEL = undefined;
var sel_setColorPixelFormat_: objc.SEL = undefined;
var sel_setColorspace_: objc.SEL = undefined;
var sel_setDelegate_: objc.SEL = undefined;
var sel_setDepthStencilAttachmentTextureUsage_: objc.SEL = undefined;
var sel_setDepthStencilPixelFormat_: objc.SEL = undefined;
var sel_setDevice_: objc.SEL = undefined;
var sel_setDrawableSize_: objc.SEL = undefined;
var sel_setEnableSetNeedsDisplay_: objc.SEL = undefined;
var sel_setFramebufferOnly_: objc.SEL = undefined;
var sel_setMultisampleColorAttachmentTextureUsage_: objc.SEL = undefined;
var sel_setPaused_: objc.SEL = undefined;
var sel_setPreferredFramesPerSecond_: objc.SEL = undefined;
var sel_setPresentsWithTransaction_: objc.SEL = undefined;
var sel_setSampleCount_: objc.SEL = undefined;

pub fn _init() void {
    class_MTKView = objc.class("MTKView");
    class_NSValue = objc.class("NSValue");

    sel_alloc = objc.selector("alloc");
    sel_autoresizeDrawable = objc.selector("autoresizeDrawable");
    sel_clearColor = objc.selector("clearColor");
    sel_clearDepth = objc.selector("clearDepth");
    sel_clearStencil = objc.selector("clearStencil");
    sel_colorPixelFormat = objc.selector("colorPixelFormat");
    sel_colorspace = objc.selector("colorspace");
    sel_currentDrawable = objc.selector("currentDrawable");
    sel_currentRenderPassDescriptor = objc.selector("currentRenderPassDescriptor");
    sel_depthStencilAttachmentTextureUsage = objc.selector("depthStencilAttachmentTextureUsage");
    sel_depthStencilPixelFormat = objc.selector("depthStencilPixelFormat");
    sel_depthStencilTexture = objc.selector("depthStencilTexture");
    sel_device = objc.selector("device");
    sel_draw = objc.selector("draw");
    sel_drawableSize = objc.selector("drawableSize");
    sel_drawInMTKView_ = objc.selector("drawInMTKView:");
    sel_enableSetNeedsDisplay = objc.selector("enableSetNeedsDisplay");
    sel_framebufferOnly = objc.selector("framebufferOnly");
    sel_initWithFrame_device_ = objc.selector("initWithFrame:device:");
    sel_isPaused = objc.selector("isPaused");
    sel_mtkView_drawableSizeWillChange_ = objc.selector("mtkView:drawableSizeWillChange:");
    sel_multisampleColorAttachmentTextureUsage = objc.selector("multisampleColorAttachmentTextureUsage");
    sel_multisampleColorTexture = objc.selector("multisampleColorTexture");
    sel_preferredDevice = objc.selector("preferredDevice");
    sel_preferredDrawableSize = objc.selector("preferredDrawableSize");
    sel_preferredFramesPerSecond = objc.selector("preferredFramesPerSecond");
    sel_presentsWithTransaction = objc.selector("presentsWithTransaction");
    sel_releaseDrawables = objc.selector("releaseDrawables");
    sel_sampleCount = objc.selector("sampleCount");
    sel_setAutoresizeDrawable_ = objc.selector("setAutoresizeDrawable:");
    sel_setClearColor_ = objc.selector("setClearColor:");
    sel_setClearDepth_ = objc.selector("setClearDepth:");
    sel_setClearStencil_ = objc.selector("setClearStencil:");
    sel_setColorPixelFormat_ = objc.selector("setColorPixelFormat:");
    sel_setColorspace_ = objc.selector("setColorspace:");
    sel_setDelegate_ = objc.selector("setDelegate:");
    sel_setDepthStencilAttachmentTextureUsage_ = objc.selector("setDepthStencilAttachmentTextureUsage");
    sel_setDepthStencilPixelFormat_ = objc.selector("setDepthStencilPixelFormat:");
    sel_setDevice_ = objc.selector("setDevice:");
    sel_setDrawableSize_ = objc.selector("setDrawableSize:");
    sel_setEnableSetNeedsDisplay_ = objc.selector("setEnableSetNeedsDisplay:");
    sel_setFramebufferOnly_ = objc.selector("setFramebufferOnly:");
    sel_setMultisampleColorAttachmentTextureUsage_ = objc.selector("setMultisampleColorAttachmentTextureUsage:");
    sel_setPaused_ = objc.selector("setPaused:");
    sel_setPreferredFramesPerSecond_ = objc.selector("setPreferredFramesPerSecond:");
    sel_setPresentsWithTransaction_ = objc.selector("setPresentsWithTransaction:");
    sel_setSampleCount_ = objc.selector("setSampleCount:");

    // Follows metal-cpp convention of extending NSValue with delegate implementation
    _ = objc.addMethod(class_NSValue, sel_drawInMTKView_, drawInMTKViewThunk, "v@:@");
    _ = objc.addMethod(class_NSValue, sel_mtkView_drawableSizeWillChange_, drawableSizeWillChangeThunk, "v@:@{CGSize=dd}");
    // TODO - params are "v@:@{CGSize=ff}" if !CG_FLOAT_IS_DOUBLE
}

pub const View = opaque {
    const Self = @This();
    pub const Super = ns.View;
    usingnamespace Methods(Self);

    pub fn alloc() *View {
        return objc.msgSend(*View, class_MTKView, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            extern fn initWithFrame_device_workaround(_: *T, _: objc.SEL, _: *const ns.Rect, _: *mtl.Device) callconv(.C) *T;

            pub fn initWithFrame_device(self: *T, frame: ns.Rect, device_: *mtl.Device) *T {
                //return objc.msgSend(*T, self, sel_initWithFrame_device_, .{ frame, device_ });
                return initWithFrame_device_workaround(self, sel_initWithFrame_device_, &frame, device_);
            }

            // initWithCoder

            pub fn setDevice(self: *T, device_: *mtl.Device) void {
                return objc.msgSend(void, self, sel_setDevice_, .{device_});
            }

            pub fn device(self: *T) *mtl.Device {
                return objc.msgSend(*mtl.Device, self, sel_device, .{});
            }

            pub fn setDelegate(self: *T, delegate: ViewDelegate) void {
                const wrapper = ns.Value.valueWithPointer(&delegate);

                // Leaks the object but we need to keep it around for the dispatch to work
                _ = wrapper.retain();

                objc.msgSend(void, self, sel_setDelegate_, .{wrapper});
            }

            pub fn currentDrawable(self: *T) *ca.MetalDrawable {
                return objc.msgSend(*ca.MetalDrawable, self, sel_currentDrawable, .{});
            }

            pub fn setFramebufferOnly(self: *T, framebuffer_only: bool) void {
                objc.msgSend(void, self, sel_setFramebufferOnly_, .{framebuffer_only});
            }

            pub fn framebufferOnly(self: *T) bool {
                return objc.msgSend(void, self, sel_framebufferOnly, .{});
            }

            pub fn setDepthStencilAttachmentTextureUsage(self: *T, texture_usage: mtl.TextureUsage) void {
                objc.msgSend(void, self, sel_setDepthStencilAttachmentTextureUsage_, .{texture_usage});
            }

            pub fn depthStencilAttachmentTextureUsage(self: *T) mtl.TextureUsage {
                return objc.msgSend(mtl.TextureUsage, self, sel_depthStencilAttachmentTextureUsage, .{});
            }

            pub fn setMultisampleColorAttachmentTextureUsage(self: *T, texture_usage: mtl.TextureUsage) void {
                objc.msgSend(void, self, sel_setMultisampleColorAttachmentTextureUsage_, .{texture_usage});
            }

            pub fn multisampleColorAttachmentTextureUsage(self: *T) mtl.TextureUsage {
                return objc.msgSend(mtl.TextureUsage, self, sel_multisampleColorAttachmentTextureUsage, .{});
            }

            pub fn setPresentsWithTransaction(self: *T, presents_with_transaction: bool) void {
                objc.msgSend(void, self, sel_setPresentsWithTransaction_, .{presents_with_transaction});
            }

            pub fn presentsWithTransaction(self: *T) bool {
                return objc.msgSend(bool, self, sel_presentsWithTransaction, .{});
            }

            pub fn setColorPixelFormat(self: *T, color_pixel_format: mtl.PixelFormat) void {
                objc.msgSend(void, self, sel_setColorPixelFormat_, .{color_pixel_format});
            }

            pub fn colorPixelFormat(self: *T) mtl.PixelFormat {
                return objc.msgSend(mtl.PixelFormat, self, sel_colorPixelFormat, .{});
            }

            pub fn setDepthStencilPixelFormat(self: *T, depth_stencil_pixel_format: mtl.PixelFormat) void {
                objc.msgSend(void, self, sel_setDepthStencilPixelFormat_, .{depth_stencil_pixel_format});
            }

            pub fn depthStencilPixelFormat(self: *T) mtl.PixelFormat {
                return objc.send(mtl.PixelFormat, self, sel_depthStencilPixelFormat, .{});
            }

            pub fn setSampleCount(self: *T, sample_count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setSampleCount_, .{sample_count});
            }

            pub fn sampleCount(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_sampleCount, .{});
            }

            extern fn setClearColor_workaround(_: *T, _: objc.SEL, _: *const mtl.ClearColor) callconv(.C) void;

            pub fn setClearColor(self: *T, clear_color: mtl.ClearColor) void {
                setClearColor_workaround(self, sel_setClearColor_, &clear_color);
                //objc.msgSend(void, self, sel_setClearColor_, .{clear_color});
            }

            pub fn clearColor(self: *T) mtl.ClearColor {
                return objc.msgSend(mtl.ClearColor, self, sel_clearColor, .{});
            }

            pub fn setClearDepth(self: *T, clear_depth: f64) void {
                objc.msgSend(void, self, sel_setClearDepth_, .{clear_depth});
            }

            pub fn clearDepth(self: *T) f64 {
                return objc.msgSend(f64, self, sel_clearDepth, .{});
            }

            pub fn setClearStencil(self: *T, clear_stencil: u32) void {
                objc.msgSend(void, self, sel_setClearStencil_, .{clear_stencil});
            }

            pub fn clearStencil(self: *T) u32 {
                return objc.msgSend(u32, self, sel_clearStencil, .{});
            }

            pub fn depthStencilTexture(self: *T) *mtl.Texture {
                return objc.msgSend(*mtl.Texture, self, sel_depthStencilTexture, .{});
            }

            pub fn multisampleColorTexture(self: *T) *mtl.Texture {
                return objc.msgSend(*mtl.Texture, self, sel_multisampleColorTexture, .{});
            }

            pub fn releaseDrawables(self: *T) void {
                objc.msgSend(void, self, sel_releaseDrawables, .{});
            }

            pub fn currentRenderPassDescriptor(self: *T) *mtl.RenderPassDescriptor {
                return objc.msgSend(*mtl.RenderPassDescriptor, self, sel_currentRenderPassDescriptor, .{});
            }

            pub fn setPreferredFramesPerSecond(self: *T, preferred_frames_per_second: ns.Integer) void {
                objc.msgSend(void, self, sel_setPreferredFramesPerSecond_, .{preferred_frames_per_second});
            }

            pub fn preferredFramesPerSecond(self: *T) ns.Integer {
                return objc.msgSend(ns.Integer, self, sel_preferredFramesPerSecond, .{});
            }

            pub fn setEnableSetNeedsDisplay(self: *T, enable_set_needs_display: bool) void {
                objc.msgSend(void, self, sel_setEnableSetNeedsDisplay_, .{enable_set_needs_display});
            }

            pub fn enableSetNeedsDisplay(self: *T) bool {
                return objc.msgSend(bool, self, sel_enableSetNeedsDisplay, .{});
            }

            pub fn setAutoresizeDrawable(self: *T, autoresize_drawable: bool) void {
                objc.msgSend(void, self, sel_setAutoresizeDrawable_, .{autoresize_drawable});
            }

            pub fn autoresizeDrawable(self: *T) bool {
                return objc.msgSend(bool, self, sel_autoresizeDrawable, .{});
            }

            pub fn setDrawableSize(self: *T, drawable_size: ns.Size) void {
                objc.msgSend(
                    void,
                    self,
                    sel_setDrawableSize_,
                    .{drawable_size},
                );
            }

            pub fn drawableSize(self: *T) ns.Size {
                return objc.msgSend(ns.Size, self, sel_drawableSize, .{});
            }

            pub fn preferredDrawableSize(self: *T) ns.Size {
                return objc.msgSend(ns.Size, self, sel_preferredDrawableSize, .{});
            }

            pub fn preferredDevice(self: *T) *mtl.Device {
                return objc.msgSend(*mtl.Device, self, sel_preferredDevice, .{});
            }

            pub fn setPaused(self: *T, paused: bool) void {
                objc.msgSend(void, self, sel_setPaused_, .{paused});
            }

            pub fn isPaused(self: *T) bool {
                return objc.msgSend(bool, self, sel_isPaused, .{});
            }

            pub fn setColorSpace(self: *T, color_space: cg.ColorSpaceRef) void {
                objc.msgSend(void, self, sel_setColorspace_, .{color_space});
            }

            pub fn colorSpace(self: *T) cg.ColorSpaceRef {
                return objc.msgSend(cg.ColorSpaceRef, self, sel_colorspace, .{});
            }

            pub fn draw(self: *T) void {
                objc.msgSend(void, self, sel_draw, .{});
            }
        };
    }
};

pub const ViewDelegate = struct {
    drawInMTKView: fn (*View) void,
    drawableSizeWillChange: fn (*View, ns.Size) void,
};

fn drawInMTKViewThunk(self: *ns.Value, _: objc.SEL, view: *View) callconv(.C) void {
    const delegate = self.pointerValue(ViewDelegate);
    delegate.drawInMTKView(view);
}

fn drawableSizeWillChangeThunk(self: *ns.Value, _: objc.SEL, view: *View, size: ns.Size) callconv(.C) void {
    const delegate = self.pointerValue(ViewDelegate);
    delegate.drawableSizeWillChange(view, size);
}
