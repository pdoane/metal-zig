const std = @import("std");
const foundation = @import("foundation");
const app_kit = @import("app_kit");
const metal = @import("metal");
const metal_kit = @import("metal_kit");

const objc = foundation.objc;
const mtl = metal.mtl;
const mtk = metal_kit.mtk;
const ns = struct {
    usingnamespace foundation.ns;
    usingnamespace app_kit.ns;
};

var device: *mtl.Device = undefined;
var command_queue: *mtl.CommandQueue = undefined;
var window: *ns.Window = undefined;
var mtkView: *mtk.View = undefined;
var viewDelegate: mtk.ViewDelegate = undefined;

pub fn main() void {
    foundation.init();
    app_kit.init();
    metal.init();
    metal_kit.init();

    var autoreleasePool = ns.AutoreleasePool.alloc().init();
    defer autoreleasePool.release();

    var application = ns.Application.sharedApplication();
    var delegate = ns.ApplicationDelegate{ .applicationWillFinishLaunching = applicationWillFinishLaunching, .applicationDidFinishLaunching = applicationDidFinishLaunching, .applicationShouldTerminateAfterLastWindowClosed = applicationShouldTerminateAfterLastWindowClosed };

    application.setDelegate(delegate);
    application.run();

    mtkView.release();
    window.release();
    command_queue.release();
    device.release();
}

fn applicationWillFinishLaunching(notification: *ns.Notification) void {
    var menu = createMenuBar();
    var app = @ptrCast(?*ns.Application, notification.object()) orelse return;
    app.setMainMenu(menu);
    menu.release();

    _ = app.setActivationPolicy(ns.ActivationPolicyRegular);
}

fn applicationDidFinishLaunching(notification: *ns.Notification) void {
    const frame = ns.Rect{ .origin = ns.Point{ .x = 100.0, .y = 100.0 }, .size = ns.Size{ .width = 512.0, .height = 512.0 } };

    window = ns.Window.alloc().initWithContentRect_styleMask_backing_defer(frame, ns.WindowStyleMaskClosable | ns.WindowStyleMaskTitled, ns.BackingStoreBuffered, false);

    device = mtl.createSystemDefaultDevice().?;
    command_queue = device.newCommandQueue().?;

    mtkView = mtk.View.alloc().initWithFrame_device(frame, device);
    mtkView.setColorPixelFormat(mtl.PixelFormatBGRA8Unorm_sRGB);
    mtkView.setClearColor(mtl.ClearColor.init(1.0, 0.0, 0.0, 1.0));

    viewDelegate = mtk.ViewDelegate{ .drawInMTKView = drawInMTKView, .drawableSizeWillChange = drawableSizeWillChange };
    mtkView.setDelegate(viewDelegate);

    window.setContentView(mtkView.cast(ns.View));
    window.setTitle(ns.String.stringWithZigString("00 - Window"));

    window.makeKeyAndOrderFront(null);

    var app = @ptrCast(?*ns.Application, notification.object()) orelse return;
    app.activateIgnoringOtherApps(true);
}

fn applicationShouldTerminateAfterLastWindowClosed(_: *ns.Application) bool {
    return true;
}

fn drawInMTKView(view: *mtk.View) void {
    var pool = ns.AutoreleasePool.alloc().init();
    defer pool.release();

    var command_buffer = command_queue.commandBuffer().?;
    var render_pass_descriptor = view.currentRenderPassDescriptor();
    var encoder = command_buffer.renderCommandEncoderWithDescriptor(render_pass_descriptor);
    encoder.endEncoding();
    command_buffer.presentDrawable(view.currentDrawable().cast(mtl.Drawable));
    command_buffer.commit();
}

fn drawableSizeWillChange(_: *mtk.View, _: ns.Size) void {
    // TODO - should have a default implementation
}

fn createMenuBar() *ns.Menu {
    var mainMenu = ns.Menu.alloc().init();
    var appMenuItem = ns.MenuItem.alloc().init();
    defer appMenuItem.release();
    var appMenu = ns.Menu.alloc().initWithTitle(ns.String.stringWithZigString("Appname"));
    defer appMenu.release();

    var appName = ns.RunningApplication.currentApplication().localizedName();

    _ = appMenu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("About ").stringByAppendingString(appName), objc.selector("orderFrontStandardAboutPanel:"), ns.String.string());

    appMenu.addItem(ns.MenuItem.separatorItem());

    _ = appMenu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Hide ").stringByAppendingString(appName), objc.selector("hide:"), ns.String.stringWithZigString("h"));

    _ = appMenu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Hide others"), objc.selector("hideOtherApplications:"), ns.String.stringWithZigString("h"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagOption | ns.EventModifierFlagCommand);

    _ = appMenu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Show all"), objc.selector("unhideAllApplications"), ns.String.string());

    appMenu.addItem(ns.MenuItem.separatorItem());

    _ = appMenu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Quit ").stringByAppendingString(appName), objc.selector("terminate:"), ns.String.stringWithZigString("q"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagCommand);

    appMenuItem.setSubmenu(appMenu);
    mainMenu.addItem(appMenuItem);

    return mainMenu;
}
