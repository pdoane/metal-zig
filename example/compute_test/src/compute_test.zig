const std = @import("std");
const foundation = @import("foundation");
const metal = @import("metal");

const mtl = metal.mtl;
const ns = foundation.ns;

pub fn main() !void {
    foundation.init();
    metal.init();

    var device = mtl.createSystemDefaultDevice().?;

    std.log.info("Device: name={s}", .{device.name().utf8String()});

    const library_path = ns.String.stringWithZigString("example/compute_test/shaders/default.metallib");
    var err: ?*ns.Error = undefined;
    var library = device.newLibraryWithFile_error(library_path, &err).?;

    const function_name = ns.String.stringWithZigString("add");
    var function = library.newFunctionWithName(function_name).?;
    var pipeline = device.newComputePipelineStateWithFunction_error(function, &err).?;

    const input = [_]f32{ 11, 22 };
    var input_buffer = device.newBufferWithBytes_length_options(&input, @sizeOf(f32) * 2).?;
    var output_buffer = device.newBufferWithLength_options(@sizeOf(f32)).?;
    var command_queue = device.newCommandQueue().?;
    var command_buffer = command_queue.commandBuffer().?;
    var encoder = command_buffer.computeCommandEncoder().?;

    encoder.setComputePipelineState(pipeline);
    encoder.setBuffer_offset_atIndex(input_buffer, 0, 0);
    encoder.setBuffer_offset_atIndex(output_buffer, 0, 1);
    encoder.dispatchThreadgroups_threadsPerThreadgroup(mtl.Size.init(1, 1, 1), mtl.Size.init(1, 1, 1));
    encoder.endEncoding();
    command_buffer.commit();
    command_buffer.waitUntilCompleted();

    std.log.info("Command buffer completed", .{});

    const output: [*]f32 = output_buffer.contents(f32);
    std.log.info("result = {e}", .{output[0]});
}
