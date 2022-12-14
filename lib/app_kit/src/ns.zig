const std = @import("std");
const core_graphics = @import("core_graphics");
const foundation = @import("foundation");

const cg = core_graphics.cg;
const objc = foundation.objc;

var class_NSApplication: objc.Class = undefined;
var class_NSMenu: objc.Class = undefined;
var class_NSMenuItem: objc.Class = undefined;
var class_NSRunningApplication: objc.Class = undefined;
var class_NSValue: objc.Class = undefined;
var class_NSWindow: objc.Class = undefined;

var sel_activateIgnoringOtherApps_: objc.SEL = undefined;
var sel_addItem_: objc.SEL = undefined;
var sel_addItemWithTitle_action_keyEquivalent_: objc.SEL = undefined;
var sel_alloc: objc.SEL = undefined;
var sel_applicationDidFinishLaunching_: objc.SEL = undefined;
var sel_applicationShouldTerminateAfterLastWindowClosed_: objc.SEL = undefined;
var sel_applicationWillFinishLaunching_: objc.SEL = undefined;
var sel_close: objc.SEL = undefined;
var sel_currentApplication: objc.SEL = undefined;
var sel_init: objc.SEL = undefined;
var sel_initWithContentRect_styleMask_backing_defer_: objc.SEL = undefined;
var sel_initWithFrame_: objc.SEL = undefined;
var sel_initWithTitle_: objc.SEL = undefined;
var sel_keyEquivalentModifierMask: objc.SEL = undefined;
var sel_localizedName: objc.SEL = undefined;
var sel_makeKeyAndOrderFront_: objc.SEL = undefined;
var sel_run: objc.SEL = undefined;
var sel_separatorItem: objc.SEL = undefined;
var sel_setActivationPolicy_: objc.SEL = undefined;
var sel_setContentView_: objc.SEL = undefined;
var sel_setDelegate_: objc.SEL = undefined;
var sel_setKeyEquivalentModifierMask_: objc.SEL = undefined;
var sel_setMainMenu_: objc.SEL = undefined;
var sel_setSubmenu_: objc.SEL = undefined;
var sel_setTitle_: objc.SEL = undefined;
var sel_sharedApplication: objc.SEL = undefined;
var sel_terminate_: objc.SEL = undefined;

pub fn _app_kit_init() void {
    class_NSApplication = objc.class("NSApplication");
    class_NSMenu = objc.class("NSMenu");
    class_NSMenuItem = objc.class("NSMenuItem");
    class_NSRunningApplication = objc.class("NSRunningApplication");
    class_NSValue = objc.class("NSValue");
    class_NSWindow = objc.class("NSWindow");

    sel_activateIgnoringOtherApps_ = objc.selector("activateIgnoringOtherApps:");
    sel_addItem_ = objc.selector("addItem:");
    sel_addItemWithTitle_action_keyEquivalent_ = objc.selector("addItemWithTitle:action:keyEquivalent:");
    sel_alloc = objc.selector("alloc");
    sel_applicationDidFinishLaunching_ = objc.selector("applicationDidFinishLaunching:");
    sel_applicationShouldTerminateAfterLastWindowClosed_ = objc.selector("applicationShouldTerminateAfterLastWindowClosed:");
    sel_applicationWillFinishLaunching_ = objc.selector("applicationWillFinishLaunching:");
    sel_close = objc.selector("close");
    sel_currentApplication = objc.selector("currentApplication");
    sel_init = objc.selector("init");
    sel_initWithContentRect_styleMask_backing_defer_ = objc.selector("initWithContentRect:styleMask:backing:defer:");
    sel_initWithFrame_ = objc.selector("initWithFrame:");
    sel_initWithTitle_ = objc.selector("initWithTitle:");
    sel_keyEquivalentModifierMask = objc.selector("keyEquivalentModifierMask");
    sel_localizedName = objc.selector("localizedName");
    sel_makeKeyAndOrderFront_ = objc.selector("makeKeyAndOrderFront:");
    sel_run = objc.selector("run");
    sel_separatorItem = objc.selector("separatorItem");
    sel_setActivationPolicy_ = objc.selector("setActivationPolicy:");
    sel_setContentView_ = objc.selector("setContentView:");
    sel_setDelegate_ = objc.selector("setDelegate:");
    sel_setKeyEquivalentModifierMask_ = objc.selector("setKeyEquivalentModifierMask:");
    sel_setMainMenu_ = objc.selector("setMainMenu:");
    sel_setSubmenu_ = objc.selector("setSubmenu:");
    sel_setTitle_ = objc.selector("setTitle:");
    sel_sharedApplication = objc.selector("sharedApplication");
    sel_terminate_ = objc.selector("terminate:");

    // Follows metal-cpp convention of extending NSValue with delegate implementation
    _ = objc.addMethod(class_NSValue, sel_applicationDidFinishLaunching_, applicationDidFinishLaunchingThunk, "v@:@");
    _ = objc.addMethod(class_NSValue, sel_applicationWillFinishLaunching_, applicationWillFinishLaunchingThunk, "v@:@");
    _ = objc.addMethod(class_NSValue, sel_applicationShouldTerminateAfterLastWindowClosed_, applicationShouldTerminateAfterLastWindowClosedThunk, "B@:@");
}

const Notification = foundation.ns.Notification;
const Object = foundation.ns.Object;
const String = foundation.ns.String;
const UInteger = foundation.ns.UInteger;
const Value = foundation.ns.Value;

pub const Point = cg.Point;
pub const Rect = cg.Rect;
pub const Size = cg.Size;

pub const ActivationPolicy = UInteger;
pub const ActivationPolicyRegular = 0;
pub const ActivationPolicyAccessory = 1;
pub const ActivationPolicyProhibited = 2;

pub const BackingStoreType = UInteger;
pub const BackingStoreRetained = 0;
pub const BackingStoreNonretained = 1;
pub const BackingStoreBuffered = 2;

pub const KeyEquivalentModifierMask = UInteger;
pub const EventModifierFlagCapsLock = 1 << 16;
pub const EventModifierFlagShift = 1 << 17;
pub const EventModifierFlagControl = 1 << 18;
pub const EventModifierFlagOption = 1 << 19;
pub const EventModifierFlagCommand = 1 << 20;
pub const EventModifierFlagNumericPad = 1 << 21;
pub const EventModifierFlagHelp = 1 << 22;
pub const EventModifierFlagFunction = 1 << 23;
pub const EventModifierFlagDeviceIndependentFlagsMask = 0xffff0000;

pub const WindowStyleMask = UInteger;
pub const WindowStyleMaskBorderless = 0;
pub const WindowStyleMaskTitled = (1 << 0);
pub const WindowStyleMaskClosable = (1 << 1);
pub const WindowStyleMaskMiniaturizable = (1 << 2);
pub const WindowStyleMaskResizable = (1 << 3);
pub const WindowStyleMaskTexturedBackground = (1 << 8);
pub const WindowStyleMaskUnifiedTitleAndToolbar = (1 << 12);
pub const WindowStyleMaskFullScreen = (1 << 14);
pub const WindowStyleMaskFullSizeContentView = (1 << 15);
pub const WindowStyleMaskUtilityWindow = (1 << 4);
pub const WindowStyleMaskDocModalWindow = (1 << 6);
pub const WindowStyleMaskNonactivatingPanel = (1 << 7);
pub const WindowStyleMaskHUDWindow = (1 << 13);

pub const Application = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn sharedApplication() *Application {
        return objc.msgSend(*Application, class_NSApplication, sel_sharedApplication, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn setDelegate(self: *T, delegate: ApplicationDelegate) void {
                const wrapper = Value.valueWithPointer(&delegate);
                objc.msgSend(void, self, sel_setDelegate_, .{wrapper});
            }

            pub fn setActivationPolicy(self: *T, activation_policy: ActivationPolicy) bool {
                return objc.msgSend(bool, self, sel_setActivationPolicy_, .{activation_policy});
            }

            pub fn activateIgnoringOtherApps(self: *T, ignore_other_apps: bool) void {
                objc.msgSend(void, self, sel_activateIgnoringOtherApps_, .{ignore_other_apps});
            }

            pub fn setMainMenu(self: *T, menu: *Menu) void {
                objc.msgSend(void, self, sel_setMainMenu_, .{menu});
            }

            pub fn run(self: *T) void {
                objc.msgSend(void, self, sel_run, .{});
            }

            pub fn terminate(self: *T, sender: *Object) void {
                objc.msgSend(void, self, sel_terminate_, .{sender});
            }
        };
    }
};

pub const ApplicationDelegate = struct {
    applicationWillFinishLaunching: fn (*Notification) void,
    applicationDidFinishLaunching: fn (*Notification) void,
    applicationShouldTerminateAfterLastWindowClosed: fn (*Application) bool,
};

fn applicationWillFinishLaunchingThunk(self: *Value, _: objc.SEL, notification: *Notification) callconv(.C) void {
    const delegate = self.pointerValue(ApplicationDelegate);
    delegate.applicationWillFinishLaunching(notification);
}

fn applicationDidFinishLaunchingThunk(self: *Value, _: objc.SEL, notification: *Notification) callconv(.C) void {
    const delegate = self.pointerValue(ApplicationDelegate);
    delegate.applicationDidFinishLaunching(notification);
}

fn applicationShouldTerminateAfterLastWindowClosedThunk(self: *Value, _: objc.SEL, sender: *Application) callconv(.C) bool {
    const delegate = self.pointerValue(ApplicationDelegate);
    return delegate.applicationShouldTerminateAfterLastWindowClosed(sender);
}

pub const Menu = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn alloc() *Menu {
        return objc.msgSend(*Menu, class_NSMenu, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn initWithTitle(self: *T, title: *String) *T {
                return objc.msgSend(*T, self, sel_initWithTitle_, .{title});
            }

            pub fn addItemWithTitle_action_keyEquivalent(self: *T, title: *String, selector: objc.SEL, key_equivalent: *String) *MenuItem {
                return objc.msgSend(*MenuItem, self, sel_addItemWithTitle_action_keyEquivalent_, .{ title, selector, key_equivalent });
            }

            pub fn addItem(self: *T, item: *MenuItem) void {
                objc.msgSend(void, self, sel_addItem_, .{item});
            }
        };
    }
};

pub const MenuItem = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn separatorItem() *MenuItem {
        return objc.msgSend(*MenuItem, class_NSMenuItem, sel_separatorItem, .{});
    }

    pub fn alloc() *MenuItem {
        return objc.msgSend(*MenuItem, class_NSMenuItem, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn setKeyEquivalentModifierMask(self: *T, modifier_mask: KeyEquivalentModifierMask) void {
                objc.msgSend(void, self, sel_setKeyEquivalentModifierMask_, .{modifier_mask});
            }

            pub fn keyEquivalentModifierMask(self: *T) KeyEquivalentModifierMask {
                return objc.msgSend(KeyEquivalentModifierMask, self, sel_keyEquivalentModifierMask, .{});
            }

            pub fn setSubmenu(self: *T, submenu: *Menu) void {
                objc.msgSend(void, self, sel_setSubmenu_, .{submenu});
            }
        };
    }
};

pub const RunningApplication = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn currentApplication() *RunningApplication {
        return objc.msgSend(*RunningApplication, class_NSRunningApplication, sel_currentApplication, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn localizedName(self: *T) *String {
                return objc.msgSend(*String, self, sel_localizedName, .{});
            }
        };
    }
};

pub const View = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn initWithFrame(self: *T, frame: Rect) *T {
                return objc.msg_send(*T, self, sel_initWithFrame_, .{frame});
            }
        };
    }
};

pub const Window = opaque {
    const Self = @This();
    pub const Super = Object;
    usingnamespace Methods(Self);

    pub fn alloc() *Window {
        return objc.msgSend(*Window, class_NSWindow, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            extern fn initWithContentRect_styleMask_backing_defer_workaround(_: *T, _: objc.SEL, _: *const Rect, _: WindowStyleMask, _: BackingStoreType, _: bool) callconv(.C) *T;

            pub fn initWithContentRect_styleMask_backing_defer(self: *T, content_rect: Rect, style: WindowStyleMask, backing_store_type: BackingStoreType, defer_: bool) *T {
                //return objc.msgSend(*T, self, sel_initWithContentRect_styleMask_backing_defer_, .{ content_rect, style, backing_store_type, defer_ });
                return initWithContentRect_styleMask_backing_defer_workaround(self, sel_initWithContentRect_styleMask_backing_defer_, &content_rect, style, backing_store_type, defer_);
            }

            pub fn setContentView(self: *T, content_view: *View) void {
                objc.msgSend(void, self, sel_setContentView_, .{content_view});
            }

            pub fn makeKeyAndOrderFront(self: *T, sender: ?*Object) void {
                objc.msgSend(void, self, sel_makeKeyAndOrderFront_, .{sender});
            }

            pub fn setTitle(self: *T, title: *String) void {
                objc.msgSend(void, self, sel_setTitle_, .{title});
            }

            pub fn close(self: *T) void {
                objc.msgSend(void, self, sel_close, .{});
            }
        };
    }
};
