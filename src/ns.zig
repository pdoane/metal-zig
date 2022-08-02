const std = @import("std");
const c = @import("c.zig");
const objc = @import("objc.zig");

var class_NSApplication : objc.Class = undefined;
var class_NSAutoreleasePool : objc.Class = undefined;
var class_NSArray : objc.Class = undefined;
var class_NSError : objc.Class = undefined;
var class_NSMenu : objc.Class = undefined;
var class_NSMenuItem : objc.Class = undefined;
var class_NSRunningApplication : objc.Class = undefined;
var class_NSString : objc.Class = undefined;
var class_NSValue : objc.Class = undefined;
var class_NSWindow : objc.Class = undefined;

var sel_activateIgnoringOtherApps_ : objc.SEL = undefined;
var sel_addItem_ : objc.SEL = undefined;
var sel_addItemWithTitle_action_keyEquivalent_ : objc.SEL = undefined;
var sel_addObject_ : objc.SEL = undefined;
var sel_alloc : objc.SEL = undefined;
var sel_applicationDidFinishLaunching_ : objc.SEL = undefined;
var sel_applicationShouldTerminateAfterLastWindowClosed_ : objc.SEL = undefined;
var sel_applicationWillFinishLaunching_ : objc.SEL = undefined;
var sel_array : objc.SEL = undefined;
var sel_arrayWithObject_ : objc.SEL = undefined;
var sel_autorelease : objc.SEL = undefined;
var sel_characterAtIndex_ : objc.SEL = undefined;
var sel_close : objc.SEL = undefined;
var sel_code : objc.SEL = undefined;
var sel_copy : objc.SEL = undefined;
var sel_count : objc.SEL = undefined;
var sel_cStringUsingEncoding_ : objc.SEL = undefined;
var sel_currentApplication : objc.SEL = undefined;
var sel_debugDescription : objc.SEL = undefined;
var sel_description : objc.SEL = undefined;
var sel_domain : objc.SEL = undefined;
var sel_drain : objc.SEL = undefined;
var sel_errorWithDomain_code_userInfo_ : objc.SEL = undefined;
var sel_fileSystemRepresentation : objc.SEL = undefined;
var sel_hash : objc.SEL = undefined;
var sel_init : objc.SEL = undefined;
var sel_initWithContentRect_styleMask_backing_defer_ : objc.SEL = undefined;
var sel_initWithCString_encoding_ : objc.SEL = undefined;
var sel_initWithDomain_code_userInfo_ : objc.SEL = undefined;
var sel_initWithString_ : objc.SEL = undefined;
var sel_initWithTitle_ : objc.SEL = undefined;
var sel_isEqual_ : objc.SEL = undefined;
var sel_isEqualToString_ : objc.SEL = undefined;
var sel_keyEquivalentModifierMask : objc.SEL = undefined;
var sel_length : objc.SEL = undefined;
var sel_lengthOfBytesUsingEncoding_ : objc.SEL = undefined;
var sel_localizedDescription : objc.SEL = undefined;
var sel_localizedFailureReason : objc.SEL = undefined;
var sel_localizedName : objc.SEL = undefined;
var sel_localizedRecoveryOptions : objc.SEL = undefined;
var sel_localizedRecoverySuggestion : objc.SEL = undefined;
var sel_makeKeyAndOrderFront_ : objc.SEL = undefined;
var sel_maximumLengthOfBytesUsingEncoding_ : objc.SEL = undefined;
var sel_name : objc.SEL = undefined;
var sel_object : objc.SEL = undefined;
var sel_objectAtIndex_ : objc.SEL = undefined;
var sel_pointerValue : objc.SEL = undefined;
var sel_release : objc.SEL = undefined;
var sel_retain : objc.SEL = undefined;
var sel_retainCount : objc.SEL = undefined;
var sel_run : objc.SEL = undefined;
var sel_separatorItem : objc.SEL = undefined;
var sel_setActivationPolicy_ : objc.SEL = undefined;
var sel_setDelegate_ : objc.SEL = undefined;
var sel_setKeyEquivalentModifierMask_ : objc.SEL = undefined;
var sel_setMainMenu_ : objc.SEL = undefined;
var sel_setSubmenu_ : objc.SEL = undefined;
var sel_setTitle_ : objc.SEL = undefined;
var sel_sharedApplication : objc.SEL = undefined;
var sel_showPools : objc.SEL = undefined;
var sel_string : objc.SEL = undefined;
var sel_stringByAppendingString_ : objc.SEL = undefined;
var sel_stringWithCString_encoding_ : objc.SEL = undefined;
var sel_stringWithString_ : objc.SEL = undefined;
var sel_terminate_ : objc.SEL = undefined;
var sel_userInfo : objc.SEL = undefined;
var sel_utf8String : objc.SEL = undefined;
var sel_valueWithPointer_ : objc.SEL = undefined;
var sel_windows : objc.SEL = undefined;

pub fn init() void {
    class_NSApplication = objc.class("NSApplication");
    class_NSArray = objc.class("NSArray");
    class_NSAutoreleasePool = objc.class("NSAutoreleasePool");
    class_NSError = objc.class("NSError");
    class_NSMenu = objc.class("NSMenu");
    class_NSMenuItem = objc.class("NSMenuItem");
    class_NSRunningApplication = objc.class("NSRunningApplication");
    class_NSString = objc.class("NSString");
    class_NSValue = objc.class("NSValue");
    class_NSWindow = objc.class("NSWindow");

    sel_activateIgnoringOtherApps_ = objc.selector("activateIgnoringOtherApps:");
    sel_addItem_ = objc.selector("addItem:");
    sel_addItemWithTitle_action_keyEquivalent_ = objc.selector("addItemWithTitle:action:keyEquivalent:");
    sel_addObject_ = objc.selector("addObject:");
    sel_alloc = objc.selector("alloc");
    sel_applicationDidFinishLaunching_ = objc.selector("applicationDidFinishLaunching:");
    sel_applicationShouldTerminateAfterLastWindowClosed_ = objc.selector("applicationShouldTerminateAfterLastWindowClosed:");
    sel_applicationWillFinishLaunching_ = objc.selector("applicationWillFinishLaunching:");
    sel_array = objc.selector("array");
    sel_arrayWithObject_ = objc.selector("arrayWithObject:");
    sel_autorelease = objc.selector("autorelease");
    sel_characterAtIndex_ = objc.selector("characterAtIndex:");
    sel_close = objc.selector("close");
    sel_code = objc.selector("code");
    sel_copy = objc.selector("copy");
    sel_count = objc.selector("count");
    sel_cStringUsingEncoding_ = objc.selector("cStringUsingEncoding:");
    sel_currentApplication = objc.selector("currentApplication");
    sel_debugDescription = objc.selector("debugDescription");
    sel_description = objc.selector("description");
    sel_domain = objc.selector("domain");
    sel_drain = objc.selector("drain");
    sel_errorWithDomain_code_userInfo_ = objc.selector("errorWithDomain:code:userInfo:");
    sel_fileSystemRepresentation = objc.selector("fileSystemRepresentation");
    sel_hash = objc.selector("hash");
    sel_init = objc.selector("init");
    sel_initWithContentRect_styleMask_backing_defer_ = objc.selector("initWithContentRect:styleMask:backing:defer:");
    sel_initWithCString_encoding_ = objc.selector("initWithCString:encoding:");
    sel_initWithDomain_code_userInfo_ = objc.selector("initWithDomain:code:userInfo:");
    sel_initWithString_ = objc.selector("initWithString:");
    sel_initWithTitle_ = objc.selector("initWithTitle:");
    sel_isEqual_ = objc.selector("isEqual:");
    sel_isEqualToString_ = objc.selector("isEqualToString:");
    sel_keyEquivalentModifierMask = objc.selector("keyEquivalentModifierMask");
    sel_length = objc.selector("length");
    sel_lengthOfBytesUsingEncoding_ = objc.selector("lengthOfBytesUsingEncoding:");
    sel_localizedDescription = objc.selector("localizedDescription");
    sel_localizedFailureReason = objc.selector("localizedFailureReason");
    sel_localizedName = objc.selector("localizedName");
    sel_localizedRecoveryOptions = objc.selector("localizedRecoveryOptions");
    sel_localizedRecoverySuggestion = objc.selector("localizedRecoverySuggestion");
    sel_makeKeyAndOrderFront_ = objc.selector("makeKeyAndOrderFront:");
    sel_maximumLengthOfBytesUsingEncoding_ = objc.selector("maximumLengthOfBytesUsingEncoding:");
    sel_name = objc.selector("name");
    sel_object = objc.selector("object");
    sel_objectAtIndex_ = objc.selector("objectAtIndex:");
    sel_pointerValue = objc.selector("pointerValue");
    sel_release = objc.selector("release");
    sel_retain = objc.selector("retain");
    sel_retainCount = objc.selector("retainCount");
    sel_run = objc.selector("run");
    sel_separatorItem = objc.selector("separatorItem");
    sel_setActivationPolicy_ = objc.selector("setActivationPolicy:");
    sel_setDelegate_ = objc.selector("setDelegate:");
    sel_setKeyEquivalentModifierMask_ = objc.selector("setKeyEquivalentModifierMask:");
    sel_setMainMenu_ = objc.selector("setMainMenu:");
    sel_setSubmenu_ = objc.selector("setSubmenu:");
    sel_setTitle_ = objc.selector("setTitle:");
    sel_sharedApplication = objc.selector("sharedApplication");
    sel_showPools = objc.selector("showPools");
    sel_string = objc.selector("string");
    sel_stringByAppendingString_ = objc.selector("stringByAppendingString:");
    sel_stringWithCString_encoding_ = objc.selector("stringWithCString:encoding:");
    sel_stringWithString_ = objc.selector("stringWithString:");
    sel_terminate_ = objc.selector("terminate:");
    sel_userInfo = objc.selector("userInfo");
    sel_utf8String = objc.selector("UTF8String");
    sel_valueWithPointer_ = objc.selector("valueWithPointer:");
    sel_windows = objc.selector("windows");

    // Follows metal-cpp convention of extending NSValue with delegate implementation
    _ = objc.addMethod(class_NSValue, sel_applicationDidFinishLaunching_, applicationDidFinishLaunchingThunk, "v@:@");
    _ = objc.addMethod(class_NSValue, sel_applicationWillFinishLaunching_, applicationWillFinishLaunchingThunk, "v@:@");
    _ = objc.addMethod(class_NSValue, sel_applicationShouldTerminateAfterLastWindowClosed_, applicationShouldTerminateAfterLastWindowClosedThunk, "B@:@");
}

pub const unichar = u16;
pub const Integer = isize;
pub const UInteger = usize;
pub const Point = c.CGPoint;
pub const Size = c.CGSize;
pub const Rect = c.CGRect;

pub const ActivationPolicy = UInteger;
pub const ActivationPolicyRegular : UInteger = 0;
pub const ActivationPolicyAccessory : UInteger = 1;
pub const ActivationPolicyProhibited : UInteger = 2;

pub const BackingStoreType = UInteger;
pub const BackingStoreRetained : UInteger = 0;
pub const BackingStoreNonretained : UInteger = 1;
pub const BackingStoreBuffered : UInteger = 2;

// TODO - how to do String constants
pub const ErrorDomain = *String;
const CocoaErrorDomain : ErrorDomain = undefined;
const POSIXErrorDomain : ErrorDomain = undefined;
const OSStatusErrorDomain : ErrorDomain = undefined;
const MachErrorDomain : ErrorDomain = undefined;

pub const KeyEquivalentModifierMask = UInteger;
pub const EventModifierFlagCapsLock : UInteger = 1 << 16;
pub const EventModifierFlagShift : UInteger = 1 << 17;
pub const EventModifierFlagControl : UInteger = 1 << 18;
pub const EventModifierFlagOption : UInteger = 1 << 19;
pub const EventModifierFlagCommand : UInteger = 1 << 20;
pub const EventModifierFlagNumericPad : UInteger = 1 << 21;
pub const EventModifierFlagHelp : UInteger = 1 << 22;
pub const EventModifierFlagFunction : UInteger = 1 << 23;
pub const EventModifierFlagDeviceIndependentFlagsMask : UInteger = 0xffff0000;

pub const StringEncoding = UInteger;
pub const ASCIIStringEncoding : UInteger = 1;
pub const NEXTSTEPStringEncoding : UInteger = 2;
pub const JapaneseEUCStringEncoding : UInteger = 3;
pub const UTF8StringEncoding : UInteger = 4;
pub const ISOLatin1StringEncoding : UInteger = 5;
pub const SymbolStringEncoding : UInteger = 6;
pub const NonLossyASCIIStringEncoding : UInteger = 7;
pub const ShiftJISStringEncoding : UInteger = 8;
pub const ISOLatin2StringEncoding : UInteger = 9;
pub const UnicodeStringEncoding : UInteger = 10;
pub const WindowsCP1251StringEncoding : UInteger = 11;
pub const WindowsCP1252StringEncoding : UInteger = 12;
pub const WindowsCP1253StringEncoding : UInteger = 13;
pub const WindowsCP1254StringEncoding : UInteger = 14;
pub const WindowsCP1250StringEncoding : UInteger = 15;
pub const ISO2022JPStringEncoding : UInteger = 21;
pub const MacOSRomanStringEncoding : UInteger = 30;
pub const UTF16StringEncoding = UnicodeStringEncoding;
pub const UTF16BigEndianStringEncoding : UInteger = 0x90000100;
pub const UTF16LittleEndianStringEncoding : UInteger = 0x94000100;
pub const UTF32StringEncoding : UInteger = 0x8c000100;
pub const UTF32BigEndianStringEncoding : UInteger = 0x98000100;
pub const UTF32LittleEndianStringEncoding : UInteger = 0x9c000100;

pub const WindowStyleMask = UInteger;
pub const WindowStyleMaskBorderless : UInteger = 0;
pub const WindowStyleMaskTitled : UInteger = ( 1 << 0 );
pub const WindowStyleMaskClosable : UInteger = ( 1 << 1 );
pub const WindowStyleMaskMiniaturizable : UInteger = ( 1 << 2 );
pub const WindowStyleMaskResizable : UInteger = ( 1 << 3 );
pub const WindowStyleMaskTexturedBackground : UInteger = ( 1 << 8 );
pub const WindowStyleMaskUnifiedTitleAndToolbar : UInteger = ( 1 << 12 );
pub const WindowStyleMaskFullScreen : UInteger = ( 1 << 14 );
pub const WindowStyleMaskFullSizeContentView : UInteger = ( 1 << 15 );
pub const WindowStyleMaskUtilityWindow : UInteger = ( 1 << 4 );
pub const WindowStyleMaskDocModalWindow : UInteger = ( 1 << 6 );
pub const WindowStyleMaskNonactivatingPanel : UInteger  = ( 1 << 7 );
pub const WindowStyleMaskHUDWindow : UInteger = ( 1 << 13 );

pub const Application = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Application methods
    pub fn sharedApplication() *Application {
        return objc.msgSend(*Application, class_NSApplication, sel_sharedApplication, .{});
    }

    pub fn setDelegate(self: *Self, del: ApplicationDelegate) void {
        const wrapper = Value.valueWithPointer(&del);
        objc.msgSend(void, self, sel_setDelegate_, .{ wrapper });
    }

    pub fn setActivationPolicy(self: *Self, activationPolicy: ActivationPolicy) bool {
        return objc.msgSend(bool, self, sel_setActivationPolicy_, .{ activationPolicy });
    }

    pub fn activateIgnoringOtherApps(self: *Self, ignoreOtherApps: bool) void {
        objc.msgSend(void, self, sel_activateIgnoringOtherApps_, .{ ignoreOtherApps });
    }

    pub fn setMainMenu(self: *Self, menu: *Menu) void {
        objc.msgSend(void, self, sel_setMainMenu_, .{ menu });
    }

    pub fn run(self: *Self) void {
        objc.msgSend(void, self, sel_run, .{});
    }

    pub fn terminate(self: *Self, sender: *Object) void {
        objc.msgSend(void, self, sel_terminate_, .{ sender });
    }
};

pub const ApplicationDelegate = struct {
    applicationWillFinishLaunching : fn (*Notification) void,
    applicationDidFinishLaunching : fn (*Notification) void,
    applicationShouldTerminateAfterLastWindowClosed: fn (*Application) bool,
};

fn applicationWillFinishLaunchingThunk(self: *Value, _: objc.SEL, notification: *Notification) callconv(.C) void {
    const del = self.pointerValue(ApplicationDelegate);
    del.applicationWillFinishLaunching(notification);
}

fn applicationDidFinishLaunchingThunk(self: *Value, _: objc.SEL, notification: *Notification) callconv(.C) void {
    const del = self.pointerValue(ApplicationDelegate);
    del.applicationDidFinishLaunching(notification);
}

fn applicationShouldTerminateAfterLastWindowClosedThunk(self: *Value, _: objc.SEL, sender: *Application) callconv(.C) bool {
    const del = self.pointerValue(ApplicationDelegate);
    return del.applicationShouldTerminateAfterLastWindowClosed(sender);
}

pub const Array = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Copying methods
    pub fn copy(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_copy, .{});
    }

    // Array methods
    pub fn array() *Array {
        return objc.msgSend(*Array, class_NSArray, sel_array, .{});
    }

    pub fn arrayWithObject(object: *Object) *Array {
        return objc.msgSend(*Array, class_NSArray, sel_arrayWithObject_, .{ object } );
    }

    // arrayWithObjects_count

    pub fn alloc() *Array {
        return objc.msgSend(*Array, class_NSArray, sel_alloc, .{});
    }

    pub fn init(self: *Self) *Array {
        return objc.msgSend(*Array, self, sel_init, .{});
    }

    // initWithObjects_count

    pub fn count(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_count);
    }

    pub fn objectAtIndex(self: *Self, comptime ReturnType: type, index: UInteger) *ReturnType {
        return objc.msgSend(*ReturnType, self, sel_objectAtIndex_, .{ index });
    }
};

pub const AutoreleasePool = opaque {
    const Self = @This();

    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // AutoreleasePool methods
    pub fn alloc() *AutoreleasePool {
        return objc.msgSend(*AutoreleasePool, class_NSAutoreleasePool, sel_alloc, .{});
    }

    pub fn init(self: *Self) *AutoreleasePool {
        return objc.msgSend(*AutoreleasePool, self, sel_init, .{});
    }

    pub fn drain(self: *Self) void {
        objc.msgSend(void, self, sel_drain, .{});
    }

    pub fn addObject(self: *Self, object: *Object) void {
        objc.msgSend(void, self, sel_addObject_, .{ object });
    }

    pub fn showPools(self: *Self) void {
        objc.msgSend(void, self, sel_showPools, .{});
    }
};

pub const Dictionary = opaque {
    const Self = @This();

    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Copying methods
    pub fn copy(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_copy, .{});
    }

    // Dictionary methods
    // TODO
};

pub const Error = opaque {
    const Self = @This();

    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Copying methods
    pub fn copy(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_copy, .{});
    }

    // Error methods
    pub fn errorWithDomain_code_userInfo(domain_: ErrorDomain, code_: Integer, userInfo_: *Dictionary) *Error {
        return objc.msgSend(*Error, class_NSError, sel_errorWithDomain_code_userInfo_, .{ domain_, code_, userInfo_ });
    }

    pub fn alloc() *Error {
        return objc.msgSend(*Error, class_NSError, sel_alloc, .{});
    }

    pub fn init(self: *Self) *Error {
        return objc.msgSend(*Error, self, sel_init, .{});
    }

    pub fn initWithDomain_code_userInfo(self: *Self, domain_: ErrorDomain, code_: Integer, userInfo_: *Dictionary) *Error {
        return objc.msgSend(*Error, self, sel_initWithDomain_code_userInfo_, .{ domain_, code_, userInfo_ });
    }

    pub fn code(self: *Self) Integer {
        return objc.msgSend(Integer, self, sel_code, .{});
    }

    pub fn domain(self: *Self) ErrorDomain {
        return objc.msgSend(ErrorDomain, self, sel_domain, .{});
    }

    pub fn userInfo(self: *Self) *Dictionary {
        return objc.msgSend(*Dictionary, self, sel_userInfo, .{});
    }

    pub fn localizedDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_localizedDescription, .{});
    }

    pub fn localizedRecoveryOptions(self: *Self) *Array {
        return objc.msgSend(*Array, self, sel_localizedRecoveryOptions, .{});
    }

    pub fn localizedRecoverySuggestion(self: *Self) *String {
        return objc.msgSend(*String, self, sel_localizedRecoverySuggestion, .{});
    }

    pub fn localizedFailureReason(self: *Self) *String {
        return objc.msgSend(*String, self, sel_localizedFailureReason, .{});
    }
};

pub const Menu = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Menu methods
    pub fn alloc() *Menu {
        return objc.msgSend(*Menu, class_NSMenu, sel_alloc, .{});
    }

    pub fn init(self: *Self) *Menu {
        return objc.msgSend(*Self, self, sel_init, .{});
    }

    pub fn initWithTitle(self: *Self, title: *String) *Menu {
        return objc.msgSend(*Self, self, sel_initWithTitle_, .{ title });
    }

    pub fn addItemWithTitle_action_keyEquivalent(self: *Self, title: *String, selector: objc.SEL, keyEquivalent: *String) *MenuItem {
        return objc.msgSend(*MenuItem, self, sel_addItemWithTitle_action_keyEquivalent_, .{ title, selector, keyEquivalent });
    }

    pub fn addItem(self: *Self, item: *MenuItem) void {
        objc.msgSend(void, self, sel_addItem_, .{ item });
    }
};

pub const MenuItem = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }
    
    // MenuItem methods
    pub fn separatorItem() *MenuItem {
        return objc.msgSend(*MenuItem, class_NSMenuItem, sel_separatorItem, .{});
    }

    pub fn alloc() *MenuItem {
        return objc.msgSend(*MenuItem, class_NSMenuItem, sel_alloc, .{});
    }

    pub fn init(self: *Self) *MenuItem {
        return objc.msgSend(*MenuItem, self, sel_init, .{});
    }

    pub fn setKeyEquivalentModifierMask(self: *Self, modifierMask: KeyEquivalentModifierMask) void {
        objc.msgSend(void, self, sel_setKeyEquivalentModifierMask_, .{ modifierMask });
    }

    pub fn keyEquivalentModifierMask(self: *Self) KeyEquivalentModifierMask {
        return objc.msgSend(KeyEquivalentModifierMask, self, sel_keyEquivalentModifierMask, .{});
    }

    pub fn setSubmenu(self: *Self, submenu: *Menu) void {
        objc.msgSend(void, self, sel_setSubmenu_, .{ submenu });
    }
};

pub const Notification = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object_: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object_ });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Notification methods
    pub fn name(self: *Self) *String {
        return objc.msgSend(*String, self, sel_name, .{});
    }

    pub fn object(self: *Self) ?*Object {
        return objc.msgSend(*Object, self, sel_object, .{});
    }

    // userInfo
};

pub const Object = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }
};

pub const RunningApplication = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // RunningApplication methods
    pub fn currentApplication() *RunningApplication {
        return objc.msgSend(*RunningApplication, class_NSRunningApplication, sel_currentApplication, .{});
    }

    pub fn localizedName(self: *Self) *String {
        return objc.msgSend(*String, self, sel_localizedName, .{});
    }
};

pub const String = opaque {
    const Self = @This();

    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Copying methods
    pub fn copy(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_copy, .{});
    }

    // String methods
    pub fn string() *String {
        return objc.msgSend(*String, class_NSString, sel_string, .{});
    }

    pub fn stringWithString(str: *String) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithString_, .{ str });
    }

    pub fn stringWithCString_encoding(str: [c]*const u8, encoding: StringEncoding) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithCString_encoding_, .{ str, encoding });
    }

    pub fn stringWithZigString(str:[*:0]const u8) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithCString_encoding_, .{ str, UTF8StringEncoding });
    }

    pub fn alloc() *String {
        return objc.msgSend(*String, class_NSString, sel_alloc, .{});
    }

    pub fn init(self: *Self) *String {
        return objc.msgSend(*String, self, sel_init, .{});
    }

    pub fn initWithString(self: *Self, str: *String) *String {
        return objc.msgSend(*String, self, sel_initWithString_, .{ str });
    }

    pub fn initWithCString_encoding(self: *Self, str: [c]*const u8, encoding: StringEncoding) *String {
        return objc.msgSend(*String, self, sel_initWithCString_encoding_, .{ str, encoding });
    }

    pub fn initWithZigString(self: *Self, str: [*:0]*const u8) *String {
        return objc.msgSend(*String, self, sel_initWithCString_encoding_, .{ str, UTF8StringEncoding });
    }

    // initWithBytesNoCopy_length_encoding_freeWhenDone_

    pub fn characterAtIndex(self: *Self, index: UInteger) unichar {
        return objc.msgSend(unichar, self, sel_characterAtIndex_, .{ index });
    }

    pub fn length(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_length, .{});
    }

    pub fn cStringUsingEncoding(self: *Self, encoding: StringEncoding) [c]*const u8 {
        return objc.msgSend([c]*const u8, self, sel_cStringUsingEncoding_, .{ encoding });
    }

    pub fn utf8String(self: *Self) [*c]const u8 {
        return objc.msgSend([*c]const u8, self, sel_utf8String, .{});
    }

    pub fn maximumLengthOfBytesUsingEncoding(self: *Self, encoding: StringEncoding) UInteger {
        return objc.msgSend(UInteger, self, sel_maximumLengthOfBytesUsingEncoding_, .{ encoding });
    }

    pub fn lengthOfBytesUsingEncoding(self: *Self, encoding: StringEncoding) UInteger {
        return objc.msgSend(UInteger, self, sel_lengthOfBytesUsingEncoding_, .{ encoding });
    }

    pub fn isEqualToString(self: *Self, str: *String) bool {
        return objc.msgSend(bool, self, sel_isEqualToString_, .{ str });
    }

    // rangeOfString_options

    pub fn fileSystemRepresentation(self: *Self) [c]*const u8 {
        return objc.msgSend([c]*const u8, self, sel_fileSystemRepresentation, .{});
    }

    pub fn stringByAppendingString(self: *Self, str: *String) *String {
        return objc.msgSend(*String, self, sel_stringByAppendingString_, .{ str });
    }
};

pub const Value = opaque {
    const Self = @This();
    
    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Copying methods
    pub fn copy(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_copy, .{});
    }
    
    // Value methods
    pub fn valueWithPointer(pointer: *const anyopaque) *Value {
        return objc.msgSend(*Value, class_NSValue, sel_valueWithPointer_, .{pointer});
    }

    pub fn pointerValue(self: *Self, comptime ReturnType: type) *ReturnType {
        return objc.msgSend(*ReturnType, self, sel_pointerValue, .{});
    }
};

extern fn initWithContentRect_styleMask_backing_defer_workaround(_ : *Window, _: objc.SEL, _:*const c.CGRect, _:WindowStyleMask, _:BackingStoreType, _:bool) callconv(.C) *Window;

pub const Window = opaque {
    const Self = @This();

    // Object methods
    pub fn hash(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_hash, .{});
    }

    pub fn isEqual(self: *Self, object: *Object) bool {
        return objc.msgSend(bool, self, sel_isEqual_, .{ object });
    }

    pub fn description(self: *Self) *String {
        return objc.msgSend(*String, self, sel_description, .{});
    }

    pub fn debugDescription(self: *Self) *String {
        return objc.msgSend(*String, self, sel_debugDescription, .{});
    }

    // Referencing methods
    pub fn retain(self: *Self) *Self {
        return objc.msgSend(*Self, self, sel_retain, .{});
    }

    pub fn release(self: *Self) void {
        objc.msgSend(void, self, sel_release, .{});
    }

    pub fn autorelease(self: *Self) *Self {
        return objc.msgSend(void, self, sel_autorelease, .{});
    }

    pub fn retainCount(self: *Self) UInteger {
        return objc.msgSend(UInteger, self, sel_retainCount, .{});
    }

    // Window methods    
    pub fn alloc() *Window {
        return objc.msgSend(*Window, class_NSWindow, sel_alloc, .{});
    }

    pub fn initWithContentRect_styleMask_backing_defer(self: *Self, contentRect: c.CGRect, style: WindowStyleMask, backingStoreType: BackingStoreType, defer_: bool) *Window {
        //return objc.msgSend(*Window, self, sel_initWithContentRect_styleMask_backing_defer_, .{ contentRect, style, backingStoreType, defer_ });
        return initWithContentRect_styleMask_backing_defer_workaround(self, sel_initWithContentRect_styleMask_backing_defer_, &contentRect, style, backingStoreType, defer_);
    }

    // setContentView

    pub fn makeKeyAndOrderFront(self: *Self, sender: ?*Object) void {
        objc.msgSend(void, self, sel_makeKeyAndOrderFront_, .{ sender });
    }

    pub fn setTitle(self: *Self, title: *String) void {
        objc.msgSend(void, self, sel_setTitle_, .{ title });
    }

    pub fn close(self: *Self) void {
        objc.msgSend(void, self, sel_close, .{});
    }
};
