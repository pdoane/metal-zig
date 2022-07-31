const std = @import("std");
const objc = @import("objc.zig");
const ns = @import("ns.zig");

extern fn MTLCreateSystemDefaultDevice() objc.id;

var sel_name : objc.SEL = undefined;
var sel_newFunctionWithName_ : objc.SEL = undefined;
var sel_newLibraryWithFile_error_ : objc.SEL = undefined;

pub fn init() void {
    sel_name = objc.selector("name");
    sel_newFunctionWithName_ = objc.selector("newFunctionWithName:");
    sel_newLibraryWithFile_error_ = objc.selector("newLibraryWithFile:error:");
}

pub const Device = opaque {
    pub fn name(self: *const Device) *ns.String {
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
    // newCommandQueue
    // newCommandQueueWithMaxCommandBufferCount
    // heapTextureSizeAndAlignWithDescriptor
    // heapBufferSizeAndAlignWithLength
    // newHeapWithDescriptor
    // newBufferWithLength
    // newBufferWithBytes
    // newBufferWithBytesNoCopy
    // newDepthStencilStateWithDescriptor
    // newTextureWithDescriptor
    // newSharedTextureWithDescriptor
    // newSharedTextureWithHandle
    // newSamplerStateWithDescriptor
    // newDefaultLibrary
    // newDefaultLibraryWithBundle

    pub fn newLibraryWithFileAndError(self: *Device, filepath: *ns.String, err: *?*ns.Error) ?*Library {
        return objc.msgSend(*Library, self, sel_newLibraryWithFile_error_, .{ filepath, err });
    }

    // newLibraryWithURL
    // newLibraryWithData
    // newLibraryWithSource
    // newLibraryWithStitchedDescriptor
    // newRenderPipelineStateWithDescriptor
    // newComputePipelineStateWithFunction
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

    pub fn name(self: *const Function) *ns.String {
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
