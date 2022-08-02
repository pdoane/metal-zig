const std = @import("std");
const metal_zig = @import("metal-zig");
const ns = metal_zig.ns;
const mtl = metal_zig.mtl;

pub fn main() !void {
    ns.init();
    mtl.init();

    var device = mtl.createSystemDefaultDevice() orelse {
        std.log.err("Metal device not found", .{});
        return;
    };

    std.log.info("Device: name={s}", .{device.name().utf8String()});

    const library_path = ns.String.stringWithZigString("examples/shaders/default.metallib");
    var err: ?*ns.Error = undefined;
    var library = device.newLibraryWithFile_error(library_path, &err) orelse {
        std.log.err("newLibraryWithFile_error failed: {s} {s}", .{library_path.utf8String(), err.?.localizedDescription().utf8String()});
        return;
    };

    const function_name = ns.String.stringWithZigString("add");
    var function = library.newFunctionWithName(function_name) orelse {
        std.log.err("newFunctionWithName failed: {s} function not found", .{function_name.utf8String()});
        return;
    };

    var pipeline = device.newComputePipelineStateWithFunction_error(function, &err) orelse {
        std.log.err("newComputePipelineStateWithFunction_error failed: {s}", .{err.?.localizedDescription().utf8String()});
        return;
    };

    const input = [_]f32{11, 22};
    var input_buffer = device.newBufferWithBytes_length_options(&input, @sizeOf(f32) * 2) orelse {
        std.log.err("newBufferWithBytes_length_options failed", .{});
        return;
    };
    
    var output_buffer = device.newBufferWithLength_options(@sizeOf(f32)) orelse {
        std.log.err("newBufferWithLength_options failed", .{});
        return;
    };

    var command_queue = device.newCommandQueue() orelse {
        std.log.err("newCommandQueue failed", .{});
        return;
    };

    var command_buffer = command_queue.commandBuffer() orelse {
        std.log.err("newCommandQueue failed", .{});
        return;
    };

    var encoder = command_buffer.computeCommandEncoder() orelse {
        std.log.err("computeCommandEncoder failed", .{});
        return;
    };

    encoder.setComputePipelineState(pipeline);
    encoder.setBuffer_offset_atIndex(input_buffer, 0, 0);
    encoder.setBuffer_offset_atIndex(output_buffer, 0, 1);
    encoder.dispatchThreadgroups_threadsPerThreadgroup(mtl.Size.init(1,1,1), mtl.Size.init(1,1,1));
    encoder.endEncoding();
    command_buffer.commit();
    command_buffer.waitUntilCompleted();

    std.log.info("Command buffer completed", .{});

    const output: [*]f32 = output_buffer.contents(f32);
    std.log.info("result = {e}", .{ output[0] });
}
