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
var sel_presentDrawable_: objc.SEL = undefined;
var sel_renderCommandEncoderWithDescriptor_: objc.SEL = undefined;
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
    sel_presentDrawable_ = objc.selector("presentDrawable:");
    sel_renderCommandEncoderWithDescriptor_ = objc.selector("renderCommandEncoderWithDescriptor:");
    sel_setBuffer_offset_atIndex_ = objc.selector("setBuffer:offset:atIndex:");
    sel_setComputePipelineState_ = objc.selector("setComputePipelineState:");
    sel_waitUntilCompleted = objc.selector("waitUntilCompleted");
}

pub const PixelFormat = ns.UInteger;
pub const PixelFormatInvalid = 0;
pub const PixelFormatA8Unorm = 1;
pub const PixelFormatR8Unorm = 10;
pub const PixelFormatR8Unorm_sRGB = 11;
pub const PixelFormatR8Snorm = 12;
pub const PixelFormatR8Uint = 13;
pub const PixelFormatR8Sint = 14;
pub const PixelFormatR16Unorm = 20;
pub const PixelFormatR16Snorm = 22;
pub const PixelFormatR16Uint = 23;
pub const PixelFormatR16Sint = 24;
pub const PixelFormatR16Float = 25;
pub const PixelFormatRG8Unorm = 30;
pub const PixelFormatRG8Unorm_sRGB = 31;
pub const PixelFormatRG8Snorm = 32;
pub const PixelFormatRG8Uint = 33;
pub const PixelFormatRG8Sint = 34;
pub const PixelFormatB5G6R5Unorm = 40;
pub const PixelFormatA1BGR5Unorm = 41;
pub const PixelFormatABGR4Unorm = 42;
pub const PixelFormatBGR5A1Unorm = 43;
pub const PixelFormatR32Uint = 53;
pub const PixelFormatR32Sint = 54;
pub const PixelFormatR32Float = 55;
pub const PixelFormatRG16Unorm = 60;
pub const PixelFormatRG16Snorm = 62;
pub const PixelFormatRG16Uint = 63;
pub const PixelFormatRG16Sint = 64;
pub const PixelFormatRG16Float = 65;
pub const PixelFormatRGBA8Unorm = 70;
pub const PixelFormatRGBA8Unorm_sRGB = 71;
pub const PixelFormatRGBA8Snorm = 72;
pub const PixelFormatRGBA8Uint = 73;
pub const PixelFormatRGBA8Sint = 74;
pub const PixelFormatBGRA8Unorm = 80;
pub const PixelFormatBGRA8Unorm_sRGB = 81;
pub const PixelFormatRGB10A2Unorm = 90;
pub const PixelFormatRGB10A2Uint = 91;
pub const PixelFormatRG11B10Float = 92;
pub const PixelFormatRGB9E5Float = 93;
pub const PixelFormatBGR10A2Unorm = 94;
pub const PixelFormatRG32Uint = 103;
pub const PixelFormatRG32Sint = 104;
pub const PixelFormatRG32Float = 105;
pub const PixelFormatRGBA16Unorm = 110;
pub const PixelFormatRGBA16Snorm = 112;
pub const PixelFormatRGBA16Uint = 113;
pub const PixelFormatRGBA16Sint = 114;
pub const PixelFormatRGBA16Float = 115;
pub const PixelFormatRGBA32Uint = 123;
pub const PixelFormatRGBA32Sint = 124;
pub const PixelFormatRGBA32Float = 125;
pub const PixelFormatBC1_RGBA = 130;
pub const PixelFormatBC1_RGBA_sRGB = 131;
pub const PixelFormatBC2_RGBA = 132;
pub const PixelFormatBC2_RGBA_sRGB = 133;
pub const PixelFormatBC3_RGBA = 134;
pub const PixelFormatBC3_RGBA_sRGB = 135;
pub const PixelFormatBC4_RUnorm = 140;
pub const PixelFormatBC4_RSnorm = 141;
pub const PixelFormatBC5_RGUnorm = 142;
pub const PixelFormatBC5_RGSnorm = 143;
pub const PixelFormatBC6H_RGBFloat = 150;
pub const PixelFormatBC6H_RGBUfloat = 151;
pub const PixelFormatBC7_RGBAUnorm = 152;
pub const PixelFormatBC7_RGBAUnorm_sRGB = 153;
pub const PixelFormatPVRTC_RGB_2BPP = 160;
pub const PixelFormatPVRTC_RGB_2BPP_sRGB = 161;
pub const PixelFormatPVRTC_RGB_4BPP = 162;
pub const PixelFormatPVRTC_RGB_4BPP_sRGB = 163;
pub const PixelFormatPVRTC_RGBA_2BPP = 164;
pub const PixelFormatPVRTC_RGBA_2BPP_sRGB = 165;
pub const PixelFormatPVRTC_RGBA_4BPP = 166;
pub const PixelFormatPVRTC_RGBA_4BPP_sRGB = 167;
pub const PixelFormatEAC_R11Unorm = 170;
pub const PixelFormatEAC_R11Snorm = 172;
pub const PixelFormatEAC_RG11Unorm = 174;
pub const PixelFormatEAC_RG11Snorm = 176;
pub const PixelFormatEAC_RGBA8 = 178;
pub const PixelFormatEAC_RGBA8_sRGB = 179;
pub const PixelFormatETC2_RGB8 = 180;
pub const PixelFormatETC2_RGB8_sRGB = 181;
pub const PixelFormatETC2_RGB8A1 = 182;
pub const PixelFormatETC2_RGB8A1_sRGB = 183;
pub const PixelFormatASTC_4x4_sRGB = 186;
pub const PixelFormatASTC_5x4_sRGB = 187;
pub const PixelFormatASTC_5x5_sRGB = 188;
pub const PixelFormatASTC_6x5_sRGB = 189;
pub const PixelFormatASTC_6x6_sRGB = 190;
pub const PixelFormatASTC_8x5_sRGB = 192;
pub const PixelFormatASTC_8x6_sRGB = 193;
pub const PixelFormatASTC_8x8_sRGB = 194;
pub const PixelFormatASTC_10x5_sRGB = 195;
pub const PixelFormatASTC_10x6_sRGB = 196;
pub const PixelFormatASTC_10x8_sRGB = 197;
pub const PixelFormatASTC_10x10_sRGB = 198;
pub const PixelFormatASTC_12x10_sRGB = 199;
pub const PixelFormatASTC_12x12_sRGB = 200;
pub const PixelFormatASTC_4x4_LDR = 204;
pub const PixelFormatASTC_5x4_LDR = 205;
pub const PixelFormatASTC_5x5_LDR = 206;
pub const PixelFormatASTC_6x5_LDR = 207;
pub const PixelFormatASTC_6x6_LDR = 208;
pub const PixelFormatASTC_8x5_LDR = 210;
pub const PixelFormatASTC_8x6_LDR = 211;
pub const PixelFormatASTC_8x8_LDR = 212;
pub const PixelFormatASTC_10x5_LDR = 213;
pub const PixelFormatASTC_10x6_LDR = 214;
pub const PixelFormatASTC_10x8_LDR = 215;
pub const PixelFormatASTC_10x10_LDR = 216;
pub const PixelFormatASTC_12x10_LDR = 217;
pub const PixelFormatASTC_12x12_LDR = 218;
pub const PixelFormatASTC_4x4_HDR = 222;
pub const PixelFormatASTC_5x4_HDR = 223;
pub const PixelFormatASTC_5x5_HDR = 224;
pub const PixelFormatASTC_6x5_HDR = 225;
pub const PixelFormatASTC_6x6_HDR = 226;
pub const PixelFormatASTC_8x5_HDR = 228;
pub const PixelFormatASTC_8x6_HDR = 229;
pub const PixelFormatASTC_8x8_HDR = 230;
pub const PixelFormatASTC_10x5_HDR = 231;
pub const PixelFormatASTC_10x6_HDR = 232;
pub const PixelFormatASTC_10x8_HDR = 233;
pub const PixelFormatASTC_10x10_HDR = 234;
pub const PixelFormatASTC_12x10_HDR = 235;
pub const PixelFormatASTC_12x12_HDR = 236;
pub const PixelFormatGBGR422 = 240;
pub const PixelFormatBGRG422 = 241;
pub const PixelFormatDepth16Unorm = 250;
pub const PixelFormatDepth32Float = 252;
pub const PixelFormatStencil8 = 253;
pub const PixelFormatDepth24Unorm_Stencil8 = 255;
pub const PixelFormatDepth32Float_Stencil8 = 260;
pub const PixelFormatX32_Stencil8 = 261;
pub const PixelFormatX24_Stencil8 = 262;
pub const PixelFormatBGRA10_XR = 552;
pub const PixelFormatBGRA10_XR_sRGB = 553;
pub const PixelFormatBGR10_XR = 554;
pub const PixelFormatBGR10_XR_sRGB = 555;

pub const Size = extern struct {
    width: ns.UInteger,
    height: ns.UInteger,
    depth: ns.UInteger,

    pub fn init(width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Size {
        return Size{ .width = width, .height = height, .depth = depth };
    }
};

pub const ClearColor = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    alpha: f64,

    pub fn init(red: f64, green: f64, blue: f64, alpha: f64) ClearColor {
        return ClearColor{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

pub const Buffer = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // length

            pub fn contents(self: *T, comptime ReturnType: type) [*]ReturnType {
                return objc.msgSend([*]ReturnType, self, sel_contents, .{});
            }

            // didModifyRange
            // newTextureWithDescriptor
            // addDebugMarker
            // removeAllDebugMarkers
            // remoteStorageBuffer
            // newRemoteBufferViewForDevice
        };
    }
};

pub const CommandBuffer = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

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

            pub fn commit(self: *T) void {
                objc.msgSend(void, self, sel_commit, .{});
            }

            // addScheduledHandler

            pub fn presentDrawable(self: *T, drawable: *Drawable) void {
                objc.msgSend(void, self, sel_presentDrawable_, .{drawable});
            }

            // presentDrawable_atTime
            // presentDrawable_afterMinimumDuration
            // waitUntilScheduled
            // addCompletedHandler

            pub fn waitUntilCompleted(self: *T) void {
                objc.msgSend(void, self, sel_waitUntilCompleted, .{});
            }

            // status
            // error
            // blitCommandEncoder

            pub fn renderCommandEncoderWithDescriptor(self: *T, render_pass_descriptor: *RenderPassDescriptor) *RenderCommandEncoder {
                return objc.msgSend(*RenderCommandEncoder, self, sel_renderCommandEncoderWithDescriptor_, .{render_pass_descriptor});
            }

            // computeCommandEncoderWithDescriptor
            // blitCommandEncoderWithDescriptor

            pub fn computeCommandEncoder(self: *T) ?*ComputeCommandEncoder {
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
    }
};

pub const CommandEncoder = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // device
            // label

            pub fn endEncoding(self: *T) void {
                objc.msgSend(void, self, sel_endEncoding, .{});
            }

            // insertDebugSignpost
            // pushDebugGroup
            // popDebugGroup
        };
    }
};

pub const ComputeCommandEncoder = opaque {
    const Self = @This();
    pub const Super = CommandEncoder;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // dispatchType

            pub fn setComputePipelineState(self: *T, state: *ComputePipelineState) void {
                objc.msgSend(void, self, sel_setComputePipelineState_, .{state});
            }

            // setBytes

            pub fn setBuffer_offset_atIndex(self: *T, buffer: ?*Buffer, offset: ns.UInteger, at_index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setBuffer_offset_atIndex_, .{ buffer, offset, at_index });
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

            pub fn dispatchThreadgroups_threadsPerThreadgroup(self: *T, threadgroups_per_grid: Size, threads_per_threadgroup: Size) void {
                objc.msgSend(void, self, sel_dispatchThreadgroups_threadsPerThreadgroup_, .{ threadgroups_per_grid, threads_per_threadgroup });
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
    }
};

pub const CommandQueue = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // label
            // device

            pub fn commandBuffer(self: *T) ?*CommandBuffer {
                return objc.msgSend(*CommandBuffer, self, sel_commandBuffer, .{});
            }

            // descriptor
            // commandBufferWithUnretainedReferences
            // insertDebugCaptureBoundary
        };
    }
};

pub const ComputePipelineState = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);
        };
    }
};

pub const Device = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn name(self: *T) *ns.String {
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

            pub fn newCommandQueue(self: *T) ?*CommandQueue {
                return objc.msgSend(*CommandQueue, self, sel_newCommandQueue, .{});
            }

            // newCommandQueueWithMaxCommandBufferCount
            // heapTextureSizeAndAlignWithDescriptor
            // heapBufferSizeAndAlignWithLength
            // newHeapWithDescriptor

            // TODO - ResourceOptions
            pub fn newBufferWithLength_options(self: *T, length: ns.UInteger) ?*Buffer {
                const options: ns.UInteger = 0;
                return objc.msgSend(*Buffer, self, sel_newBufferWithLength_options_, .{ length, options });
            }

            // TODO - ResourceOptions
            pub fn newBufferWithBytes_length_options(self: *T, pointer: *const anyopaque, length: ns.UInteger) ?*Buffer {
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

            pub fn newLibraryWithFile_error(self: *T, filepath: *ns.String, err: *?*ns.Error) ?*Library {
                return objc.msgSend(*Library, self, sel_newLibraryWithFile_error_, .{ filepath, err });
            }

            // newLibraryWithURL
            // newLibraryWithData
            // newLibraryWithSource
            // newLibraryWithStitchedDescriptor
            // newRenderPipelineStateWithDescriptor

            pub fn newComputePipelineStateWithFunction_error(self: *T, compute_function: *Function, err: *?*ns.Error) ?*ComputePipelineState {
                return objc.msgSend(*ComputePipelineState, self, sel_newComputePipelineStateWithFunction_error_, .{ compute_function, err });
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
    }
};

pub const Drawable = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);
        };
    }
};

pub const Function = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // label
            // device
            // functionType
            // patchType
            // patchControlPointCount
            // vertexAttributes
            // stageInputAttributes

            pub fn name(self: *T) *ns.String {
                return objc.msgSend(*ns.String, self, sel_name, .{});
            }

            // functionConstantsDictionary
            // newArgumentEncoderWithBufferIndex
            // options
        };
    }
};

pub const Library = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // label
            // device

            pub fn newFunctionWithName(self: *T, function_name: *ns.String) ?*Function {
                return objc.msgSend(*Function, self, sel_newFunctionWithName_, .{function_name});
            }

            // newFunctionWithDescriptor
            // newIntersectionFunctionWithDescriptor
            // functionNames
            // type
            // installName
        };
    }
};

pub const RenderPassDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);
        };
    }
};

pub const RenderCommandEncoder = opaque {
    const Self = @This();
    pub const Super = CommandEncoder;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);
        };
    }
};

pub const Resource = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);
        };
    }
};

pub fn createSystemDefaultDevice() ?*Device {
    return @ptrCast(*Device, MTLCreateSystemDefaultDevice());
}
