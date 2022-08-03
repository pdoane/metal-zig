#include "objc/message.h"
#include "CoreGraphics/CGGeometry.h"
#include <stdio.h>

// C-ABI for structs with floats not working correctly for AArch64.
// Compiler version: 0.10.0-dev.3394+1a1b7a3af
//
//   - Workaround is to pass structs by pointer and do API call from C

struct ClearColor
{
    double r, g, b, a;
};

struct objc_object* initWithFrame_device_workaround(id obj, SEL sel, struct CGRect* rect, id device)
{
    return ((id (*)(id, SEL, struct CGRect, id))objc_msgSend)(obj, sel, *rect, device);
}

void setClearColor_workaround(id obj, SEL sel, struct ClearColor* clearColor)
{
    ((id (*)(id, SEL, struct ClearColor))objc_msgSend)(obj, sel, *clearColor);
}
