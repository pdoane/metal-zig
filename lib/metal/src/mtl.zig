const std = @import("std");
const foundation = @import("foundation");

const objc = foundation.objc;
const ns = foundation.ns;

extern fn MTLCreateSystemDefaultDevice() objc.id;

var sel_commandBuffer: objc.SEL = undefined;
var sel_commit: objc.SEL = undefined;
var sel_computeCommandEncoder: objc.SEL = undefined;
var sel_contents: objc.SEL = undefined;
var sel_dispatchThreadgroups_threadsPerThreadgroup_: objc.SEL = undefined;
var sel_endEncoding: objc.SEL = undefined;
var sel_name: objc.SEL = undefined;
var sel_newBufferWithBytes_length_options_: objc.SEL = undefined;
var sel_newBufferWithLength_options_: objc.SEL = undefined;
var sel_newCommandQueue: objc.SEL = undefined;
var sel_newComputePipelineStateWithFunction_error_: objc.SEL = undefined;
var sel_newFunctionWithName_: objc.SEL = undefined;
var sel_newLibraryWithFile_error_: objc.SEL = undefined;
var sel_setBuffer_offset_atIndex_: objc.SEL = undefined;
var sel_setComputePipelineState_: objc.SEL = undefined;
var sel_waitUntilCompleted: objc.SEL = undefined;

pub fn _init() void {
    sel_commandBuffer = objc.selector("commandBuffer");
    sel_commit = objc.selector("commit");
    sel_computeCommandEncoder = objc.selector("computeCommandEncoder");
    sel_contents = objc.selector("contents");
    sel_dispatchThreadgroups_threadsPerThreadgroup_ = objc.selector("dispatchThreadgroups:threadsPerThreadgroup:");
    sel_endEncoding = objc.selector("endEncoding");
    sel_name = objc.selector("name");
    sel_newBufferWithBytes_length_options_ = objc.selector("newBufferWithBytes:length:options:");
    sel_newBufferWithLength_options_ = objc.selector("newBufferWithLength:options:");
    sel_newCommandQueue = objc.selector("newCommandQueue");
    sel_newComputePipelineStateWithFunction_error_ = objc.selector("newComputePipelineStateWithFunction:error:");
    sel_newFunctionWithName_ = objc.selector("newFunctionWithName:");
    sel_newLibraryWithFile_error_ = objc.selector("newLibraryWithFile:error:");
    sel_setBuffer_offset_atIndex_ = objc.selector("setBuffer:offset:atIndex:");
    sel_setComputePipelineState_ = objc.selector("setComputePipelineState:");
    sel_waitUntilCompleted = objc.selector("waitUntilCompleted");
}

pub const Size = extern struct {
    width: ns.UInteger,
    height: ns.UInteger,
    depth: ns.UInteger,

    pub fn init(width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Size {
        return Size{ .width = width, .height = height, .depth = depth };
    }
};

pub const Buffer = opaque {
    // length

    pub fn contents(self: *Buffer, comptime ReturnType: type) [*]ReturnType {
        return objc.msgSend([*]ReturnType, self, sel_contents, .{});
    }

    // didModifyRange
    // newTextureWithDescriptor
    // addDebugMarker
    // removeAllDebugMarkers
    // remoteStorageBuffer
    // newRemoteBufferViewForDevice
};

pub const CommandBuffer = opaque {
    // device
    // commandQueue
    // retainedReferences
    // errorOptions
    // label
    // kernelStartTime
    // kernelEndTime
    // logs
    // GPUStartTime
    // GPUEndTime
    // enqueue

    pub fn commit(self: *CommandBuffer) void {
        objc.msgSend(void, self, sel_commit, .{});
    }

    // addScheduledHandler
    // presentDrawable
    // waitUntilScheduled
    // addCompletedHandler

    pub fn waitUntilCompleted(self: *CommandBuffer) void {
        objc.msgSend(void, self, sel_waitUntilCompleted, .{});
    }

    // status
    // error
    // blitCommandEncoder
    // renderCommandEncoderWithDescriptor
    // computeCommandEncoderWithDescriptor
    // blitCommandEncoderWithDescriptor

    pub fn computeCommandEncoder(self: *CommandBuffer) ?*ComputeCommandEncoder {
        return objc.msgSend(*ComputeCommandEncoder, self, sel_computeCommandEncoder, .{});
    }

    // computeCommandEncoderWithDispatchType
    // encodeWaitForEvent
    // encodeSignalEvent
    // parallelRenderCommandEncoderWithDescriptor
    // resourceStateCommandEncoder
    // resourceStateCommandEncoderWithDescriptor
    // accelerationStructureCommandEncoder;
    // pushDebugGroup
    // popDebugGroup
};

pub const ComputeCommandEncoder = opaque {
    // -----------------------------------------------------------------------
    // CommandEncoder

    // device
    // label

    pub fn endEncoding(self: *ComputeCommandEncoder) void {
        objc.msgSend(void, self, sel_endEncoding, .{});
    }

    // insertDebugSignpost
    // pushDebugGroup
    // popDebugGroup

    // -----------------------------------------------------------------------
    // ComputeCommandEncoder

    // dispatchType

    pub fn setComputePipelineState(self: *ComputeCommandEncoder, state: *ComputePipelineState) void {
        objc.msgSend(void, self, sel_setComputePipelineState_, .{state});
    }

    // setBytes

    pub fn setBuffer_offset_atIndex(self: *ComputeCommandEncoder, buffer: ?*Buffer, offset: ns.UInteger, atIndex: ns.UInteger) void {
        objc.msgSend(void, self, sel_setBuffer_offset_atIndex_, .{ buffer, offset, atIndex });
    }

    // setBufferOffset
    // setBuffers
    // setVisibleFunctionTable
    // setVisibleFunctionTables
    // setIntersectionFunctionTable
    // setIntersectionFunctionTables
    // setAccelerationStructure
    // setTexture
    // setTextures
    // setSamplerState
    // setSamplerStates
    // setSamplerState
    // setSamplerStates
    // setThreadgroupMemoryLength
    // setImageblockWidth
    // setStageInRegion
    // setStageInRegionWithIndirectBuffer

    pub fn dispatchThreadgroups_threadsPerThreadgroup(self: *ComputeCommandEncoder, threadgroupsPerGrid: Size, threadsPerThreadgroup: Size) void {
        objc.msgSend(void, self, sel_dispatchThreadgroups_threadsPerThreadgroup_, .{ threadgroupsPerGrid, threadsPerThreadgroup });
    }

    // dispatchThreadgroupsWithIndirectBuffer
    // dispatchThreads
    // updateFence
    // waitForFence
    // useResource
    // useResources
    // useHeap
    // useHeaps
    // executeCommandsInBuffer
    // memoryBarrierWithScope
    // memoryBarrierWithResources
    // sampleCountersInBuffer
};

pub const CommandQueue = opaque {
    // label
    // device

    pub fn commandBuffer(self: *CommandQueue) ?*CommandBuffer {
        return objc.msgSend(*CommandBuffer, self, sel_commandBuffer, .{});
    }

    // descriptor
    // commandBufferWithUnretainedReferences
    // insertDebugCaptureBoundary
};

pub const ComputePipelineState = opaque {};

pub const Device = opaque {
    pub fn name(self: *Device) *ns.String {
        return objc.msgSend(*ns.String, self, sel_name, .{});
    }

    // registryID
    // maxThreadsPerThreadgroup
    // lowPower
    // headless
    // removable
    // hasUnifiedMemory
    // recommendedMaxWorkingSetSize
    // location
    // locationNumber
    // maxTransferRate
    // depth24Stencil8PixelFormatSupported
    // readWriteTextureSupport
    // argumentBuffersSupport
    // rasterOrderGroupsSupported
    // supports32BitFloatFiltering
    // supports32BitMSAA
    // supportsQueryTextureLOD
    // supportsBCTextureCompression
    // supportsPullModelInterpolation
    // barycentricCoordsSupported
    // upportsShaderBarycentricCoordinates
    // currentAllocatedSize

    pub fn newCommandQueue(self: *Device) ?*CommandQueue {
        return objc.msgSend(*CommandQueue, self, sel_newCommandQueue, .{});
    }

    // newCommandQueueWithMaxCommandBufferCount
    // heapTextureSizeAndAlignWithDescriptor
    // heapBufferSizeAndAlignWithLength
    // newHeapWithDescriptor

    // TODO - ResourceOptions
    pub fn newBufferWithLength_options(self: *Device, length: ns.UInteger) ?*Buffer {
        const options: ns.UInteger = 0;
        return objc.msgSend(*Buffer, self, sel_newBufferWithLength_options_, .{ length, options });
    }

    // TODO - ResourceOptions
    pub fn newBufferWithBytes_length_options(self: *Device, pointer: *const anyopaque, length: ns.UInteger) ?*Buffer {
        const options: ns.UInteger = 0;
        return objc.msgSend(*Buffer, self, sel_newBufferWithBytes_length_options_, .{ pointer, length, options });
    }

    // newBufferWithBytesNoCopy
    // newDepthStencilStateWithDescriptor
    // newTextureWithDescriptor
    // newSharedTextureWithDescriptor
    // newSharedTextureWithHandle
    // newSamplerStateWithDescriptor
    // newDefaultLibrary
    // newDefaultLibraryWithBundle

    pub fn newLibraryWithFile_error(self: *Device, filepath: *ns.String, err: *?*ns.Error) ?*Library {
        return objc.msgSend(*Library, self, sel_newLibraryWithFile_error_, .{ filepath, err });
    }

    // newLibraryWithURL
    // newLibraryWithData
    // newLibraryWithSource
    // newLibraryWithStitchedDescriptor
    // newRenderPipelineStateWithDescriptor

    pub fn newComputePipelineStateWithFunction_error(self: *Device, computeFunction: *Function, err: *?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(*ComputePipelineState, self, sel_newComputePipelineStateWithFunction_error_, .{ computeFunction, err });
    }

    // newComputePipelineStateWithFunction:options:reflection:error:
    // newComputePipelineStateWithFunction:completionHandler:
    // newComputePipelineStateWithFunction:options:completionHandler:
    // newComputePipelineStateWithDescriptor
    // newFence
    // supportsFeatureSet
    // supportsFamily
    // supportsTextureSampleCount
    // minimumLinearTextureAlignmentForPixelFormat
    // minimumTextureBufferAlignmentForPixelFormat
    // newRenderPipelineStateWithTileDescriptor
    // newRenderPipelineStateWithTileDescriptor
    // maxThreadgroupMemoryLength
    // maxArgumentBufferSamplerCount
    // programmableSamplePositionsSupported
    // getDefaultSamplePositions
    // newArgumentEncoderWithArguments
    // supportsRasterizationRateMapWithLayerCount
    // newRasterizationRateMapWithDescriptor
    // newIndirectCommandBufferWithDescriptor
    // newEvent
    // newSharedEvent
    // newSharedEventWithHandle
    // peerGroupID
    // peerIndex
    // peerCount
    // sparseTileSizeWithTextureType
    // convertSparsePixelRegions
    // convertSparseTileRegions
    // maxBufferLength
    // newCounterSampleBufferWithDescriptor
    // sampleTimestamps
    // supportsCounterSampling
    // supportsVertexAmplificationCount
    // supportsDynamicLibraries
    // supportsRenderDynamicLibraries
    // newDynamicLibrary
    // newDynamicLibraryWithURL
    // newBinaryArchiveWithDescriptor
    // supportsRaytracing
    // accelerationStructureSizesWithDescriptor
    // newAccelerationStructureWithSize
    // newAccelerationStructureWithDescriptor
    // supportsFunctionPointers
    // supportsFunctionPointersFromRender
    // supportsRaytracingFromRender
    // supportsPrimitiveMotionBlur
};

pub const Function = opaque {
    // label
    // device
    // functionType
    // patchType
    // patchControlPointCount
    // vertexAttributes
    // stageInputAttributes

    pub fn name(self: *Function) *ns.String {
        return objc.msgSend(*ns.String, self, sel_name, .{});
    }

    // functionConstantsDictionary
    // newArgumentEncoderWithBufferIndex
    // options
};

pub const Library = opaque {
    // label
    // device

    pub fn newFunctionWithName(self: *Library, functionName: *ns.String) ?*Function {
        return objc.msgSend(*Function, self, sel_newFunctionWithName_, .{functionName});
    }

    // newFunctionWithDescriptor
    // newIntersectionFunctionWithDescriptor
    // functionNames
    // type
    // installName
};

pub fn createSystemDefaultDevice() ?*Device {
    return @ptrCast(*Device, MTLCreateSystemDefaultDevice());
}
