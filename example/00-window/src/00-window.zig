// Derived from Apple's LearnMetalCPP examples
//
// Copyright 2022 Apple Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

var window: *ns.Window = undefined;
var mtk_view: *mtk.View = undefined;
var view_delegate: mtk.ViewDelegate = undefined;
var device: *mtl.Device = undefined;
var command_queue: *mtl.CommandQueue = undefined;

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

    command_queue.release();
    device.release();
    mtk_view.release();
    window.release();
}

fn applicationWillFinishLaunching(notification: *ns.Notification) void {
    var menu = createMenuBar();
    var app = notification.object().?.cast(ns.Application);
    app.setMainMenu(menu);
    menu.release();

    _ = app.setActivationPolicy(ns.ActivationPolicyRegular);
}

fn applicationDidFinishLaunching(notification: *ns.Notification) void {
    const frame = ns.Rect{ .origin = ns.Point{ .x = 100.0, .y = 100.0 }, .size = ns.Size{ .width = 512.0, .height = 512.0 } };

    window = ns.Window.alloc().initWithContentRect_styleMask_backing_defer(frame, ns.WindowStyleMaskClosable | ns.WindowStyleMaskTitled, ns.BackingStoreBuffered, false);

    device = mtl.createSystemDefaultDevice().?;
    command_queue = device.newCommandQueue().?;

    mtk_view = mtk.View.alloc().initWithFrame_device(frame, device);
    mtk_view.setColorPixelFormat(mtl.PixelFormatBGRA8Unorm_sRGB);
    mtk_view.setClearColor(mtl.ClearColor.init(1.0, 0.0, 0.0, 1.0));

    view_delegate = mtk.ViewDelegate{ .drawInMTKView = drawInMTKView, .drawableSizeWillChange = drawableSizeWillChange };
    mtk_view.setDelegate(view_delegate);

    window.setContentView(mtk_view.cast(ns.View));
    window.setTitle(ns.String.stringWithZigString("00 - Window"));

    window.makeKeyAndOrderFront(null);

    var app = notification.object().?.cast(ns.Application);
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
    var encoder = command_buffer.renderCommandEncoderWithDescriptor(render_pass_descriptor).?;
    encoder.endEncoding();
    command_buffer.presentDrawable(view.currentDrawable().cast(mtl.Drawable));
    command_buffer.commit();
}

fn drawableSizeWillChange(_: *mtk.View, _: ns.Size) void {
    // TODO - should have a default implementation
}

fn createMenuBar() *ns.Menu {
    var main_menu = ns.Menu.alloc().init();
    var app_menu_item = ns.MenuItem.alloc().init();
    defer app_menu_item.release();
    var app_menu = ns.Menu.alloc().initWithTitle(ns.String.stringWithZigString("app_name"));
    defer app_menu.release();

    var app_name = ns.RunningApplication.currentApplication().localizedName();

    _ = app_menu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("About ").stringByAppendingString(app_name), objc.selector("orderFrontStandardAboutPanel:"), ns.String.string());

    app_menu.addItem(ns.MenuItem.separatorItem());

    _ = app_menu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Hide ").stringByAppendingString(app_name), objc.selector("hide:"), ns.String.stringWithZigString("h"));

    _ = app_menu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Hide others"), objc.selector("hideOtherApplications:"), ns.String.stringWithZigString("h"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagOption | ns.EventModifierFlagCommand);

    _ = app_menu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Show all"), objc.selector("unhideAllApplications"), ns.String.string());

    app_menu.addItem(ns.MenuItem.separatorItem());

    _ = app_menu.addItemWithTitle_action_keyEquivalent(ns.String.stringWithZigString("Quit ").stringByAppendingString(app_name), objc.selector("terminate:"), ns.String.stringWithZigString("q"))
        .setKeyEquivalentModifierMask(ns.EventModifierFlagCommand);

    app_menu_item.setSubmenu(app_menu);
    main_menu.addItem(app_menu_item);

    return main_menu;
}
