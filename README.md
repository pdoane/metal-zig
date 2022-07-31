Design

- Following metal-cpp for API coverage
- Opaque types for classes
- Translating objective-c with minimal Zig changes (should be auto-generated eventually)

Open questions

- Type name transformations (Device vs. MTLDevice)
- Overloading naming strategy
- Optional vs errors for null values
- Aliased enumerations
- Protocol inheritance
- Const doesn't seem to matter for opaque types?
