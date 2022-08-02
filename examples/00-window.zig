const std = @import("std");
const metal_zig = @import("metal-zig");
const objc = metal_zig.objc;
const ns = metal_zig.ns;
const mtl = metal_zig.mtl;

pub fn main() void {
    ns.init();
    mtl.init();

    var autoreleasePool = ns.AutoreleasePool.alloc().init();
    defer autoreleasePool.release();

    var application = ns.Application.sharedApplication();
    var del = ns.ApplicationDelegate{
        .applicationWillFinishLaunching = applicationWillFinishLaunching,
        .applicationDidFinishLaunching = applicationDidFinishLaunching,
        .applicationShouldTerminateAfterLastWindowClosed = applicationShouldTerminateAfterLastWindowClosed
    };

    application.setDelegate(del);
    application.run();
}

fn applicationWillFinishLaunching(notification: *ns.Notification) void {
    var menu = createMenuBar();
    var app = @ptrCast(?*ns.Application, notification.object()) orelse return;
    app.setMainMenu(menu);
    menu.release();

    _ = app.setActivationPolicy(ns.ActivationPolicyRegular);
}

fn applicationDidFinishLaunching(notification: *ns.Notification) void {
    const frame = ns.Rect{ .origin=ns.Point{ .x=100.0, .y=100.0 }, .size=ns.Size{ .width=512.0, .height=512.0 }};

    var window = ns.Window.alloc().initWithContentRect_styleMask_backing_defer(
        frame,
        ns.WindowStyleMaskClosable | ns.WindowStyleMaskTitled,
        ns.BackingStoreBuffered,
        false
    );

    window.setTitle(ns.String.stringWithZigString("00 - Window"));

    window.makeKeyAndOrderFront(null);

    var app = @ptrCast(?*ns.Application, notification.object()) orelse return;
    app.activateIgnoringOtherApps(true);
}

fn applicationShouldTerminateAfterLastWindowClosed(_: *ns.Application) bool {
    return true;
}

fn createMenuBar() *ns.Menu {
    var mainMenu = ns.Menu.alloc().init();
    var appMenuItem = ns.MenuItem.alloc().init();
    defer appMenuItem.release();
    var appMenu = ns.Menu.alloc().initWithTitle(ns.String.stringWithZigString("Appname"));
    defer appMenu.release();

    var appName = ns.RunningApplication.currentApplication().localizedName();

    _ = appMenu.addItemWithTitle_action_keyEquivalent(
        ns.String.stringWithZigString("About ").stringByAppendingString(appName),
        objc.selector("orderFrontStandardAboutPanel:"),
        ns.String.string());

    appMenu.addItem(ns.MenuItem.separatorItem());

    _ = appMenu.addItemWithTitle_action_keyEquivalent(
        ns.String.stringWithZigString("Hide ").stringByAppendingString(appName),
        objc.selector("hide:"),
        ns.String.stringWithZigString("h"));

    _ = appMenu.addItemWithTitle_action_keyEquivalent(
        ns.String.stringWithZigString("Hide others"),
        objc.selector("hideOtherApplications:"),
        ns.String.stringWithZigString("h"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagOption | ns.EventModifierFlagCommand);

    _ = appMenu.addItemWithTitle_action_keyEquivalent(
        ns.String.stringWithZigString("Show all"),
        objc.selector("unhideAllApplications"),
        ns.String.string());

    appMenu.addItem(ns.MenuItem.separatorItem());

    _ = appMenu.addItemWithTitle_action_keyEquivalent(
        ns.String.stringWithZigString("Quit ").stringByAppendingString(appName),
        objc.selector("terminate:"),
        ns.String.stringWithZigString("q"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagCommand);

    appMenuItem.setSubmenu(appMenu);
    mainMenu.addItem(appMenuItem);

    return mainMenu;
}
