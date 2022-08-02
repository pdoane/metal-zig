const c = @import("c.zig");

pub const id = *object;
pub const Class = *c.objc_class;
pub const object = c.objc_object;
pub const SEL = *c.objc_selector;
pub const IMP = *const anyopaque;

// https://github.com/hazeycode/zig-objcrt/blob/main/src/message.zig#L16
pub fn msgSend(comptime ReturnType: type, target: anytype, sel: SEL, args: anytype) ReturnType {
    const args_meta = @typeInfo(@TypeOf(args)).Struct.fields;
    const FnType = blk: {
        {
            // TODO(hazeycode): replace this hack with the more generalised code above once it doens't crash the compiler
            break :blk switch (args_meta.len) {
                0 => fn (@TypeOf(target), SEL) callconv(.C) ReturnType,
                1 => fn (@TypeOf(target), SEL, args_meta[0].field_type) callconv(.C) ReturnType,
                2 => fn (@TypeOf(target), SEL, args_meta[0].field_type, args_meta[1].field_type) callconv(.C) ReturnType,
                3 => fn (@TypeOf(target), SEL, args_meta[0].field_type, args_meta[1].field_type, args_meta[2].field_type) callconv(.C) ReturnType,
                4 => fn (@TypeOf(target), SEL, args_meta[0].field_type, args_meta[1].field_type, args_meta[2].field_type, args_meta[3].field_type) callconv(.C) ReturnType,
                else => @compileError("Unsupported number of args: add more variants in zig-objcrt/src/message.zig"),
            };
        }
    };

    // NOTE: func is a var because making it const causes a compile error which I believe is a compiler bug
    var func = @ptrCast(FnType, c.objc_msgSend);

    return @call(.{}, func, .{ target, sel } ++ args);
}

pub fn class(str: [:0]const u8) Class {
    return c.objc_lookUpClass(str).?;
}

pub fn selector(str: [:0]const u8) SEL {
    return c.sel_registerName(str).?;
}

pub fn addMethod(cls: Class, name: SEL, imp: IMP, types: [:0]const u8) bool {
    return c.class_addMethod(cls, name, @ptrCast(fn () callconv(.C) void, imp), types);
}
