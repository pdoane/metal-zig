#include "objc/message.h"
#include "CoreGraphics/CGGeometry.h"
#include <stdio.h>

// C-ABI for structs with floats not working correctly for AArch64.
// Compiler version: 0.10.0-dev.3394+1a1b7a3af
//
//   - Workaround is to pass structs by pointer and do API call from C

typedef size_t NSUInteger;

struct objc_object* initWithContentRect_styleMask_backing_defer_workaround(id obj, SEL sel, struct CGRect* rect, NSUInteger style, NSUInteger backingStore, BOOL defer)
{
    return ((id (*)(id, SEL, struct CGRect, NSUInteger, NSUInteger, BOOL))objc_msgSend)(obj, sel, *rect, style, backingStore, defer);
}
