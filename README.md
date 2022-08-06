metal-zig [![Zig](https://img.shields.io/badge/Made_with-Zig-F7A41D.svg)](https://shields.io/)
====
A low-overhead Zig interface for Metal.

### Design

- Following metal-cpp + extensions for API coverage
- Example apps based on https://developer.apple.com/metal/LearnMetalCPP.zip
- Translating objective-c with minimal Zig changes (maybe auto-generated later?)
- Opaque types as strongly-typed wrappers for classes
- Use generics with mixins to implement method inheritance
- Enumerations as integer values
- Selector name as function name with `:` -> `_` and trailing underscore removed
- Namspace prefix removed (`MTLDevice` -> `mtl.Device`)
- Adds a `cast` method to ns.Object that provides some static safety guarantees

### Open questions

- Optional vs errors for null values
- Const doesn't seem to matter for opaque types?
- Zig slices or pointer/count (e.g. array initialization from objects)
- String constants (e.g NSErrorDomain)
- Delegate lifetimes
- Why do function parameters get warning about shadowing struct fields