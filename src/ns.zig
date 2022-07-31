const std = @import("std");
const objc = @import("objc.zig");

var class_NSString : objc.Class = undefined;

var sel_localizedDescription : objc.SEL = undefined;
var sel_stringWithCString_encoding_ : objc.SEL = undefined;
var sel_utf8String : objc.SEL = undefined;

pub fn init() void {
    class_NSString = objc.class("NSString");

    sel_localizedDescription = objc.selector("localizedDescription");
    sel_stringWithCString_encoding_ = objc.selector("stringWithCString:encoding:");
    sel_utf8String = objc.selector("UTF8String");
}

pub const StringEncoding = enum(UInteger) {
    ASCII = 1,
    NEXTSTEP = 2,
    JapaneseEU = 3,
    UTF8 = 4,
    ISOLatin1 = 5,
    Symbol = 6,
    NonLossyASCII = 7,
    ShiftJIS = 8,
    ISOLatin2 = 9,
    UTF16 = 10,               // aliased to UnicodeStringEncoding
    WindowsCP1251 = 11,
    WindowsCP1252 = 12,
    WindowsCP1253 = 13,
    WindowsCP1254 = 14,
    WindowsCP1250 = 15,
    ISO2022JP = 21,
    MacOSRoman = 30,

    UTF16BigEndian = 0x90000100,
    UTF16LittleEndian = 0x94000100,

    UTF32 = 0x8c000100,
    UTF32BigEndian = 0x98000100,
    UTF32LittleEndian = 0x9c000100
};

pub const Error = opaque {
    pub fn localizedDescription(self: *const Error) *String {
        return objc.msgSend(*String, self, sel_localizedDescription, .{});
    }
};

pub const String = opaque {
    pub fn stringWithZigString(str:[*:0]const u8) *String {
        return objc.msgSend(*String, class_NSString, sel_stringWithCString_encoding_, .{str, @enumToInt(StringEncoding.UTF8)});
    }     

    pub fn utf8String(self: *const String) [*c]const u8 {
        return objc.msgSend([*c]const u8, self, sel_utf8String, .{});
    }
};

pub const UInteger = usize;
