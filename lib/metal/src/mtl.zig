const std = @import("std");
const foundation = @import("foundation");

const objc = foundation.objc;
const ns = foundation.ns;

extern fn MTLCreateSystemDefaultDevice() *Device;

var class_MTLCompileOptions: objc.Class = undefined;
var class_MTLRenderPipelineColorAttachmentDescriptor: objc.Class = undefined;
var class_MTLRenderPipelineColorAttachmentDescriptorArray: objc.Class = undefined;
var class_MTLRenderPipelineDescriptor: objc.Class = undefined;

var sel_addDebugMarker_range_: objc.SEL = undefined;
var sel_alloc: objc.SEL = undefined;
var sel_alphaBlendOperation: objc.SEL = undefined;
var sel_binaryArchives: objc.SEL = undefined;
var sel_colorAttachments: objc.SEL = undefined;
var sel_commandBuffer: objc.SEL = undefined;
var sel_commit: objc.SEL = undefined;
var sel_computeCommandEncoder: objc.SEL = undefined;
var sel_contents: objc.SEL = undefined;
var sel_depthAttachmentPixelFormat: objc.SEL = undefined;
var sel_destinationAlphaBlendFactor: objc.SEL = undefined;
var sel_destinationRGBBlendFactor: objc.SEL = undefined;
var sel_device: objc.SEL = undefined;
var sel_didModifyRange_: objc.SEL = undefined;
var sel_dispatchThreadgroups_threadsPerThreadgroup_: objc.SEL = undefined;
var sel_dispatchThreadsPerTile_: objc.SEL = undefined;
var sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_: objc.SEL = undefined;
var sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_: objc.SEL = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_: objc.SEL = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_: objc.SEL = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_: objc.SEL = undefined;
var sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_: objc.SEL = undefined;
var sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_: objc.SEL = undefined;
var sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_: objc.SEL = undefined;
var sel_drawPrimitives_indirectBuffer_indirectBufferOffset_: objc.SEL = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_: objc.SEL = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_instanceCount_: objc.SEL = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_: objc.SEL = undefined;
var sel_endEncoding: objc.SEL = undefined;
var sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_: objc.SEL = undefined;
var sel_executeCommandsInBuffer_withRange_: objc.SEL = undefined;
var sel_fastMathEnabled: objc.SEL = undefined;
var sel_fragmentBuffers: objc.SEL = undefined;
var sel_fragmentFunction: objc.SEL = undefined;
var sel_fragmentLinkedFunctions: objc.SEL = undefined;
var sel_fragmentPreloadedLibraries: objc.SEL = undefined;
var sel_functionHandleWithFunction_stage_: objc.SEL = undefined;
var sel_imageblockMemoryLengthForDimensions_: objc.SEL = undefined;
var sel_imageblockSampleLength: objc.SEL = undefined;
var sel_init: objc.SEL = undefined;
var sel_inputPrimitiveTopology: objc.SEL = undefined;
var sel_installName: objc.SEL = undefined;
var sel_isAlphaToCoverageEnabled: objc.SEL = undefined;
var sel_isAlphaToOneEnabled: objc.SEL = undefined;
var sel_isBlendingEnabled: objc.SEL = undefined;
var sel_isRasterizationEnabled: objc.SEL = undefined;
var sel_isTessellationFactorScaleEnabled: objc.SEL = undefined;
var sel_label: objc.SEL = undefined;
var sel_languageVersion: objc.SEL = undefined;
var sel_length: objc.SEL = undefined;
var sel_libraries: objc.SEL = undefined;
var sel_libraryType: objc.SEL = undefined;
var sel_maxFragmentCallStackDepth: objc.SEL = undefined;
var sel_maxTessellationFactor: objc.SEL = undefined;
var sel_maxTotalThreadsPerThreadgroup: objc.SEL = undefined;
var sel_maxVertexAmplificationCount: objc.SEL = undefined;
var sel_maxVertexCallStackDepth: objc.SEL = undefined;
var sel_memoryBarrierWithResources_count_afterStages_beforeStages_: objc.SEL = undefined;
var sel_memoryBarrierWithScope_afterStages_beforeStages_: objc.SEL = undefined;
var sel_name: objc.SEL = undefined;
var sel_newBufferWithBytes_length_options_: objc.SEL = undefined;
var sel_newBufferWithLength_options_: objc.SEL = undefined;
var sel_newCommandQueue: objc.SEL = undefined;
var sel_newComputePipelineStateWithFunction_error_: objc.SEL = undefined;
var sel_newFunctionWithName_: objc.SEL = undefined;
var sel_newIntersectionFunctionTableWithDescriptor_stage_: objc.SEL = undefined;
var sel_newLibraryWithFile_error_: objc.SEL = undefined;
var sel_newLibraryWithSource_options_error_: objc.SEL = undefined;
var sel_newRemoteBufferViewForDevice_: objc.SEL = undefined;
var sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_: objc.SEL = undefined;
var sel_newRenderPipelineStateWithDescriptor_error_: objc.SEL = undefined;
var sel_newTextureWithDescriptor_offset_bytesPerRow_: objc.SEL = undefined;
var sel_newVisibleFunctionTableWithDescriptor_stage_: objc.SEL = undefined;
var sel_objectAtIndexedSubscript_: objc.SEL = undefined;
var sel_pixelFormat: objc.SEL = undefined;
var sel_preprocessorMacros: objc.SEL = undefined;
var sel_presentDrawable_: objc.SEL = undefined;
var sel_preserveInvariance: objc.SEL = undefined;
var sel_rasterSampleCount: objc.SEL = undefined;
var sel_remoteStorageBuffer: objc.SEL = undefined;
var sel_removeAllDebugMarkers: objc.SEL = undefined;
var sel_renderCommandEncoderWithDescriptor_: objc.SEL = undefined;
var sel_reset: objc.SEL = undefined;
var sel_rgbBlendOperation: objc.SEL = undefined;
var sel_sampleCount: objc.SEL = undefined;
var sel_sampleCountersInBuffer_atSampleIndex_withBarrier_: objc.SEL = undefined;
var sel_setAlphaBlendOperation_: objc.SEL = undefined;
var sel_setAlphaToCoverageEnabled_: objc.SEL = undefined;
var sel_setAlphaToOneEnabled_: objc.SEL = undefined;
var sel_setBinaryArchives_: objc.SEL = undefined;
var sel_setBlendColorRed_green_blue_alpha_: objc.SEL = undefined;
var sel_setBlendingEnabled_: objc.SEL = undefined;
var sel_setBuffer_offset_atIndex_: objc.SEL = undefined;
var sel_setColorStoreAction_atIndex_: objc.SEL = undefined;
var sel_setColorStoreActionOptions_atIndex_: objc.SEL = undefined;
var sel_setComputePipelineState_: objc.SEL = undefined;
var sel_setCullMode_: objc.SEL = undefined;
var sel_setDepthAttachmentPixelFormat_: objc.SEL = undefined;
var sel_setDepthBias_slopeScale_clamp_: objc.SEL = undefined;
var sel_setDepthClipMode_: objc.SEL = undefined;
var sel_setDepthStencilState_: objc.SEL = undefined;
var sel_setDepthStoreAction_: objc.SEL = undefined;
var sel_setDepthStoreActionOptions_: objc.SEL = undefined;
var sel_setDestinationAlphaBlendFactor_: objc.SEL = undefined;
var sel_setDestinationRGBBlendFactor_: objc.SEL = undefined;
var sel_setFastMathEnabled_: objc.SEL = undefined;
var sel_setFragmentAccelerationStructure_atBufferIndex_: objc.SEL = undefined;
var sel_setFragmentBuffer_offset_atIndex_: objc.SEL = undefined;
var sel_setFragmentBufferOffset_atIndex_: objc.SEL = undefined;
var sel_setFragmentBuffers_offsets_withRange_: objc.SEL = undefined;
var sel_setFragmentBytes_length_atIndex_: objc.SEL = undefined;
var sel_setFragmentFunction_: objc.SEL = undefined;
var sel_setFragmentIntersectionFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setFragmentIntersectionFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setFragmentLinkedFunctions_: objc.SEL = undefined;
var sel_setFragmentPreloadedLibraries_: objc.SEL = undefined;
var sel_setFragmentSamplerState_atIndex_: objc.SEL = undefined;
var sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_: objc.SEL = undefined;
var sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_: objc.SEL = undefined;
var sel_setFragmentSamplerStates_withRange_: objc.SEL = undefined;
var sel_setFragmentTexture_atIndex_: objc.SEL = undefined;
var sel_setFragmentTextures_withRange_: objc.SEL = undefined;
var sel_setFragmentVisibleFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setFragmentVisibleFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setFrontFacingWinding_: objc.SEL = undefined;
var sel_setInputPrimitiveTopology_: objc.SEL = undefined;
var sel_setInstallName_: objc.SEL = undefined;
var sel_setLabel_: objc.SEL = undefined;
var sel_setLanguageVersion_: objc.SEL = undefined;
var sel_setLibraries_: objc.SEL = undefined;
var sel_setLibraryType_: objc.SEL = undefined;
var sel_setMaxFragmentCallStackDepth_: objc.SEL = undefined;
var sel_setMaxTessellationFactor_: objc.SEL = undefined;
var sel_setMaxVertexAmplificationCount_: objc.SEL = undefined;
var sel_setMaxVertexCallStackDepth_: objc.SEL = undefined;
var sel_setObject_atIndexedSubscript_: objc.SEL = undefined;
var sel_setPixelFormat_: objc.SEL = undefined;
var sel_setPreprocessorMacros_: objc.SEL = undefined;
var sel_setPreserveInvariance_: objc.SEL = undefined;
var sel_setRasterizationEnabled_: objc.SEL = undefined;
var sel_setRasterSampleCount_: objc.SEL = undefined;
var sel_setRenderPipelineState_: objc.SEL = undefined;
var sel_setRgbBlendOperation_: objc.SEL = undefined;
var sel_setSampleCount_: objc.SEL = undefined;
var sel_setScissorRect_: objc.SEL = undefined;
var sel_setScissorRects_count_: objc.SEL = undefined;
var sel_setSourceAlphaBlendFactor_: objc.SEL = undefined;
var sel_setSourceRGBBlendFactor_: objc.SEL = undefined;
var sel_setStencilAttachmentPixelFormat_: objc.SEL = undefined;
var sel_setStencilFrontReferenceValue_backReferenceValue_: objc.SEL = undefined;
var sel_setStencilReferenceValue_: objc.SEL = undefined;
var sel_setStencilStoreAction_: objc.SEL = undefined;
var sel_setStencilStoreActionOptions_: objc.SEL = undefined;
var sel_setSupportAddingFragmentBinaryFunctions_: objc.SEL = undefined;
var sel_setSupportAddingVertexBinaryFunctions_: objc.SEL = undefined;
var sel_setSupportIndirectCommandBuffers_: objc.SEL = undefined;
var sel_setTessellationControlPointIndexType_: objc.SEL = undefined;
var sel_setTessellationFactorBuffer_offset_instanceStride_: objc.SEL = undefined;
var sel_setTessellationFactorFormat_: objc.SEL = undefined;
var sel_setTessellationFactorScale_: objc.SEL = undefined;
var sel_setTessellationFactorScaleEnabled_: objc.SEL = undefined;
var sel_setTessellationFactorStepFunction_: objc.SEL = undefined;
var sel_setTessellationOutputWindingOrder_: objc.SEL = undefined;
var sel_setTessellationPartitionMode_: objc.SEL = undefined;
var sel_setThreadgroupMemoryLength_offset_atIndex_: objc.SEL = undefined;
var sel_setTileAccelerationStructure_atBufferIndex_: objc.SEL = undefined;
var sel_setTileBuffer_offset_atIndex_: objc.SEL = undefined;
var sel_setTileBufferOffset_atIndex_: objc.SEL = undefined;
var sel_setTileBuffers_offsets_withRange_: objc.SEL = undefined;
var sel_setTileBytes_length_atIndex_: objc.SEL = undefined;
var sel_setTileIntersectionFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setTileIntersectionFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setTileSamplerState_atIndex_: objc.SEL = undefined;
var sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_: objc.SEL = undefined;
var sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_: objc.SEL = undefined;
var sel_setTileSamplerStates_withRange_: objc.SEL = undefined;
var sel_setTileTexture_atIndex_: objc.SEL = undefined;
var sel_setTileTextures_withRange_: objc.SEL = undefined;
var sel_setTileVisibleFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setTileVisibleFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setTriangleFillMode_: objc.SEL = undefined;
var sel_setVertexAccelerationStructure_atBufferIndex_: objc.SEL = undefined;
var sel_setVertexAmplificationCount_viewMappings_: objc.SEL = undefined;
var sel_setVertexBuffer_offset_atIndex_: objc.SEL = undefined;
var sel_setVertexBufferOffset_atIndex_: objc.SEL = undefined;
var sel_setVertexBuffers_offsets_withRange_: objc.SEL = undefined;
var sel_setVertexBytes_length_atIndex_: objc.SEL = undefined;
var sel_setVertexDescriptor_: objc.SEL = undefined;
var sel_setVertexFunction_: objc.SEL = undefined;
var sel_setVertexIntersectionFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setVertexIntersectionFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setVertexLinkedFunctions_: objc.SEL = undefined;
var sel_setVertexPreloadedLibraries_: objc.SEL = undefined;
var sel_setVertexSamplerState_atIndex_: objc.SEL = undefined;
var sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_: objc.SEL = undefined;
var sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_: objc.SEL = undefined;
var sel_setVertexSamplerStates_withRange_: objc.SEL = undefined;
var sel_setVertexTexture_atIndex_: objc.SEL = undefined;
var sel_setVertexTextures_withRange_: objc.SEL = undefined;
var sel_setVertexVisibleFunctionTable_atBufferIndex_: objc.SEL = undefined;
var sel_setVertexVisibleFunctionTables_withBufferRange_: objc.SEL = undefined;
var sel_setViewport_: objc.SEL = undefined;
var sel_setViewports_count_: objc.SEL = undefined;
var sel_setVisibilityResultMode_offset_: objc.SEL = undefined;
var sel_setWriteMask_: objc.SEL = undefined;
var sel_sourceAlphaBlendFactor: objc.SEL = undefined;
var sel_sourceRGBBlendFactor: objc.SEL = undefined;
var sel_stencilAttachmentPixelFormat: objc.SEL = undefined;
var sel_supportAddingFragmentBinaryFunctions: objc.SEL = undefined;
var sel_supportAddingVertexBinaryFunctions: objc.SEL = undefined;
var sel_supportIndirectCommandBuffers: objc.SEL = undefined;
var sel_tessellationControlPointIndexType: objc.SEL = undefined;
var sel_tessellationFactorFormat: objc.SEL = undefined;
var sel_tessellationFactorStepFunction: objc.SEL = undefined;
var sel_tessellationOutputWindingOrder: objc.SEL = undefined;
var sel_tessellationPartitionMode: objc.SEL = undefined;
var sel_textureBarrier: objc.SEL = undefined;
var sel_threadgroupSizeMatchesTileSize: objc.SEL = undefined;
var sel_tileHeight: objc.SEL = undefined;
var sel_tileWidth: objc.SEL = undefined;
var sel_updateFence_afterStages_: objc.SEL = undefined;
var sel_useHeap_: objc.SEL = undefined;
var sel_useHeap_stages_: objc.SEL = undefined;
var sel_useHeaps_count_: objc.SEL = undefined;
var sel_useHeaps_count_stages_: objc.SEL = undefined;
var sel_useResource_usage_: objc.SEL = undefined;
var sel_useResource_usage_stages_: objc.SEL = undefined;
var sel_useResources_count_usage_: objc.SEL = undefined;
var sel_useResources_count_usage_stages_: objc.SEL = undefined;
var sel_vertexBuffers: objc.SEL = undefined;
var sel_vertexDescriptor: objc.SEL = undefined;
var sel_vertexFunction: objc.SEL = undefined;
var sel_vertexLinkedFunctions: objc.SEL = undefined;
var sel_vertexPreloadedLibraries: objc.SEL = undefined;
var sel_waitForFence_beforeStages_: objc.SEL = undefined;
var sel_waitUntilCompleted: objc.SEL = undefined;
var sel_writeMask: objc.SEL = undefined;

pub fn _init() void {
    class_MTLCompileOptions = objc.class("MTLCompileOptions");
    class_MTLRenderPipelineColorAttachmentDescriptor = objc.class("MTLRenderPipelineColorAttachmentDescriptor");
    class_MTLRenderPipelineColorAttachmentDescriptorArray = objc.class("MTLRenderPipelineColorAttachmentDescriptorArray");
    class_MTLRenderPipelineDescriptor = objc.class("MTLRenderPipelineDescriptor");

    sel_addDebugMarker_range_ = objc.selector("addDebugMarker:range:");
    sel_alloc = objc.selector("alloc");
    sel_alphaBlendOperation = objc.selector("alphaBlendOperation");
    sel_binaryArchives = objc.selector("binaryArchives");
    sel_colorAttachments = objc.selector("colorAttachments");
    sel_commandBuffer = objc.selector("commandBuffer");
    sel_commit = objc.selector("commit");
    sel_computeCommandEncoder = objc.selector("computeCommandEncoder");
    sel_contents = objc.selector("contents");
    sel_depthAttachmentPixelFormat = objc.selector("depthAttachmentPixelFormat");
    sel_destinationAlphaBlendFactor = objc.selector("destinationAlphaBlendFactor");
    sel_destinationRGBBlendFactor = objc.selector("destinationRGBBlendFactor");
    sel_device = objc.selector("device");
    sel_didModifyRange_ = objc.selector("didModifyRange:");
    sel_dispatchThreadgroups_threadsPerThreadgroup_ = objc.selector("dispatchThreadgroups:threadsPerThreadgroup:");
    sel_dispatchThreadsPerTile_ = objc.selector("dispatchThreadsPerTile:");
    sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_ = objc.selector("drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:");
    sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_ = objc.selector("drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:");
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_ = objc.selector("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:");
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_ = objc.selector("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:");
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ = objc.selector("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:");
    sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_ = objc.selector("drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:");
    sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_ = objc.selector("drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:");
    sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_ = objc.selector("drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:");
    sel_drawPrimitives_indirectBuffer_indirectBufferOffset_ = objc.selector("drawPrimitives:indirectBuffer:indirectBufferOffset:");
    sel_drawPrimitives_vertexStart_vertexCount_ = objc.selector("drawPrimitives:vertexStart:vertexCount:");
    sel_drawPrimitives_vertexStart_vertexCount_instanceCount_ = objc.selector("drawPrimitives:vertexStart:vertexCount:instanceCount:");
    sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ = objc.selector("drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:");
    sel_endEncoding = objc.selector("endEncoding");
    sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ = objc.selector("executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:");
    sel_executeCommandsInBuffer_withRange_ = objc.selector("executeCommandsInBuffer:withRange:");
    sel_fastMathEnabled = objc.selector("fastMathEnabled");
    sel_fragmentBuffers = objc.selector("fragmentBuffers");
    sel_fragmentFunction = objc.selector("fragmentFunction");
    sel_fragmentLinkedFunctions = objc.selector("fragmentLinkedFunctions");
    sel_fragmentPreloadedLibraries = objc.selector("fragmentPreloadedLibraries");
    sel_functionHandleWithFunction_stage_ = objc.selector("functionHandleWithFunction:stage:");
    sel_imageblockMemoryLengthForDimensions_ = objc.selector("imageblockMemoryLengthForDimensions:");
    sel_imageblockSampleLength = objc.selector("imageblockSampleLength");
    sel_init = objc.selector("init");
    sel_inputPrimitiveTopology = objc.selector("inputPrimitiveTopology");
    sel_installName = objc.selector("installName");
    sel_isAlphaToCoverageEnabled = objc.selector("isAlphaToCoverageEnabled");
    sel_isAlphaToOneEnabled = objc.selector("isAlphaToOneEnabled");
    sel_isBlendingEnabled = objc.selector("isBlendingEnabled");
    sel_isRasterizationEnabled = objc.selector("isRasterizationEnabled");
    sel_isTessellationFactorScaleEnabled = objc.selector("isTessellationFactorScaleEnabled");
    sel_label = objc.selector("label");
    sel_languageVersion = objc.selector("languageVersion");
    sel_length = objc.selector("length");
    sel_libraries = objc.selector("libraries");
    sel_libraryType = objc.selector("libraryType");
    sel_maxFragmentCallStackDepth = objc.selector("maxFragmentCallStackDepth");
    sel_maxTessellationFactor = objc.selector("maxTessellationFactor");
    sel_maxTotalThreadsPerThreadgroup = objc.selector("maxTotalThreadsPerThreadgroup");
    sel_maxVertexAmplificationCount = objc.selector("maxVertexAmplificationCount");
    sel_maxVertexCallStackDepth = objc.selector("maxVertexCallStackDepth");
    sel_memoryBarrierWithResources_count_afterStages_beforeStages_ = objc.selector("memoryBarrierWithResources:count:afterStages:beforeStages:");
    sel_memoryBarrierWithScope_afterStages_beforeStages_ = objc.selector("memoryBarrierWithScope:afterStages:beforeStages:");
    sel_name = objc.selector("name");
    sel_newBufferWithBytes_length_options_ = objc.selector("newBufferWithBytes:length:options:");
    sel_newBufferWithLength_options_ = objc.selector("newBufferWithLength:options:");
    sel_newCommandQueue = objc.selector("newCommandQueue");
    sel_newComputePipelineStateWithFunction_error_ = objc.selector("newComputePipelineStateWithFunction:error:");
    sel_newFunctionWithName_ = objc.selector("newFunctionWithName:");
    sel_newIntersectionFunctionTableWithDescriptor_stage_ = objc.selector("newIntersectionFunctionTableWithDescriptor:stage:");
    sel_newLibraryWithFile_error_ = objc.selector("newLibraryWithFile:error:");
    sel_newLibraryWithSource_options_error_ = objc.selector("newLibraryWithSource:options:error:");
    sel_newRemoteBufferViewForDevice_ = objc.selector("newRemoteBufferViewForDevice:");
    sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_ = objc.selector("newRenderPipelineStateWithAdditionalBinaryFunctions:error:");
    sel_newRenderPipelineStateWithDescriptor_error_ = objc.selector("newRenderPipelineStateWithDescriptor:error:");
    sel_newTextureWithDescriptor_offset_bytesPerRow_ = objc.selector("newTextureWithDescriptor:offset:bytesPerRow:");
    sel_newVisibleFunctionTableWithDescriptor_stage_ = objc.selector("newVisibleFunctionTableWithDescriptor:stage:");
    sel_objectAtIndexedSubscript_ = objc.selector("objectAtIndexedSubscript:");
    sel_pixelFormat = objc.selector("pixelFormat");
    sel_preprocessorMacros = objc.selector("preprocessorMacros");
    sel_presentDrawable_ = objc.selector("presentDrawable:");
    sel_preserveInvariance = objc.selector("preserveInvariance");
    sel_rasterSampleCount = objc.selector("rasterSampleCount");
    sel_remoteStorageBuffer = objc.selector("remoteStorageBuffer");
    sel_removeAllDebugMarkers = objc.selector("removeAllDebugMarkers");
    sel_renderCommandEncoderWithDescriptor_ = objc.selector("renderCommandEncoderWithDescriptor:");
    sel_reset = objc.selector("reset");
    sel_rgbBlendOperation = objc.selector("rgbBlendOperation");
    sel_sampleCount = objc.selector("sampleCount");
    sel_sampleCountersInBuffer_atSampleIndex_withBarrier_ = objc.selector("sampleCountersInBuffer:atSampleIndex:withBarrier:");
    sel_setAlphaBlendOperation_ = objc.selector("setAlphaBlendOperation:");
    sel_setAlphaToCoverageEnabled_ = objc.selector("setAlphaToCoverageEnabled:");
    sel_setAlphaToOneEnabled_ = objc.selector("setAlphaToOneEnabled:");
    sel_setBinaryArchives_ = objc.selector("setBinaryArchives:");
    sel_setBlendColorRed_green_blue_alpha_ = objc.selector("setBlendColorRed:green:blue:alpha:");
    sel_setBlendingEnabled_ = objc.selector("setBlendingEnabled:");
    sel_setBuffer_offset_atIndex_ = objc.selector("setBuffer:offset:atIndex:");
    sel_setColorStoreAction_atIndex_ = objc.selector("setColorStoreAction:atIndex:");
    sel_setColorStoreActionOptions_atIndex_ = objc.selector("setColorStoreActionOptions:atIndex:");
    sel_setComputePipelineState_ = objc.selector("setComputePipelineState:");
    sel_setCullMode_ = objc.selector("setCullMode:");
    sel_setDepthAttachmentPixelFormat_ = objc.selector("setDepthAttachmentPixelFormat:");
    sel_setDepthBias_slopeScale_clamp_ = objc.selector("setDepthBias:slopeScale:clamp:");
    sel_setDepthClipMode_ = objc.selector("setDepthClipMode:");
    sel_setDepthStencilState_ = objc.selector("setDepthStencilState:");
    sel_setDepthStoreAction_ = objc.selector("setDepthStoreAction:");
    sel_setDepthStoreActionOptions_ = objc.selector("setDepthStoreActionOptions:");
    sel_setDestinationAlphaBlendFactor_ = objc.selector("setDestinationAlphaBlendFactor:");
    sel_setDestinationRGBBlendFactor_ = objc.selector("setDestinationRGBBlendFactor:");
    sel_setFastMathEnabled_ = objc.selector("setFastMathEnabled:");
    sel_setFragmentAccelerationStructure_atBufferIndex_ = objc.selector("setFragmentAccelerationStructure:atBufferIndex:");
    sel_setFragmentBuffer_offset_atIndex_ = objc.selector("setFragmentBuffer:offset:atIndex:");
    sel_setFragmentBufferOffset_atIndex_ = objc.selector("setFragmentBufferOffset:atIndex:");
    sel_setFragmentBuffers_offsets_withRange_ = objc.selector("setFragmentBuffers:offsets:withRange:");
    sel_setFragmentBytes_length_atIndex_ = objc.selector("setFragmentBytes:length:atIndex:");
    sel_setFragmentFunction_ = objc.selector("setFragmentFunction:");
    sel_setFragmentIntersectionFunctionTable_atBufferIndex_ = objc.selector("setFragmentIntersectionFunctionTable:atBufferIndex:");
    sel_setFragmentIntersectionFunctionTables_withBufferRange_ = objc.selector("setFragmentIntersectionFunctionTables:withBufferRange:");
    sel_setFragmentLinkedFunctions_ = objc.selector("setFragmentLinkedFunctions:");
    sel_setFragmentPreloadedLibraries_ = objc.selector("setFragmentPreloadedLibraries:");
    sel_setFragmentSamplerState_atIndex_ = objc.selector("setFragmentSamplerState:atIndex:");
    sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = objc.selector("setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
    sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = objc.selector("setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
    sel_setFragmentSamplerStates_withRange_ = objc.selector("setFragmentSamplerStates:withRange:");
    sel_setFragmentTexture_atIndex_ = objc.selector("setFragmentTexture:atIndex:");
    sel_setFragmentTextures_withRange_ = objc.selector("setFragmentTextures:withRange:");
    sel_setFragmentVisibleFunctionTable_atBufferIndex_ = objc.selector("setFragmentVisibleFunctionTable:atBufferIndex:");
    sel_setFragmentVisibleFunctionTables_withBufferRange_ = objc.selector("setFragmentVisibleFunctionTables:withBufferRange:");
    sel_setFrontFacingWinding_ = objc.selector("setFrontFacingWinding:");
    sel_setInputPrimitiveTopology_ = objc.selector("setInputPrimitiveTopology:");
    sel_setInstallName_ = objc.selector("setInstallName:");
    sel_setLabel_ = objc.selector("setLabel:");
    sel_setLanguageVersion_ = objc.selector("setLanguageVersion:");
    sel_setLibraries_ = objc.selector("setLibraries:");
    sel_setLibraryType_ = objc.selector("setLibraryType:");
    sel_setMaxFragmentCallStackDepth_ = objc.selector("setMaxFragmentCallStackDepth:");
    sel_setMaxTessellationFactor_ = objc.selector("setMaxTessellationFactor:");
    sel_setMaxVertexAmplificationCount_ = objc.selector("setMaxVertexAmplificationCount:");
    sel_setMaxVertexCallStackDepth_ = objc.selector("setMaxVertexCallStackDepth:");
    sel_setObject_atIndexedSubscript_ = objc.selector("setObject:atIndexedSubscript:");
    sel_setPixelFormat_ = objc.selector("setPixelFormat:");
    sel_setPreprocessorMacros_ = objc.selector("setPreprocessorMacros:");
    sel_setPreserveInvariance_ = objc.selector("setPreserveInvariance:");
    sel_setRasterizationEnabled_ = objc.selector("setRasterizationEnabled:");
    sel_setRasterSampleCount_ = objc.selector("setRasterSampleCount:");
    sel_setRenderPipelineState_ = objc.selector("setRenderPipelineState:");
    sel_setRgbBlendOperation_ = objc.selector("setRgbBlendOperation:");
    sel_setSampleCount_ = objc.selector("setSampleCount:");
    sel_setScissorRect_ = objc.selector("setScissorRect:");
    sel_setScissorRects_count_ = objc.selector("setScissorRects:count:");
    sel_setSourceAlphaBlendFactor_ = objc.selector("setSourceAlphaBlendFactor:");
    sel_setSourceRGBBlendFactor_ = objc.selector("setSourceRGBBlendFactor:");
    sel_setStencilAttachmentPixelFormat_ = objc.selector("setStencilAttachmentPixelFormat:");
    sel_setStencilFrontReferenceValue_backReferenceValue_ = objc.selector("setStencilFrontReferenceValue:backReferenceValue:");
    sel_setStencilReferenceValue_ = objc.selector("setStencilReferenceValue:");
    sel_setStencilStoreAction_ = objc.selector("setStencilStoreAction:");
    sel_setStencilStoreActionOptions_ = objc.selector("setStencilStoreActionOptions:");
    sel_setSupportAddingFragmentBinaryFunctions_ = objc.selector("setSupportAddingFragmentBinaryFunctions:");
    sel_setSupportAddingVertexBinaryFunctions_ = objc.selector("setSupportAddingVertexBinaryFunctions:");
    sel_setSupportIndirectCommandBuffers_ = objc.selector("setSupportIndirectCommandBuffers:");
    sel_setTessellationControlPointIndexType_ = objc.selector("setTessellationControlPointIndexType:");
    sel_setTessellationFactorBuffer_offset_instanceStride_ = objc.selector("setTessellationFactorBuffer:offset:instanceStride:");
    sel_setTessellationFactorFormat_ = objc.selector("setTessellationFactorFormat:");
    sel_setTessellationFactorScale_ = objc.selector("setTessellationFactorScale:");
    sel_setTessellationFactorScaleEnabled_ = objc.selector("setTessellationFactorScaleEnabled:");
    sel_setTessellationFactorStepFunction_ = objc.selector("setTessellationFactorStepFunction:");
    sel_setTessellationOutputWindingOrder_ = objc.selector("setTessellationOutputWindingOrder:");
    sel_setTessellationPartitionMode_ = objc.selector("setTessellationPartitionMode:");
    sel_setThreadgroupMemoryLength_offset_atIndex_ = objc.selector("setThreadgroupMemoryLength:offset:atIndex:");
    sel_setTileAccelerationStructure_atBufferIndex_ = objc.selector("setTileAccelerationStructure:atBufferIndex:");
    sel_setTileBuffer_offset_atIndex_ = objc.selector("setTileBuffer:offset:atIndex:");
    sel_setTileBufferOffset_atIndex_ = objc.selector("setTileBufferOffset:atIndex:");
    sel_setTileBuffers_offsets_withRange_ = objc.selector("setTileBuffers:offsets:withRange:");
    sel_setTileBytes_length_atIndex_ = objc.selector("setTileBytes:length:atIndex:");
    sel_setTileIntersectionFunctionTable_atBufferIndex_ = objc.selector("setTileIntersectionFunctionTable:atBufferIndex:");
    sel_setTileIntersectionFunctionTables_withBufferRange_ = objc.selector("setTileIntersectionFunctionTables:withBufferRange:");
    sel_setTileSamplerState_atIndex_ = objc.selector("setTileSamplerState:atIndex:");
    sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = objc.selector("setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
    sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = objc.selector("setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
    sel_setTileSamplerStates_withRange_ = objc.selector("setTileSamplerStates:withRange:");
    sel_setTileTexture_atIndex_ = objc.selector("setTileTexture:atIndex:");
    sel_setTileTextures_withRange_ = objc.selector("setTileTextures:withRange:");
    sel_setTileVisibleFunctionTable_atBufferIndex_ = objc.selector("setTileVisibleFunctionTable:atBufferIndex:");
    sel_setTileVisibleFunctionTables_withBufferRange_ = objc.selector("setTileVisibleFunctionTables:withBufferRange:");
    sel_setTriangleFillMode_ = objc.selector("setTriangleFillMode:");
    sel_setVertexAccelerationStructure_atBufferIndex_ = objc.selector("setVertexAccelerationStructure:atBufferIndex:");
    sel_setVertexAmplificationCount_viewMappings_ = objc.selector("setVertexAmplificationCount:viewMappings:");
    sel_setVertexBuffer_offset_atIndex_ = objc.selector("setVertexBuffer:offset:atIndex:");
    sel_setVertexBufferOffset_atIndex_ = objc.selector("setVertexBufferOffset:atIndex:");
    sel_setVertexBuffers_offsets_withRange_ = objc.selector("setVertexBuffers:offsets:withRange:");
    sel_setVertexBytes_length_atIndex_ = objc.selector("setVertexBytes:length:atIndex:");
    sel_setVertexDescriptor_ = objc.selector("setVertexDescriptor:");
    sel_setVertexFunction_ = objc.selector("setVertexFunction:");
    sel_setVertexIntersectionFunctionTable_atBufferIndex_ = objc.selector("setVertexIntersectionFunctionTable:atBufferIndex:");
    sel_setVertexIntersectionFunctionTables_withBufferRange_ = objc.selector("setVertexIntersectionFunctionTables:withBufferRange:");
    sel_setVertexLinkedFunctions_ = objc.selector("setVertexLinkedFunctions:");
    sel_setVertexPreloadedLibraries_ = objc.selector("setVertexPreloadedLibraries:");
    sel_setVertexSamplerState_atIndex_ = objc.selector("setVertexSamplerState:atIndex:");
    sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = objc.selector("setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
    sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = objc.selector("setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
    sel_setVertexSamplerStates_withRange_ = objc.selector("setVertexSamplerStates:withRange:");
    sel_setVertexTexture_atIndex_ = objc.selector("setVertexTexture:atIndex:");
    sel_setVertexTextures_withRange_ = objc.selector("setVertexTextures:withRange:");
    sel_setVertexVisibleFunctionTable_atBufferIndex_ = objc.selector("setVertexVisibleFunctionTable:atBufferIndex:");
    sel_setVertexVisibleFunctionTables_withBufferRange_ = objc.selector("setVertexVisibleFunctionTables:withBufferRange:");
    sel_setViewport_ = objc.selector("setViewport:");
    sel_setViewports_count_ = objc.selector("setViewports:count:");
    sel_setVisibilityResultMode_offset_ = objc.selector("setVisibilityResultMode:offset:");
    sel_setWriteMask_ = objc.selector("setWriteMask:");
    sel_sourceAlphaBlendFactor = objc.selector("sourceAlphaBlendFactor");
    sel_sourceRGBBlendFactor = objc.selector("sourceRGBBlendFactor");
    sel_stencilAttachmentPixelFormat = objc.selector("stencilAttachmentPixelFormat");
    sel_supportAddingFragmentBinaryFunctions = objc.selector("supportAddingFragmentBinaryFunctions");
    sel_supportAddingVertexBinaryFunctions = objc.selector("supportAddingVertexBinaryFunctions");
    sel_supportIndirectCommandBuffers = objc.selector("supportIndirectCommandBuffers");
    sel_tessellationControlPointIndexType = objc.selector("tessellationControlPointIndexType");
    sel_tessellationFactorFormat = objc.selector("tessellationFactorFormat");
    sel_tessellationFactorStepFunction = objc.selector("tessellationFactorStepFunction");
    sel_tessellationOutputWindingOrder = objc.selector("tessellationOutputWindingOrder");
    sel_tessellationPartitionMode = objc.selector("tessellationPartitionMode");
    sel_textureBarrier = objc.selector("textureBarrier");
    sel_threadgroupSizeMatchesTileSize = objc.selector("threadgroupSizeMatchesTileSize");
    sel_tileHeight = objc.selector("tileHeight");
    sel_tileWidth = objc.selector("tileWidth");
    sel_updateFence_afterStages_ = objc.selector("updateFence:afterStages:");
    sel_useHeap_ = objc.selector("useHeap:");
    sel_useHeap_stages_ = objc.selector("useHeap:stages:");
    sel_useHeaps_count_ = objc.selector("useHeaps:count:");
    sel_useHeaps_count_stages_ = objc.selector("useHeaps:count:stages:");
    sel_useResource_usage_ = objc.selector("useResource:usage:");
    sel_useResource_usage_stages_ = objc.selector("useResource:usage:stages:");
    sel_useResources_count_usage_ = objc.selector("useResources:count:usage:");
    sel_useResources_count_usage_stages_ = objc.selector("useResources:count:usage:stages:");
    sel_vertexBuffers = objc.selector("vertexBuffers");
    sel_vertexDescriptor = objc.selector("vertexDescriptor");
    sel_vertexFunction = objc.selector("vertexFunction");
    sel_vertexLinkedFunctions = objc.selector("vertexLinkedFunctions");
    sel_vertexPreloadedLibraries = objc.selector("vertexPreloadedLibraries");
    sel_waitForFence_beforeStages_ = objc.selector("waitForFence:beforeStages:");
    sel_waitUntilCompleted = objc.selector("waitUntilCompleted");
    sel_writeMask = objc.selector("writeMask");
}

pub const BarrierScope = ns.UInteger;
pub const BarrierScopeBuffers = 1;
pub const BarrierScopeTextures = 2;
pub const BarrierScopeRenderTargets = 4;

pub const BlendFactor = ns.UInteger;
pub const BlendFactorZero = 0;
pub const BlendFactorOne = 1;
pub const BlendFactorSourceColor = 2;
pub const BlendFactorOneMinusSourceColor = 3;
pub const BlendFactorSourceAlpha = 4;
pub const BlendFactorOneMinusSourceAlpha = 5;
pub const BlendFactorDestinationColor = 6;
pub const BlendFactorOneMinusDestinationColor = 7;
pub const BlendFactorDestinationAlpha = 8;
pub const BlendFactorOneMinusDestinationAlpha = 9;
pub const BlendFactorSourceAlphaSaturated = 10;
pub const BlendFactorBlendColor = 11;
pub const BlendFactorOneMinusBlendColor = 12;
pub const BlendFactorBlendAlpha = 13;
pub const BlendFactorOneMinusBlendAlpha = 14;
pub const BlendFactorSource1Color = 15;
pub const BlendFactorOneMinusSource1Color = 16;
pub const BlendFactorSource1Alpha = 17;
pub const BlendFactorOneMinusSource1Alpha = 18;

pub const BlendOperation = ns.UInteger;
pub const BlendOperationAdd = 0;
pub const BlendOperationSubtract = 1;
pub const BlendOperationReverseSubtract = 2;
pub const BlendOperationMin = 3;
pub const BlendOperationMax = 4;

pub const ColorWriteMask = ns.UInteger;
pub const ColorWriteMaskNone = 0;
pub const ColorWriteMaskAlpha = 1;
pub const ColorWriteMaskBlue = 2;
pub const ColorWriteMaskGreen = 4;
pub const ColorWriteMaskRed = 8;
pub const ColorWriteMaskAll = 15;

pub const CullMode = ns.UInteger;
pub const CullModeNone = 0;
pub const CullModeFront = 1;
pub const CullModeBack = 2;

pub const DepthClipMode = ns.UInteger;
pub const DepthClipModeClip = 0;
pub const DepthClipModeClamp = 1;

pub const IndexType = ns.UInteger;
pub const IndexTypeUInt16 = 0;
pub const IndexTypeUInt32 = 1;

pub const LanguageVersion = ns.UInteger;
pub const LanguageVersion1_0 = 65536;
pub const LanguageVersion1_1 = 65537;
pub const LanguageVersion1_2 = 65538;
pub const LanguageVersion2_0 = 131072;
pub const LanguageVersion2_1 = 131073;
pub const LanguageVersion2_2 = 131074;
pub const LanguageVersion2_3 = 131075;
pub const LanguageVersion2_4 = 131076;

pub const LibraryType = ns.UInteger;
pub const LibraryTypeExecutable = 0;
pub const LibraryTypeDynamic = 1;

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

pub const PrimitiveTopologyClass = ns.UInteger;
pub const PrimitiveTopologyClassUnspecified = 0;
pub const PrimitiveTopologyClassPoint = 1;
pub const PrimitiveTopologyClassLine = 2;
pub const PrimitiveTopologyClassTriangle = 3;

pub const PrimitiveType = ns.UInteger;
pub const PrimitiveTypePoint = 0;
pub const PrimitiveTypeLine = 1;
pub const PrimitiveTypeLineStrip = 2;
pub const PrimitiveTypeTriangle = 3;
pub const PrimitiveTypeTriangleStrip = 4;

pub const RenderStages = ns.UInteger;
pub const RenderStageVertex = 1;
pub const RenderStageFragment = 2;
pub const RenderStageTile = 4;

pub const ResourceOptions = ns.UInteger;
pub const ResourceStorageModeShared = 0;
pub const ResourceHazardTrackingModeDefault = 0;
pub const ResourceCPUCacheModeDefaultCache = 0;
pub const ResourceOptionCPUCacheModeDefault = 0;
pub const ResourceCPUCacheModeWriteCombined = 1;
pub const ResourceOptionCPUCacheModeWriteCombined = 1;
pub const ResourceStorageModeManaged = 16;
pub const ResourceStorageModePrivate = 32;
pub const ResourceStorageModeMemoryless = 48;
pub const ResourceHazardTrackingModeUntracked = 256;
pub const ResourceHazardTrackingModeTracked = 512;

pub const ResourceUsage = ns.UInteger;
pub const ResourceUsageRead = 1;
pub const ResourceUsageWrite = 2;
pub const ResourceUsageSample = 4;

pub const StoreAction = ns.UInteger;
pub const StoreActionDontCare = 0;
pub const StoreActionStore = 1;
pub const StoreActionMultisampleResolve = 2;
pub const StoreActionStoreAndMultisampleResolve = 3;
pub const StoreActionUnknown = 4;
pub const StoreActionCustomSampleDepthStore = 5;

pub const StoreActionOptions = ns.UInteger;
pub const StoreActionOptionNone = 0;
pub const StoreActionOptionValidMask = 1;
pub const StoreActionOptionCustomSamplePositions = 1;

pub const TessellationControlPointIndexType = ns.UInteger;
pub const TessellationControlPointIndexTypeNone = 0;
pub const TessellationControlPointIndexTypeUInt16 = 1;
pub const TessellationControlPointIndexTypeUInt32 = 2;

pub const TessellationFactorFormat = ns.UInteger;
pub const TessellationFactorFormatHalf = 0;

pub const TessellationFactorStepFunction = ns.UInteger;
pub const TessellationFactorStepFunctionConstant = 0;
pub const TessellationFactorStepFunctionPerPatch = 1;
pub const TessellationFactorStepFunctionPerInstance = 2;
pub const TessellationFactorStepFunctionPerPatchAndPerInstance = 3;

pub const TessellationPartitionMode = ns.UInteger;
pub const TessellationPartitionModePow2 = 0;
pub const TessellationPartitionModeInteger = 1;
pub const TessellationPartitionModeFractionalOdd = 2;
pub const TessellationPartitionModeFractionalEven = 3;

pub const TriangleFillMode = ns.UInteger;
pub const TriangleFillModeFill = 0;
pub const TriangleFillModeLines = 1;

pub const VisibilityResultMode = ns.UInteger;
pub const VisibilityResultModeDisabled = 0;
pub const VisibilityResultModeBoolean = 1;
pub const VisibilityResultModeCounting = 2;

pub const Winding = ns.UInteger;
pub const WindingClockwise = 0;
pub const WindingCounterClockwise = 1;

pub const ClearColor = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    alpha: f64,

    pub fn init(red: f64, green: f64, blue: f64, alpha: f64) ClearColor {
        return ClearColor{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

pub const ScissorRect = extern struct {
    x: ns.UInteger,
    y: ns.UInteger,
    width: ns.UInteger,
    height: ns.UInteger,
};

pub const Size = extern struct {
    width: ns.UInteger,
    height: ns.UInteger,
    depth: ns.UInteger,

    pub fn init(width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Size {
        return Size{ .width = width, .height = height, .depth = depth };
    }
};

pub const VertexAmplificationViewMapping = extern struct {
    viewport_array_index_offset: u32,
    render_target_array_index_offset: u32,
};

pub const Viewport = extern struct {
    origin_x: f64,
    origin_y: f64,
    width: f64,
    height: f64,
    znear: f64,
    zfar: f64,
};

pub const AccelerationStructure = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const Buffer = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn length(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_length, .{});
            }

            pub fn contents(self: *T, comptime ReturnType: type) [*]ReturnType {
                return objc.msgSend([*]ReturnType, self, sel_contents, .{});
            }

            pub fn didModifyRange(self: *T, range: ns.Range) void {
                objc.msgSend(void, self, sel_didModifyRange_, .{range});
            }

            pub fn newTextureWithDescriptor_offset_bytesPerRow(self: *T, descriptor: *TextureDescriptor, offset: ns.UInteger, bytesPerRow: ns.UInteger) ?*Texture {
                return objc.msgSend(*Texture, self, sel_newTextureWithDescriptor_offset_bytesPerRow_, .{ descriptor, offset, bytesPerRow });
            }

            pub fn addDebugMarker_range(self: *T, marker: *ns.String, range: ns.Range) void {
                objc.msgSend(void, self, sel_addDebugMarker_range_, .{ marker, range });
            }

            pub fn removeAllDebugMarkers(self: *T) void {
                objc.msgSend(void, self, sel_removeAllDebugMarkers, .{});
            }

            pub fn remoteStorageBuffer(self: *T) ?*Buffer {
                return objc.msgSend(*Buffer, self, sel_remoteStorageBuffer, .{});
            }

            pub fn newRemoteBufferViewForDevice(self: *T, device: *Device) ?*Buffer {
                return objc.msgSend(*Buffer, self, sel_newRemoteBufferViewForDevice_, .{device});
            }
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

            pub fn renderCommandEncoderWithDescriptor(self: *T, render_pass_descriptor: *RenderPassDescriptor) ?*RenderCommandEncoder {
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

pub const CompileOptions = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn alloc() *CompileOptions {
        return objc.sendMessage(*CompileOptions, class_MTLCompileOptions, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.sendMessage(*T, self, sel_init, .{});
            }

            pub fn preprocessorMacros(self: *T) ?*ns.Dictionary {
                return objc.sendMessage(*ns.Dictionary, self, sel_preprocessorMacros, .{});
            }

            pub fn setPreprocessorMacros(self: *T, preprocessor_macros: *ns.Dictionary) void {
                objc.sendMessage(void, self, sel_setPreprocessorMacros_, .{preprocessor_macros});
            }

            pub fn fastMathEnabled(self: *T) bool {
                return objc.sendMessage(bool, self, sel_fastMathEnabled, .{});
            }

            pub fn setFastMathEnabled(self: *T, fast_math_enabled: bool) void {
                objc.sendMessage(void, self, sel_setFastMathEnabled_, .{fast_math_enabled});
            }

            pub fn languageVersion(self: *T) LanguageVersion {
                return objc.sendMessage(LanguageVersion, self, sel_languageVersion, .{});
            }

            pub fn setLanguageVersion(self: *T, language_version: LanguageVersion) void {
                objc.sendMessage(void, self, sel_setLanguageVersion_, .{language_version});
            }

            pub fn libraryType(self: *T) LibraryType {
                return objc.sendMessage(LibraryType, self, sel_libraryType, .{});
            }

            pub fn setLibraryType(self: *T, library_type: LibraryType) void {
                objc.sendMessage(void, self, sel_setLibraryType_, .{library_type});
            }

            pub fn installName(self: *T) ?*ns.String {
                return objc.sendMessage(*ns.String, self, sel_installName, .{});
            }

            pub fn setInstallName(self: *T, install_name: *ns.String) void {
                objc.sendMessage(void, self, sel_setInstallName_, .{install_name});
            }

            pub fn libraries(self: *T) ?*ns.Array {
                return objc.sendMessage(*ns.Array, self, sel_libraries, .{});
            }

            pub fn setLibraries(self: *T, libraries_: *ns.Array) void {
                objc.sendMessage(void, self, sel_setLibraries_, .{libraries_});
            }

            pub fn preserveInvariance(self: *T) bool {
                return objc.sendMessage(bool, self, sel_preserveInvariance, .{});
            }

            pub fn setPreserveInvariance(self: *T, preserve_invariance: bool) void {
                objc.sendMessage(void, self, sel_setPreserveInvariance_, .{preserve_invariance});
            }
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

            // TODO
        };
    }
};

pub const CounterSampleBuffer = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const DepthStencilState = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
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

            pub fn newBufferWithLength_options(self: *T, length: ns.UInteger, options: ResourceOptions) ?*Buffer {
                return objc.msgSend(*Buffer, self, sel_newBufferWithLength_options_, .{ length, options });
            }

            pub fn newBufferWithBytes_length_options(self: *T, pointer: *const anyopaque, length: ns.UInteger, options: ResourceOptions) ?*Buffer {
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

            pub fn newLibraryWithSource_options_error(self: *T, source: *ns.String, options: ?*CompileOptions, err: *?*ns.Error) ?*Library {
                return objc.msgSend(*Library, self, sel_newLibraryWithSource_options_error_, .{ source, options, err });
            }

            // newLibraryWithSource
            // newLibraryWithStitchedDescriptor

            pub fn newRenderPipelineStateWithDescriptor_error_(self: *T, descriptor: *RenderPipelineDescriptor, err: *?*ns.Error) ?*RenderPipelineState {
                return objc.msgSend(*RenderPipelineState, self, sel_newRenderPipelineStateWithDescriptor_error_, .{ descriptor, err });
            }

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

            // TODO
        };
    }
};

pub const Fence = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
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

pub const FunctionHandle = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const Heap = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const IndirectCommandBuffer = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const IntersectionFunctionTable = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const IntersectionFunctionTableDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
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

pub const LinkedFunctions = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const PipelineBufferDescriptorArray = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
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

            // TODO
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

            pub fn setRenderPipelineState(self: *T, pipelineState: *RenderPipelineState) void {
                objc.msgSend(void, self, sel_setRenderPipelineState_, .{pipelineState});
            }

            pub fn setVertexBytes_length_atIndex(self: *T, bytes: *const anyopaque, length: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexBytes_length_atIndex_, .{ bytes, length, index });
            }

            pub fn setVertexBuffer_offset_atIndex(self: *T, buffer: *Buffer, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexBuffer_offset_atIndex_, .{ buffer, offset, index });
            }

            pub fn setVertexBufferOffset_atIndex(self: *T, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexBufferOffset_atIndex_, .{ offset, index });
            }

            pub fn setVertexBuffers_offsets_withRange(self: *T, buffers: []*Buffer, offsets: []ns.UInteger, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexBuffers_offsets_withRange_, .{ buffers, offsets, range });
            }

            pub fn setVertexTexture_atIndex(self: *T, texture: *Texture, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexTexture_atIndex_, .{ texture, index });
            }

            pub fn setVertexTextures_withRange(self: *T, textures: []*Texture, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexTextures_withRange_, .{ textures, range });
            }

            pub fn setVertexSamplerState_atIndex(self: *T, sampler: *SamplerState, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexSamplerState_atIndex_, .{ sampler, index });
            }

            pub fn setVertexSamplerStates_withRange(self: *T, samplers: []*SamplerState, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexSamplerStates_withRange_, .{ samplers, range });
            }

            pub fn setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex(self: *T, sampler: *SamplerState, lodMinClamp: f32, lodMaxClamp: f32, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, .{ sampler, lodMinClamp, lodMaxClamp, index });
            }

            pub fn setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange(self: *T, samplers: []*SamplerState, lodMinClamps: []f32, lodMaxClamps: []f32, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, .{ samplers, lodMinClamps, lodMaxClamps, range });
            }

            pub fn setVertexVisibleFunctionTable_atBufferIndex(self: *T, functionTable: *VisibleFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexVisibleFunctionTable_atBufferIndex_, .{ functionTable, bufferIndex });
            }

            pub fn setVertexVisibleFunctionTables_withBufferRange(self: *T, functionTables: []*VisibleFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexVisibleFunctionTables_withBufferRange_, .{ functionTables, range });
            }

            pub fn setVertexIntersectionFunctionTable_atBufferIndex(self: *T, intersectionFunctionTable: *IntersectionFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexIntersectionFunctionTable_atBufferIndex_, .{ intersectionFunctionTable, bufferIndex });
            }

            pub fn setVertexIntersectionFunctionTables_withBufferRange(self: *T, intersectionFunctionTables: []*IntersectionFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setVertexIntersectionFunctionTables_withBufferRange_, .{ intersectionFunctionTables, range });
            }

            pub fn setVertexAccelerationStructure_atBufferIndex(self: *T, accelerationStructure: *AccelerationStructure, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVertexAccelerationStructure_atBufferIndex_, .{ accelerationStructure, bufferIndex });
            }

            pub fn setViewport(self: *T, viewport: Viewport) void {
                objc.msgSend(void, self, sel_setViewport_, .{viewport});
            }

            pub fn setViewports_count(self: *T, viewports: []*Viewport, count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setViewports_count_, .{ viewports, count });
            }

            pub fn setFrontFacingWinding(self: *T, frontFacingWinding: Winding) void {
                objc.msgSend(void, self, sel_setFrontFacingWinding_, .{frontFacingWinding});
            }

            pub fn setVertexAmplificationCount_viewMappings(self: *T, count: ns.UInteger, viewMappings: []VertexAmplificationViewMapping) void {
                objc.msgSend(void, self, sel_setVertexAmplificationCount_viewMappings_, .{ count, viewMappings });
            }

            pub fn setCullMode(self: *T, cullMode: CullMode) void {
                objc.msgSend(void, self, sel_setCullMode_, .{cullMode});
            }

            pub fn setDepthClipMode(self: *T, depthClipMode: DepthClipMode) void {
                objc.msgSend(void, self, sel_setDepthClipMode_, .{depthClipMode});
            }

            pub fn setDepthBias_slopeScale_clamp(self: *T, depthBias: f32, slopeScale: f32, clamp: f32) void {
                objc.msgSend(void, self, sel_setDepthBias_slopeScale_clamp_, .{ depthBias, slopeScale, clamp });
            }

            pub fn setScissorRect(self: *T, rect: ScissorRect) void {
                objc.msgSend(void, self, sel_setScissorRect_, .{rect});
            }

            pub fn setScissorRects_count(self: *T, scissorRects: []ScissorRect, count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setScissorRects_count_, .{ scissorRects, count });
            }

            pub fn setTriangleFillMode(self: *T, fillMode: TriangleFillMode) void {
                objc.msgSend(void, self, sel_setTriangleFillMode_, .{fillMode});
            }

            pub fn setFragmentBytes_length_atIndex(self: *T, bytes: *const anyopaque, length: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentBytes_length_atIndex_, .{ bytes, length, index });
            }

            pub fn setFragmentBuffer_offset_atIndex(self: *T, buffer: *Buffer, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentBuffer_offset_atIndex_, .{ buffer, offset, index });
            }

            pub fn setFragmentBufferOffset_atIndex(self: *T, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentBufferOffset_atIndex_, .{ offset, index });
            }

            pub fn setFragmentBuffers_offsets_withRange(self: *T, buffers: []*Buffer, offsets: []ns.UInteger, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentBuffers_offsets_withRange_, .{ buffers, offsets, range });
            }

            pub fn setFragmentTexture_atIndex(self: *T, texture: *Texture, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentTexture_atIndex_, .{ texture, index });
            }

            pub fn setFragmentTextures_withRange(self: *T, textures: []*Texture, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentTextures_withRange_, .{ textures, range });
            }

            pub fn setFragmentSamplerState_atIndex(self: *T, sampler: *SamplerState, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentSamplerState_atIndex_, .{ sampler, index });
            }

            pub fn setFragmentSamplerStates_withRange(self: *T, samplers: []*SamplerState, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentSamplerStates_withRange_, .{ samplers, range });
            }

            pub fn setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex(self: *T, sampler: *SamplerState, lodMinClamp: f32, lodMaxClamp: f32, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, .{ sampler, lodMinClamp, lodMaxClamp, index });
            }

            pub fn setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange(self: *T, samplers: []*SamplerState, lodMinClamps: []f32, lodMaxClamps: []f32, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, .{ samplers, lodMinClamps, lodMaxClamps, range });
            }

            pub fn setFragmentVisibleFunctionTable_atBufferIndex(self: *T, functionTable: *VisibleFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentVisibleFunctionTable_atBufferIndex_, .{ functionTable, bufferIndex });
            }

            pub fn setFragmentVisibleFunctionTables_withBufferRange(self: *T, functionTables: []*VisibleFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentVisibleFunctionTables_withBufferRange_, .{ functionTables, range });
            }

            pub fn setFragmentIntersectionFunctionTable_atBufferIndex(self: *T, intersectionFunctionTable: *IntersectionFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentIntersectionFunctionTable_atBufferIndex_, .{ intersectionFunctionTable, bufferIndex });
            }

            pub fn setFragmentIntersectionFunctionTables_withBufferRange(self: *T, intersectionFunctionTables: []*IntersectionFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setFragmentIntersectionFunctionTables_withBufferRange_, .{ intersectionFunctionTables, range });
            }

            pub fn setFragmentAccelerationStructure_atBufferIndex(self: *T, accelerationStructure: *AccelerationStructure, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setFragmentAccelerationStructure_atBufferIndex_, .{ accelerationStructure, bufferIndex });
            }

            pub fn setBlendColorRed_green_blue_alpha(self: *T, red: f32, green: f32, blue: f32, alpha: f32) void {
                objc.msgSend(void, self, sel_setBlendColorRed_green_blue_alpha_, .{ red, green, blue, alpha });
            }

            pub fn setDepthStencilState(self: *T, depthStencilState: *DepthStencilState) void {
                objc.msgSend(void, self, sel_setDepthStencilState_, .{depthStencilState});
            }

            pub fn setStencilReferenceValue(self: *T, referenceValue: u32) void {
                objc.msgSend(void, self, sel_setStencilReferenceValue_, .{referenceValue});
            }

            pub fn setStencilFrontReferenceValue_backReferenceValue(self: *T, frontReferenceValue: u32, backReferenceValue: u32) void {
                objc.msgSend(void, self, sel_setStencilFrontReferenceValue_backReferenceValue_, .{ frontReferenceValue, backReferenceValue });
            }

            pub fn setVisibilityResultMode_offset(self: *T, mode: VisibilityResultMode, offset: ns.UInteger) void {
                objc.msgSend(void, self, sel_setVisibilityResultMode_offset_, .{ mode, offset });
            }

            pub fn setColorStoreAction_atIndex(self: *T, storeAction: StoreAction, colorAttachmentIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setColorStoreAction_atIndex_, .{ storeAction, colorAttachmentIndex });
            }

            pub fn setDepthStoreAction(self: *T, storeAction: StoreAction) void {
                objc.msgSend(void, self, sel_setDepthStoreAction_, .{storeAction});
            }

            pub fn setStencilStoreAction(self: *T, storeAction: StoreAction) void {
                objc.msgSend(void, self, sel_setStencilStoreAction_, .{storeAction});
            }

            pub fn setColorStoreActionOptions_atIndex(self: *T, storeActionOptions: StoreActionOptions, colorAttachmentIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setColorStoreActionOptions_atIndex_, .{ storeActionOptions, colorAttachmentIndex });
            }

            pub fn setDepthStoreActionOptions(self: *T, storeActionOptions: StoreActionOptions) void {
                objc.msgSend(void, self, sel_setDepthStoreActionOptions_, .{storeActionOptions});
            }

            pub fn setStencilStoreActionOptions(self: *T, storeActionOptions: StoreActionOptions) void {
                objc.msgSend(void, self, sel_setStencilStoreActionOptions_, .{storeActionOptions});
            }

            pub fn drawPrimitives_vertexStart_vertexCount_instanceCount(self: *T, primitiveType: PrimitiveType, vertexStart: ns.UInteger, vertexCount: ns.UInteger, instanceCount: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_, .{ primitiveType, vertexStart, vertexCount, instanceCount });
            }

            pub fn drawPrimitives_vertexStart_vertexCount(self: *T, primitiveType: PrimitiveType, vertexStart: ns.UInteger, vertexCount: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPrimitives_vertexStart_vertexCount_, .{ primitiveType, vertexStart, vertexCount });
            }

            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount(self: *T, primitiveType: PrimitiveType, indexCount: ns.UInteger, indexType: IndexType, indexBuffer: *Buffer, indexBufferOffset: ns.UInteger, instanceCount: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, .{ primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount });
            }

            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset(self: *T, primitiveType: PrimitiveType, indexCount: ns.UInteger, indexType: IndexType, indexBuffer: *Buffer, indexBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, .{ primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset });
            }

            pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance(self: *T, primitiveType: PrimitiveType, vertexStart: ns.UInteger, vertexCount: ns.UInteger, instanceCount: ns.UInteger, baseInstance: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, .{ primitiveType, vertexStart, vertexCount, instanceCount, baseInstance });
            }

            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance(self: *T, primitiveType: PrimitiveType, indexCount: ns.UInteger, indexType: IndexType, indexBuffer: *Buffer, indexBufferOffset: ns.UInteger, instanceCount: ns.UInteger, baseVertex: ns.Integer, baseInstance: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, .{ primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance });
            }

            pub fn drawPrimitives_indirectBuffer_indirectBufferOffset(self: *T, primitiveType: PrimitiveType, indirectBuffer: *Buffer, indirectBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPrimitives_indirectBuffer_indirectBufferOffset_, .{ primitiveType, indirectBuffer, indirectBufferOffset });
            }

            pub fn drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset(self: *T, primitiveType: PrimitiveType, indexType: IndexType, indexBuffer: *Buffer, indexBufferOffset: ns.UInteger, indirectBuffer: *Buffer, indirectBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, .{ primitiveType, indexType, indexBuffer, indexBufferOffset, indirectBuffer, indirectBufferOffset });
            }

            pub fn textureBarrier(self: *T) void {
                objc.msgSend(void, self, sel_textureBarrier, .{});
            }

            pub fn updateFence_afterStages(self: *T, fence: *Fence, stages: RenderStages) void {
                objc.msgSend(void, self, sel_updateFence_afterStages_, .{ fence, stages });
            }

            pub fn waitForFence_beforeStages(self: *T, fence: *Fence, stages: RenderStages) void {
                objc.msgSend(void, self, sel_waitForFence_beforeStages_, .{ fence, stages });
            }

            pub fn setTessellationFactorBuffer_offset_instanceStride(self: *T, buffer: *Buffer, offset: ns.UInteger, instanceStride: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTessellationFactorBuffer_offset_instanceStride_, .{ buffer, offset, instanceStride });
            }

            pub fn setTessellationFactorScale(self: *T, scale: f32) void {
                objc.msgSend(void, self, sel_setTessellationFactorScale_, .{scale});
            }

            pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance(self: *T, numberOfPatchControlPoints: ns.UInteger, patchStart: ns.UInteger, patchCount: ns.UInteger, patchIndexBuffer: *Buffer, patchIndexBufferOffset: ns.UInteger, instanceCount: ns.UInteger, baseInstance: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_, .{ numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, instanceCount, baseInstance });
            }

            pub fn drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset(self: *T, numberOfPatchControlPoints: ns.UInteger, patchIndexBuffer: *Buffer, patchIndexBufferOffset: ns.UInteger, indirectBuffer: *Buffer, indirectBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_, .{ numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, indirectBuffer, indirectBufferOffset });
            }

            pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance(self: *T, numberOfPatchControlPoints: ns.UInteger, patchStart: ns.UInteger, patchCount: ns.UInteger, patchIndexBuffer: *Buffer, patchIndexBufferOffset: ns.UInteger, controlPointIndexBuffer: *Buffer, controlPointIndexBufferOffset: ns.UInteger, instanceCount: ns.UInteger, baseInstance: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_, .{ numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, instanceCount, baseInstance });
            }

            pub fn drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset(self: *T, numberOfPatchControlPoints: ns.UInteger, patchIndexBuffer: *Buffer, patchIndexBufferOffset: ns.UInteger, controlPointIndexBuffer: *Buffer, controlPointIndexBufferOffset: ns.UInteger, indirectBuffer: *Buffer, indirectBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_, .{ numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, indirectBuffer, indirectBufferOffset });
            }

            pub fn tileWidth(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_tileWidth, .{});
            }

            pub fn tileHeight(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_tileHeight, .{});
            }

            pub fn setTileBytes_length_atIndex(self: *T, bytes: *const anyopaque, length: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileBytes_length_atIndex_, .{ bytes, length, index });
            }

            pub fn setTileBuffer_offset_atIndex(self: *T, buffer: *Buffer, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileBuffer_offset_atIndex_, .{ buffer, offset, index });
            }

            pub fn setTileBufferOffset_atIndex(self: *T, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileBufferOffset_atIndex_, .{ offset, index });
            }

            pub fn setTileBuffers_offsets_withRange(self: *T, buffers: []*Buffer, offsets: []ns.UInteger, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileBuffers_offsets_withRange_, .{ buffers, offsets, range });
            }

            pub fn setTileTexture_atIndex(self: *T, texture: *Texture, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileTexture_atIndex_, .{ texture, index });
            }

            pub fn setTileTextures_withRange(self: *T, textures: []*Texture, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileTextures_withRange_, .{ textures, range });
            }

            pub fn setTileSamplerState_atIndex(self: *T, sampler: *SamplerState, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileSamplerState_atIndex_, .{ sampler, index });
            }

            pub fn setTileSamplerStates_withRange(self: *T, samplers: []*SamplerState, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileSamplerStates_withRange_, .{ samplers, range });
            }

            pub fn setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex(self: *T, sampler: *SamplerState, lodMinClamp: f32, lodMaxClamp: f32, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, .{ sampler, lodMinClamp, lodMaxClamp, index });
            }

            pub fn setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange(self: *T, samplers: []*SamplerState, lodMinClamps: []f32, lodMaxClamps: []f32, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, .{ samplers, lodMinClamps, lodMaxClamps, range });
            }

            pub fn setTileVisibleFunctionTable_atBufferIndex(self: *T, functionTable: *VisibleFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileVisibleFunctionTable_atBufferIndex_, .{ functionTable, bufferIndex });
            }

            pub fn setTileVisibleFunctionTables_withBufferRange(self: *T, functionTables: []*VisibleFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileVisibleFunctionTables_withBufferRange_, .{ functionTables, range });
            }

            pub fn setTileIntersectionFunctionTable_atBufferIndex(self: *T, intersectionFunctionTable: *IntersectionFunctionTable, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileIntersectionFunctionTable_atBufferIndex_, .{ intersectionFunctionTable, bufferIndex });
            }

            pub fn setTileIntersectionFunctionTables_withBufferRange(self: *T, intersectionFunctionTables: []*IntersectionFunctionTable, range: ns.Range) void {
                objc.msgSend(void, self, sel_setTileIntersectionFunctionTables_withBufferRange_, .{ intersectionFunctionTables, range });
            }

            pub fn setTileAccelerationStructure_atBufferIndex(self: *T, accelerationStructure: *AccelerationStructure, bufferIndex: ns.UInteger) void {
                objc.msgSend(void, self, sel_setTileAccelerationStructure_atBufferIndex_, .{ accelerationStructure, bufferIndex });
            }

            pub fn dispatchThreadsPerTile(self: *T, threadsPerTile: Size) void {
                objc.msgSend(void, self, sel_dispatchThreadsPerTile_, .{threadsPerTile});
            }

            pub fn setThreadgroupMemoryLength_offset_atIndex(self: *T, length: ns.UInteger, offset: ns.UInteger, index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setThreadgroupMemoryLength_offset_atIndex_, .{ length, offset, index });
            }

            pub fn useResource_usage(self: *T, resource: *Resource, usage: ResourceUsage) void {
                objc.msgSend(void, self, sel_useResource_usage_, .{ resource, usage });
            }

            pub fn useResources_count_usage(self: *T, resources: []*Resource, count: ns.UInteger, usage: ResourceUsage) void {
                objc.msgSend(void, self, sel_useResources_count_usage_, .{ resources, count, usage });
            }

            pub fn useResource_usage_stages(self: *T, resource: *Resource, usage: ResourceUsage, stages: RenderStages) void {
                objc.msgSend(void, self, sel_useResource_usage_stages_, .{ resource, usage, stages });
            }

            pub fn useResources_count_usage_stages(self: *T, resources: *Resource, count: ns.UInteger, usage: ResourceUsage, stages: RenderStages) void {
                objc.msgSend(void, self, sel_useResources_count_usage_stages_, .{ resources, count, usage, stages });
            }

            pub fn useHeap(self: *T, heap: *Heap) void {
                objc.msgSend(void, self, sel_useHeap_, .{heap});
            }

            pub fn useHeaps_count(self: *T, heaps: []*Heap, count: ns.UInteger) void {
                objc.msgSend(void, self, sel_useHeaps_count_, .{ heaps, count });
            }

            pub fn useHeap_stages(self: *T, heap: *Heap, stages: RenderStages) void {
                objc.msgSend(void, self, sel_useHeap_stages_, .{ heap, stages });
            }

            pub fn useHeaps_count_stages(self: *T, heaps: []*Heap, count: ns.UInteger, stages: RenderStages) void {
                objc.msgSend(void, self, sel_useHeaps_count_stages_, .{ heaps, count, stages });
            }

            pub fn executeCommandsInBuffer_withRange(self: *T, indirectCommandBuffer: *IndirectCommandBuffer, executionRange: ns.Range) void {
                objc.msgSend(void, self, sel_executeCommandsInBuffer_withRange_, .{ indirectCommandBuffer, executionRange });
            }

            pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset(self: *T, indirectCommandbuffer: *IndirectCommandBuffer, indirectRangeBuffer: *Buffer, indirectBufferOffset: ns.UInteger) void {
                objc.msgSend(void, self, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, .{ indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset });
            }

            pub fn memoryBarrierWithScope_afterStages_beforeStages(self: *T, scope: BarrierScope, after: RenderStages, before: RenderStages) void {
                objc.msgSend(void, self, sel_memoryBarrierWithScope_afterStages_beforeStages_, .{ scope, after, before });
            }

            pub fn memoryBarrierWithResources_count_afterStages_beforeStages(self: *T, resources: []*Resource, count: ns.UInteger, after: RenderStages, before: RenderStages) void {
                objc.msgSend(void, self, sel_memoryBarrierWithResources_count_afterStages_beforeStages_, .{ resources, count, after, before });
            }

            pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self: *T, sampleBuffer: *CounterSampleBuffer, sampleIndex: ns.UInteger, barrier: bool) void {
                objc.msgSend(void, self, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, .{ sampleBuffer, sampleIndex, barrier });
            }
        };
    }
};

pub const RenderPipelineColorAttachmentDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn alloc() *RenderPipelineColorAttachmentDescriptor {
        return objc.msgSend(*RenderPipelineColorAttachmentDescriptor, class_MTLRenderPipelineColorAttachmentDescriptor, sel_alloc, {});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn pixelFormat(self: *T) PixelFormat {
                return objc.msgSend(PixelFormat, self, sel_pixelFormat, .{});
            }

            pub fn setPixelFormat(self: *T, pixel_format: PixelFormat) void {
                objc.msgSend(void, self, sel_setPixelFormat_, .{pixel_format});
            }

            pub fn blendingEnabled(self: *T) bool {
                return objc.msgSend(bool, self, sel_isBlendingEnabled, .{});
            }

            pub fn setBlendingEnabled(self: *T, blending_enabled: bool) void {
                objc.msgSend(void, self, sel_setBlendingEnabled_, .{blending_enabled});
            }

            pub fn sourceRGBBlendFactor(self: *T) BlendFactor {
                return objc.msgSend(BlendFactor, self, sel_sourceRGBBlendFactor, .{});
            }

            pub fn setSourceRGBBlendFactor(self: *T, source_rgb_blend_factor: BlendFactor) void {
                objc.msgSend(void, self, sel_setSourceRGBBlendFactor_, .{source_rgb_blend_factor});
            }

            pub fn destinationRGBBlendFactor(self: *T) BlendFactor {
                return objc.msgSend(BlendFactor, self, sel_destinationRGBBlendFactor, .{});
            }

            pub fn setDestinationRGBBlendFactor(self: *T, destination_rgb_blend_factor: BlendFactor) void {
                objc.msgSend(void, self, sel_setDestinationRGBBlendFactor_, .{destination_rgb_blend_factor});
            }

            pub fn rgbBlendOperation(self: *T) BlendOperation {
                return objc.msgSend(BlendOperation, self, sel_rgbBlendOperation, .{});
            }

            pub fn setRgbBlendOperation(self: *T, rgb_blend_operation: BlendOperation) void {
                objc.msgSend(void, self, sel_setRgbBlendOperation_, .{rgb_blend_operation});
            }

            pub fn sourceAlphaBlendFactor(self: *T) BlendFactor {
                return objc.msgSend(BlendFactor, self, sel_sourceAlphaBlendFactor, .{});
            }

            pub fn setSourceAlphaBlendFactor(self: *T, source_alpha_blend_factor: BlendFactor) void {
                objc.msgSend(void, self, sel_setSourceAlphaBlendFactor_, .{source_alpha_blend_factor});
            }

            pub fn destinationAlphaBlendFactor(self: *T) BlendFactor {
                return objc.msgSend(BlendFactor, self, sel_destinationAlphaBlendFactor, .{});
            }

            pub fn setDestinationAlphaBlendFactor(self: *T, destination_alpha_blend_factor: BlendFactor) void {
                objc.msgSend(void, self, sel_setDestinationAlphaBlendFactor_, .{destination_alpha_blend_factor});
            }

            pub fn alphaBlendOperation(self: *T) BlendOperation {
                return objc.msgSend(BlendOperation, self, sel_alphaBlendOperation, .{});
            }

            pub fn setAlphaBlendOperation(self: *T, alpha_blend_operation: BlendOperation) void {
                objc.msgSend(void, self, sel_setAlphaBlendOperation_, .{alpha_blend_operation});
            }
            pub fn writeMask(self: *T) ColorWriteMask {
                return objc.msgSend(ColorWriteMask, self, sel_writeMask, .{});
            }

            pub fn setWriteMask(self: *T, write_mask: ColorWriteMask) void {
                objc.msgSend(void, self, sel_setWriteMask_, .{write_mask});
            }
        };
    }
};

pub const RenderPipelineColorAttachmentDescriptorArray = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn alloc() *RenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(*RenderPipelineColorAttachmentDescriptorArray, class_MTLRenderPipelineColorAttachmentDescriptorArray, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn objectAtIndexedSubscript(self: *T, attachment_index: ns.UInteger) *RenderPipelineColorAttachmentDescriptor {
                return objc.msgSend(*RenderPipelineColorAttachmentDescriptor, self, sel_objectAtIndexedSubscript_, .{attachment_index});
            }

            pub fn setObject_atIndexedSubscript(self: *T, attachment: ?*RenderPipelineColorAttachmentDescriptor, attachment_index: ns.UInteger) void {
                objc.msgSend(void, self, sel_setObject_atIndexedSubscript_, .{ attachment, attachment_index });
            }
        };
    }
};

pub const RenderPipelineDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn alloc() *RenderPipelineDescriptor {
        return objc.msgSend(*RenderPipelineDescriptor, class_MTLRenderPipelineDescriptor, sel_alloc, .{});
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn init(self: *T) *T {
                return objc.msgSend(*T, self, sel_init, .{});
            }

            pub fn label(self: *T) ?*ns.String {
                return objc.msgSend(*ns.String, self, sel_label, .{});
            }

            pub fn setLabel(self: *T, label_: ?*ns.String) void {
                objc.msgSend(void, self, sel_setLabel_, .{label_});
            }

            pub fn vertexFunction(self: *T) ?*Function {
                return objc.msgSend(*Function, self, sel_vertexFunction, .{});
            }

            pub fn setVertexFunction(self: *T, vertex_function: ?*Function) void {
                objc.msgSend(void, self, sel_setVertexFunction_, .{vertex_function});
            }

            pub fn fragmentFunction(self: *T) ?*Function {
                return objc.msgSend(*Function, self, sel_fragmentFunction, .{});
            }

            pub fn setFragmentFunction(self: *T, fragment_function: ?*Function) void {
                objc.msgSend(void, self, sel_setFragmentFunction_, .{fragment_function});
            }

            pub fn vertexDescriptor(self: *T) ?*VertexDescriptor {
                return objc.msgSend(*VertexDescriptor, self, sel_vertexDescriptor, .{});
            }

            pub fn setVertexDescriptor(self: *T, vertex_descriptor: ?*VertexDescriptor) void {
                objc.msgSend(void, self, sel_setVertexDescriptor_, .{vertex_descriptor});
            }

            pub fn sampleCount(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_sampleCount, .{});
            }

            pub fn setSampleCount(self: *T, sample_count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setSampleCount_, .{sample_count});
            }

            pub fn rasterSampleCount(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_rasterSampleCount, .{});
            }

            pub fn setRasterSampleCount(self: *T, raster_sample_count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setRasterSampleCount_, .{raster_sample_count});
            }

            pub fn alphaToCoverageEnabled(self: *T) bool {
                return objc.msgSend(bool, self, sel_isAlphaToCoverageEnabled, .{});
            }

            pub fn setAlphaToCoverageEnabled(self: *T, alpha_to_coverage_enabled: bool) void {
                objc.msgSend(void, self, sel_setAlphaToCoverageEnabled_, .{alpha_to_coverage_enabled});
            }

            pub fn alphaToOneEnabled(self: *T) bool {
                return objc.msgSend(bool, self, sel_isAlphaToOneEnabled, .{});
            }

            pub fn setAlphaToOneEnabled(self: *T, alpha_to_one_enabled: bool) void {
                objc.msgSend(void, self, sel_setAlphaToOneEnabled_, .{alpha_to_one_enabled});
            }

            pub fn rasterizationEnabled(self: *T) bool {
                return objc.msgSend(bool, self, sel_isRasterizationEnabled, .{});
            }

            pub fn setRasterizationEnabled(self: *T, rasterization_enabled: bool) void {
                objc.msgSend(void, self, sel_setRasterizationEnabled_, .{rasterization_enabled});
            }

            pub fn maxVertexAmplificationCount(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_maxVertexAmplificationCount, .{});
            }

            pub fn setMaxVertexAmplificationCount(self: *T, max_vertex_amplification_count: ns.UInteger) void {
                objc.msgSend(void, self, sel_setMaxVertexAmplificationCount_, .{max_vertex_amplification_count});
            }

            pub fn colorAttachments(self: *T) *RenderPipelineColorAttachmentDescriptorArray {
                return objc.msgSend(*RenderPipelineColorAttachmentDescriptorArray, self, sel_colorAttachments, .{});
            }

            pub fn depthAttachmentPixelFormat(self: *T) PixelFormat {
                return objc.msgSend(PixelFormat, self, sel_depthAttachmentPixelFormat, .{});
            }

            pub fn setDepthAttachmentPixelFormat(self: *T, depth_attachment_pixel_format: PixelFormat) void {
                objc.msgSend(void, self, sel_setDepthAttachmentPixelFormat_, .{depth_attachment_pixel_format});
            }

            pub fn stencilAttachmentPixelFormat(self: *T) PixelFormat {
                return objc.msgSend(PixelFormat, self, sel_stencilAttachmentPixelFormat, .{});
            }

            pub fn setStencilAttachmentPixelFormat(self: *T, stencil_attachment_pixel_format: PixelFormat) void {
                objc.msgSend(void, self, sel_setStencilAttachmentPixelFormat_, .{stencil_attachment_pixel_format});
            }

            pub fn inputPrimitiveTopology(self: *T) PrimitiveTopologyClass {
                return objc.msgSend(PrimitiveTopologyClass, self, sel_inputPrimitiveTopology, .{});
            }

            pub fn setInputPrimitiveTopology(self: *T, input_primitive_topology: PrimitiveTopologyClass) void {
                objc.msgSend(void, self, sel_setInputPrimitiveTopology_, .{input_primitive_topology});
            }

            pub fn tessellationPartitionMode(self: *T) TessellationPartitionMode {
                return objc.msgSend(TessellationPartitionMode, self, sel_tessellationPartitionMode, .{});
            }

            pub fn setTessellationPartitionMode(self: *T, tessellation_partition_mode: TessellationPartitionMode) void {
                objc.msgSend(void, self, sel_setTessellationPartitionMode_, .{tessellation_partition_mode});
            }

            pub fn maxTessellationFactor(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_maxTessellationFactor, .{});
            }

            pub fn setMaxTessellationFactor(self: *T, max_tessellation_factor: ns.UInteger) void {
                objc.msgSend(void, self, sel_setMaxTessellationFactor_, .{max_tessellation_factor});
            }

            pub fn tessellationFactorScaleEnabled(self: *T) bool {
                return objc.msgSend(bool, self, sel_isTessellationFactorScaleEnabled, .{});
            }

            pub fn setTessellationFactorScaleEnabled(self: *T, tessellation_factor_scale_enabled: bool) void {
                objc.msgSend(void, self, sel_setTessellationFactorScaleEnabled_, .{tessellation_factor_scale_enabled});
            }

            pub fn tessellationFactorFormat(self: *T) TessellationFactorFormat {
                return objc.msgSend(TessellationFactorFormat, self, sel_tessellationFactorFormat, .{});
            }

            pub fn setTessellationFactorFormat(self: *T, tessellation_factor_format: TessellationFactorFormat) void {
                objc.msgSend(void, self, sel_setTessellationFactorFormat_, .{tessellation_factor_format});
            }

            pub fn tessellationControlPointIndexType(self: *T) TessellationControlPointIndexType {
                return objc.msgSend(TessellationControlPointIndexType, self, sel_tessellationControlPointIndexType, .{});
            }

            pub fn setTessellationControlPointIndexType(self: *T, tessellation_control_point_index_type: TessellationControlPointIndexType) void {
                objc.msgSend(void, self, sel_setTessellationControlPointIndexType_, .{tessellation_control_point_index_type});
            }

            pub fn tessellationFactorStepFunction(self: *T) TessellationFactorStepFunction {
                return objc.msgSend(TessellationFactorStepFunction, self, sel_tessellationFactorStepFunction, .{});
            }

            pub fn setTessellationFactorStepFunction(self: *T, tessellation_factor_step_function: TessellationFactorStepFunction) void {
                objc.msgSend(void, self, sel_setTessellationFactorStepFunction_, .{tessellation_factor_step_function});
            }

            pub fn tessellationOutputWindingOrder(self: *T) Winding {
                return objc.msgSend(Winding, self, sel_tessellationOutputWindingOrder, .{});
            }

            pub fn setTessellationOutputWindingOrder(self: *T, tessellation_output_winding_order: Winding) void {
                objc.msgSend(void, self, sel_setTessellationOutputWindingOrder_, .{tessellation_output_winding_order});
            }

            pub fn vertexBuffers(self: *T) *PipelineBufferDescriptorArray {
                return objc.msgSend(*PipelineBufferDescriptorArray, self, sel_vertexBuffers, .{});
            }

            pub fn fragmentBuffers(self: *T) *PipelineBufferDescriptorArray {
                return objc.msgSend(*PipelineBufferDescriptorArray, self, sel_fragmentBuffers, .{});
            }

            pub fn supportIndirectCommandBuffers(self: *T) bool {
                return objc.msgSend(bool, self, sel_supportIndirectCommandBuffers, .{});
            }

            pub fn setSupportIndirectCommandBuffers(self: *T, support_indirect_command_buffers: bool) void {
                objc.msgSend(void, self, sel_setSupportIndirectCommandBuffers_, .{support_indirect_command_buffers});
            }

            pub fn binaryArchives(self: *T) ?*ns.Array {
                return objc.msgSend(*ns.Array, self, sel_binaryArchives, .{});
            }

            pub fn setBinaryArchives(self: *T, binary_archives: ?*ns.Array) void {
                objc.msgSend(void, self, sel_setBinaryArchives_, .{binary_archives});
            }

            pub fn vertexPreloadedLibraries(self: *T) *ns.Array {
                return objc.msgSend(*ns.Array, self, sel_vertexPreloadedLibraries, .{});
            }

            pub fn setVertexPreloadedLibraries(self: *T, vertex_preloaded_libraries: *ns.Array) void {
                objc.msgSend(void, self, sel_setVertexPreloadedLibraries_, .{vertex_preloaded_libraries});
            }

            pub fn fragmentPreloadedLibraries(self: *T) *ns.Array {
                return objc.msgSend(*ns.Array, self, sel_fragmentPreloadedLibraries, .{});
            }

            pub fn setFragmentPreloadedLibraries(self: *T, fragment_preloaded_libraries: *ns.Array) void {
                objc.msgSend(void, self, sel_setFragmentPreloadedLibraries_, .{fragment_preloaded_libraries});
            }

            pub fn vertexLinkedFunctions(self: *T) *LinkedFunctions {
                return objc.msgSend(*LinkedFunctions, self, sel_vertexLinkedFunctions, .{});
            }

            pub fn setVertexLinkedFunctions(self: *T, vertex_linked_functions: *LinkedFunctions) void {
                objc.msgSend(void, self, sel_setVertexLinkedFunctions_, .{vertex_linked_functions});
            }

            pub fn fragmentLinkedFunctions(self: *T) *LinkedFunctions {
                return objc.msgSend(*LinkedFunctions, self, sel_fragmentLinkedFunctions, .{});
            }

            pub fn setFragmentLinkedFunctions(self: *T, fragment_linked_functions: *LinkedFunctions) void {
                objc.msgSend(void, self, sel_setFragmentLinkedFunctions_, .{fragment_linked_functions});
            }

            pub fn supportAddingVertexBinaryFunctions(self: *T) bool {
                return objc.msgSend(bool, self, sel_supportAddingVertexBinaryFunctions, .{});
            }

            pub fn setSupportAddingVertexBinaryFunctions(self: *T, support_adding_vertex_binary_functions: bool) void {
                objc.msgSend(void, self, sel_setSupportAddingVertexBinaryFunctions_, .{support_adding_vertex_binary_functions});
            }

            pub fn supportAddingFragmentBinaryFunctions(self: *T) bool {
                return objc.msgSend(bool, self, sel_supportAddingFragmentBinaryFunctions, .{});
            }

            pub fn setSupportAddingFragmentBinaryFunctions(self: *T, support_adding_fragment_binary_functions: bool) void {
                objc.msgSend(void, self, sel_setSupportAddingFragmentBinaryFunctions_, .{support_adding_fragment_binary_functions});
            }

            pub fn maxVertexCallStackDepth(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_maxVertexCallStackDepth, .{});
            }

            pub fn setMaxVertexCallStackDepth(self: *T, max_vertex_call_stack_depth: ns.UInteger) void {
                objc.msgSend(void, self, sel_setMaxVertexCallStackDepth_, .{max_vertex_call_stack_depth});
            }

            pub fn maxFragmentCallStackDepth(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_maxFragmentCallStackDepth, .{});
            }

            pub fn setMaxFragmentCallStackDepth(self: *T, max_fragment_call_stack_depth: ns.UInteger) void {
                objc.msgSend(void, self, sel_setMaxFragmentCallStackDepth_, .{max_fragment_call_stack_depth});
            }

            pub fn reset(self: *T) void {
                objc.msgSend(void, self, sel_reset, .{});
            }
        };
    }
};

pub const RenderPipelineFunctionsDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const RenderPipelineState = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            pub fn label(self: *T) ?*ns.String {
                return objc.msgSend(*ns.String, self, sel_label, .{});
            }

            pub fn device(self: *T) *Device {
                return objc.msgSend(*Device, self, sel_device, .{});
            }

            pub fn maxTotalThreadsPerThreadgroup(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_maxTotalThreadsPerThreadgroup, .{});
            }

            pub fn threadgroupSizeMatchesTileSize(self: *T) bool {
                return objc.msgSend(bool, self, sel_threadgroupSizeMatchesTileSize, .{});
            }

            pub fn imageblockSampleLength(self: *T) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_imageblockSampleLength, .{});
            }

            pub fn imageblockMemoryLengthForDimensions(self: *T, imageblock_dimensions: Size) ns.UInteger {
                return objc.msgSend(ns.UInteger, self, sel_imageblockMemoryLengthForDimensions_, .{imageblock_dimensions});
            }

            pub fn supportIndirectCommandBuffers(self: *T) bool {
                return objc.msgSend(bool, self, sel_supportIndirectCommandBuffers, .{});
            }

            pub fn functionHandleWithFunction_stage(self: *T, function: *Function, stage: RenderStages) ?*FunctionHandle {
                return objc.msgSend(*FunctionHandle, self, sel_functionHandleWithFunction_stage_, .{ function, stage });
            }

            pub fn newVisibleFunctionTableWithDescriptor_stage(self: *T, descriptor: *VisibleFunctionTableDescriptor, stage: RenderStages) ?*VisibleFunctionTable {
                return objc.msgSend(*VisibleFunctionTable, self, sel_newVisibleFunctionTableWithDescriptor_stage_, .{ descriptor, stage });
            }

            pub fn newIntersectionFunctionTableWithDescriptor_stage(self: *T, descriptor: *IntersectionFunctionTableDescriptor, stage: RenderStages) ?*IntersectionFunctionTable {
                return objc.msgSend(*IntersectionFunctionTable, self, sel_newIntersectionFunctionTableWithDescriptor_stage_, .{ descriptor, stage });
            }

            pub fn newRenderPipelineStateWithAdditionalBinaryFunctions_error(self: *T, additional_binary_functions: *RenderPipelineFunctionsDescriptor, error_: *?*ns.Error) ?*RenderPipelineState {
                return objc.msgSend(*RenderPipelineState, self, sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_, .{ additional_binary_functions, error_ });
            }
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

            // TODO
        };
    }
};

pub const SamplerState = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const Texture = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const TextureDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const VertexDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const VisibleFunctionTable = opaque {
    const Self = @This();
    pub const Super = Resource;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub const VisibleFunctionTableDescriptor = opaque {
    const Self = @This();
    pub const Super = ns.Object;
    usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Super.Methods(T);

            // TODO
        };
    }
};

pub fn createSystemDefaultDevice() ?*Device {
    return MTLCreateSystemDefaultDevice();
}
