Following metal-cpp + extensions for API coverage
Tutorials based on https://developer.apple.com/metal/LearnMetalCPP.zip

Design

- Translating objective-c with minimal Zig changes (maybe auto-generated later?)
- Opaque types as strongly-typed wrappers for classes
- Enumerations as integer values
- Selector name as function name with `:` -> `_` and trailing underscore removed
- Prefix removed (`MTLDevice` -> `mtl.Device`)

Open questions

- Optional vs errors for null values
- Protocol inheritance
   - Alternative to copy/paste in class definitions
   - Casting helper methods
- Const doesn't seem to matter for opaque types?
- Slices (e.g. array initialization from objects)
- String constants (e.g NSErrorDomain)
