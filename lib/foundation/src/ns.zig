const std = @import("std");
const c = @import("c.zig");
const objc = @import("objc.zig");

var class_NSArray: objc.Class = undefined;
var class_NSAutoreleasePool: objc.Class = undefined;
var class_NSError: objc.Class = undefined;
var class_NSString: objc.Class = undefined;
var class_NSValue: objc.Class = undefined;

var sel_addObject_: objc.SEL = undefined;
var sel_alloc: objc.SEL = undefined;
var sel_array: objc.SEL = undefined;
var sel_arrayWithObject_: objc.SEL = undefined;
var sel_autorelease: objc.SEL = undefined;
var sel_characterAtIndex_: objc.SEL = undefined;
var sel_code: objc.SEL = undefined;
var sel_copy: objc.SEL = undefined;
var sel_count: objc.SEL = undefined;
var sel_cStringUsingEncoding_: objc.SEL = undefined;
var sel_debugDescription: objc.SEL = undefined;
var sel_description: objc.SEL = undefined;
var sel_domain: objc.SEL = undefined;
var sel_drain: objc.SEL = undefined;
var sel_errorWithDomain_code_userInfo_: objc.SEL = undefined;
var sel_fileSystemRepresentation: objc.SEL = undefined;
var sel_hash: objc.SEL = undefined;
var sel_init: objc.SEL = undefined;
var sel_initWithCString_encoding_: objc.SEL = undefined;
var sel_initWithDomain_code_userInfo_: objc.SEL = undefined;
var sel_initWithString_: objc.SEL = undefined;
var sel_isEqual_: objc.SEL = undefined;
var sel_isEqualToString_: objc.SEL = undefined;
var sel_length: objc.SEL = undefined;
var sel_lengthOfBytesUsingEncoding_: objc.SEL = undefined;
var sel_localizedDescription: objc.SEL = undefined;
var sel_localizedFailureReason: objc.SEL = undefined;
var sel_localizedName: objc.SEL = undefined;
var sel_localizedRecoveryOptions: objc.SEL = undefined;
var sel_localizedRecoverySuggestion: objc.SEL = undefined;
var sel_maximumLengthOfBytesUsingEncoding_: objc.SEL = undefined;
var sel_name: objc.SEL = undefined;
var sel_object: objc.SEL = undefined;
var sel_objectAtIndex_: objc.SEL = undefined;
var sel_pointerValue: objc.SEL = undefined;
var sel_release: objc.SEL = undefined;
var sel_retain: objc.SEL = undefined;
var sel_retainCount: objc.SEL = undefined;
var sel_showPools: objc.SEL = undefined;
var sel_string: objc.SEL = undefined;
var sel_stringByAppendingString_: objc.SEL = undefined;
var sel_stringWithCString_encoding_: objc.SEL = undefined;
var sel_stringWithString_: objc.SEL = undefined;
var sel_userInfo: objc.SEL = undefined;
var sel_utf8String: objc.SEL = undefined;
var sel_valueWithPointer_: objc.SEL = undefined;

pub fn _foundation_init() void {
    class_NSArray = objc.class("NSArray");
    class_NSAutoreleasePool = objc.class("NSAutoreleasePool");
    class_NSError = objc.class("NSError");
    class_NSString = objc.class("NSString");
    class_NSValue = objc.class("NSValue");

    sel_addObject_ = objc.selector("addObject:");
    sel_alloc = objc.selector("alloc");
    sel_array = objc.selector("array");
    sel_arrayWithObject_ = objc.selector("arrayWithObject:");
    sel_autorelease = objc.selector("autorelease");
    sel_characterAtIndex_ = objc.selector("characterAtIndex:");
    sel_code = objc.selector("code");
    sel_copy = objc.selector("copy");
    sel_count = objc.selector("count");
    sel_cStringUsingEncoding_ = objc.selector("cStringUsingEncoding:");
    sel_debugDescription = objc.selector("debugDescription");
    sel_description = objc.selector("description");
    sel_domain = objc.selector("domain");
    sel_drain = objc.selector("drain");
    sel_errorWithDomain_code_userInfo_ = objc.selector("errorWithDomain:code:userInfo:");
    sel_fileSystemRepresentation = objc.selector("fileSystemRepresentation");
    sel_hash = objc.selector("hash");
    sel_init = objc.selector("init");
    sel_initWithCString_encoding_ = objc.selector("initWithCString:encoding:");
    sel_initWithDomain_code_userInfo_ = objc.selector("initWithDomain:code:userInfo:");
    sel_initWithString_ = objc.selector("initWithString:");
    sel_isEqual_ = objc.selector("isEqual:");
    sel_isEqualToString_ = objc.selector("isEqualToString:");
    sel_length = objc.selector("length");
    sel_lengthOfBytesUsingEncoding_ = objc.selector("lengthOfBytesUsingEncoding:");
    sel_localizedDescription = objc.selector("localizedDescription");
    sel_localizedFailureReason = objc.selector("localizedFailureReason");
    sel_localizedName = objc.selector("localizedName");
    sel_localizedRecoveryOptions = objc.selector("localizedRecoveryOptions");
    sel_localizedRecoverySuggestion = objc.selector("localizedRecoverySuggestion");
    sel_maximumLengthOfBytesUsingEncoding_ = objc.selector("maximumLengthOfBytesUsingEncoding:");
    sel_name = objc.selector("name");
    sel_object = objc.selector("object");
    sel_objectAtIndex_ = objc.selector("objectAtIndex:");
    sel_pointerValue = objc.selector("pointerValue");
    sel_release = objc.selector("release");
    sel_retain = objc.selector("retain");
    sel_retainCount = objc.selector("retainCount");
    sel_showPools = objc.selector("showPools");
    sel_string = objc.selector("string");
    sel_stringByAppendingString_ = objc.selector("stringByAppendingString:");
    sel_stringWithCString_encoding_ = objc.selector("stringWithCString:encoding:");
    sel_stringWithString_ = objc.selector("stringWithString:");
    sel_userInfo = objc.selector("userInfo");
    sel_utf8String = objc.selector("UTF8String");
    sel_valueWithPointer_ = objc.selector("valueWithPointer:");
}

pub const unichar = u16;
pub const Integer = isize;
pub const UInteger = usize;
pub const Point = c.CGPoint;
pub const Size = c.CGSize;
pub const Rect = c.CGRect;

// TODO - how to do String constants
pub const ErrorDomain = *String;
const CocoaErrorDomain: ErrorDomain = undefined;
const POSIXErrorDomain: ErrorDomain = undefined;
const OSStatusErrorDomain: ErrorDomain = undefined;
const MachErrorDomain: ErrorDomain = undefined;

pub const StringEncoding = UInteger;
pub const ASCIIStringEncoding: UInteger = 1;
pub const NEXTSTEPStringEncoding: UInteger = 2;
pub const JapaneseEUCStringEncoding: UInteger = 3;
pub const UTF8StringEncoding: UInteger = 4;
pub const ISOLatin1StringEncoding: UInteger = 5;
pub const SymbolStringEncoding: UInteger = 6;
pub const NonLossyASCIIStringEncoding: UInteger = 7;
pub const ShiftJISStringEncoding: UInteger = 8;
pub const ISOLatin2StringEncoding: UInteger = 9;
pub const UnicodeStringEncoding: UInteger = 10;
pub const WindowsCP1251StringEncoding: UInteger = 11;
pub const WindowsCP1252StringEncoding: UInteger = 12;
pub const WindowsCP1253StringEncoding: UInteger = 13;
pub const WindowsCP1254StringEncoding: UInteger = 14;
pub const WindowsCP1250StringEncoding: UInteger = 15;
pub const ISO2022JPStringEncoding: UInteger = 21;
pub const MacOSRomanStringEncoding: UInteger = 30;
pub const UTF16StringEncoding = UnicodeStringEncoding;
pub const UTF16BigEndianStringEncoding: UInteger = 0x90000100;
pub const UTF16LittleEndianStringEncoding: UInteger = 0x94000100;
pub const UTF32StringEncoding: UInteger = 0x8c000100;
pub const UTF32BigEndianStringEncoding: UInteger = 0x98000100;
pub const UTF32LittleEndianStringEncoding: UInteger = 0x9c000100;

pub const Array = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn array() *Array {
        return objc.msgSend(*Array, class_NSArray, sel_array, .{});
    }

    pub fn arrayWithObject(object: *Object) *Array {
        return objc.msgSend(*Array, class_NSArray, sel_arrayWithObject_, .{object});
    }

    // arrayWithObjects_count

    pub fn alloc() *Array {
        return objc.msgSend(*Array, class_NSArray, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            // initWithObjects_count

            pub fn count(self: *T) UInteger {
                return objc.msgSend(UInteger, self, sel_count);
            }

            pub fn objectAtIndex(self: *T, comptime ReturnType: type, index: UInteger) *ReturnType {
                return objc.msgSend(*ReturnType, self, sel_objectAtIndex_, .{index});
            }
        };
    }
};

pub const AutoreleasePool = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn alloc() *AutoreleasePool {
        return objc.msgSend(*AutoreleasePool, class_NSAutoreleasePool, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn drain(self: *T) void {
                objc.msgSend(void, self, sel_drain, .{});
            }

            pub fn addObject(self: *T, object: *Object) void {
                objc.msgSend(void, self, sel_addObject_, .{object});
            }

            pub fn showPools(self: *T) void {
                objc.msgSend(void, self, sel_showPools, .{});
            }
        };
    }
};

pub const Dictionary = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);

    // TODO
};

pub const Error = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn errorWithDomain_code_userInfo(domain_: ErrorDomain, code_: Integer, userInfo_: *Dictionary) *Error {
        return objc.msgSend(*Error, class_NSError, sel_errorWithDomain_code_userInfo_, .{ domain_, code_, userInfo_ });
    }

    pub fn alloc() *Error {
        return objc.msgSend(*Error, class_NSError, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn init(self: *T) *T {
                return objc.msgSend(*Error, self, sel_init, .{});
            }

            pub fn initWithDomain_code_userInfo(self: *T, domain_: ErrorDomain, code_: Integer, userInfo_: *Dictionary) *T {
                return objc.msgSend(*T, self, sel_initWithDomain_code_userInfo_, .{ domain_, code_, userInfo_ });
            }

            pub fn code(self: *T) Integer {
                return objc.msgSend(Integer, self, sel_code, .{});
            }

            pub fn domain(self: *T) ErrorDomain {
                return objc.msgSend(ErrorDomain, self, sel_domain, .{});
            }

            pub fn userInfo(self: *T) *Dictionary {
                return objc.msgSend(*Dictionary, self, sel_userInfo, .{});
            }

            pub fn localizedDescription(self: *T) *String {
                return objc.msgSend(*String, self, sel_localizedDescription, .{});
            }

            pub fn localizedRecoveryOptions(self: *T) *Array {
                return objc.msgSend(*Array, self, sel_localizedRecoveryOptions, .{});
            }

            pub fn localizedRecoverySuggestion(self: *T) *String {
                return objc.msgSend(*String, self, sel_localizedRecoverySuggestion, .{});
            }

            pub fn localizedFailureReason(self: *T) *String {
                return objc.msgSend(*String, self, sel_localizedFailureReason, .{});
            }
        };
    }
};

pub const Notification = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn name(self: *T) *String {
                return objc.msgSend(*String, self, sel_name, .{});
            }

            pub fn object(self: *T) ?*Object {
                return objc.msgSend(*Object, self, sel_object, .{});
            }

            // userInfo
        };
    }
};

pub const Object = opaque {
    const Self = @This();
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn hash(self: *T) UInteger {
                return objc.msgSend(UInteger, self, sel_hash, .{});
            }

            pub fn isEqual(self: *T, object: *Object) bool {
                return objc.msgSend(bool, self, sel_isEqual_, .{object});
            }

            pub fn description(self: *T) *String {
                return objc.msgSend(*String, self, sel_description, .{});
            }

            pub fn debugDescription(self: *T) *String {
                return objc.msgSend(*String, self, sel_debugDescription, .{});
            }

            pub fn retain(self: *T) *T {
                return objc.msgSend(*T, self, sel_retain, .{});
            }

            pub fn release(self: *T) void {
                objc.msgSend(void, self, sel_release, .{});
            }

            pub fn autorelease(self: *T) *T {
                return objc.msgSend(void, self, sel_autorelease, .{});
            }

            pub fn retainCount(self: *T) UInteger {
                return objc.msgSend(UInteger, self, sel_retainCount, .{});
            }

            pub fn copy(self: *Self) *Self {
                return objc.msgSend(*Self, self, sel_copy, .{});
            }
        };
    }
};

pub const String = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn string() *String {
        return objc.msgSend(*String, class_NSString, sel_string, .{});
    }

    pub fn stringWithString(str: *String) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithString_, .{str});
    }

    pub fn stringWithCString_encoding(str: [c]*const u8, encoding: StringEncoding) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithCString_encoding_, .{ str, encoding });
    }

    pub fn stringWithZigString(str: [*:0]const u8) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithCString_encoding_, .{ str, UTF8StringEncoding });
    }

    pub fn alloc() *String {
        return objc.msgSend(*String, class_NSString, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn initWithString(self: *T, str: *String) *T {
                return objc.msgSend(*T, self, sel_initWithString_, .{str});
            }

            pub fn initWithCString_encoding(self: *T, str: [c]*const u8, encoding: StringEncoding) *T {
                return objc.msgSend(*T, self, sel_initWithCString_encoding_, .{ str, encoding });
            }

            pub fn initWithZigString(self: *T, str: [*:0]*const u8) *T {
                return objc.msgSend(*T, self, sel_initWithCString_encoding_, .{ str, UTF8StringEncoding });
            }

            // initWithBytesNoCopy_length_encoding_freeWhenDone_

            pub fn characterAtIndex(self: *T, index: UInteger) unichar {
                return objc.msgSend(unichar, self, sel_characterAtIndex_, .{index});
            }

            pub fn length(self: *T) UInteger {
                return objc.msgSend(UInteger, self, sel_length, .{});
            }

            pub fn cStringUsingEncoding(self: *T, encoding: StringEncoding) [c]*const u8 {
                return objc.msgSend([c]*const u8, self, sel_cStringUsingEncoding_, .{encoding});
            }

            pub fn utf8String(self: *T) [*c]const u8 {
                return objc.msgSend([*c]const u8, self, sel_utf8String, .{});
            }

            pub fn maximumLengthOfBytesUsingEncoding(self: *T, encoding: StringEncoding) UInteger {
                return objc.msgSend(UInteger, self, sel_maximumLengthOfBytesUsingEncoding_, .{encoding});
            }

            pub fn lengthOfBytesUsingEncoding(self: *T, encoding: StringEncoding) UInteger {
                return objc.msgSend(UInteger, self, sel_lengthOfBytesUsingEncoding_, .{encoding});
            }

            pub fn isEqualToString(self: *T, str: *String) bool {
                return objc.msgSend(bool, self, sel_isEqualToString_, .{str});
            }

            // rangeOfString_options

            pub fn fileSystemRepresentation(self: *T) [c]*const u8 {
                return objc.msgSend([c]*const u8, self, sel_fileSystemRepresentation, .{});
            }

            pub fn stringByAppendingString(self: *T, str: *String) *String {
                return objc.msgSend(*String, self, sel_stringByAppendingString_, .{str});
            }
        };
    }
};

pub const Value = opaque {
    const Self = @This();
    usingnamespace Object.Methods(Self);
    usingnamespace Methods(Self);

    pub fn valueWithPointer(pointer: *const anyopaque) *Value {
        return objc.msgSend(*Value, class_NSValue, sel_valueWithPointer_, .{pointer});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn pointerValue(self: *T, comptime ReturnType: type) *ReturnType {
                return objc.msgSend(*ReturnType, self, sel_pointerValue, .{});
            }
        };
    }
};
