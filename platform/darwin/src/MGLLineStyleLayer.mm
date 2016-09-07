// This file is generated. 
// Edit platform/darwin/scripts/generate-style-code.js, then run `make style-code-darwin`.

#import "MGLSource.h"
#import "NSPredicate+MGLAdditions.h"
#import "MGLStyleLayer_Private.h"
#import "MGLStyleAttributeValue.h"
#import "MGLLineStyleLayer.h"

#include <mbgl/style/layers/line_layer.hpp>

@interface MGLLineStyleLayer ()

@property (nonatomic) mbgl::style::LineLayer *layer;
@property (nonatomic, readwrite) NSString *layerIdentifier;
@property (nonatomic, readwrite) NSString *sourceIdentifier;
@property (nonatomic, readwrite) NSString *sourceLayerIdentifier;

@end

@implementation MGLLineStyleLayer

@synthesize mapView;


- (instancetype)initWithLayerIdentifier:(NSString *)layerIdentifier source:(MGLSource *)source
{
    if (self = [super init]) {
        _layerIdentifier = layerIdentifier;
        _sourceIdentifier = source.sourceIdentifier;
        _layer = new mbgl::style::LineLayer(layerIdentifier.UTF8String, source.sourceIdentifier.UTF8String);
    }
    return self;
}

- (instancetype)initWithLayerIdentifier:(NSString *)layerIdentifier source:(MGLSource *)source sourceLayer:(NSString *)sourceLayer
{
    if (self = [super init]) {
        _layerIdentifier = layerIdentifier;
        _sourceIdentifier = source.sourceIdentifier;
        _layer = new mbgl::style::LineLayer(layerIdentifier.UTF8String, source.sourceIdentifier.UTF8String);
        _layer->setSourceLayer(sourceLayer.UTF8String);
    }
    return self;
}

- (void)setPredicate:(NSPredicate *)predicate
{
    self.layer->setFilter(predicate.mgl_filter);
}

- (NSPredicate *)predicate
{
    return [NSPredicate mgl_predicateWithFilter:self.layer->getFilter()];
}

#pragma mark - Accessing the Layout Attributes

- (void)setLineCap:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineCap {
    MGLSetEnumProperty(lineCap, LineCap, LineCapType, MGLLineStyleLayerLineCap);
}

- (id <MGLStyleAttributeValue>)lineCap {
    MGLGetEnumProperty(LineCap, LineCapType, MGLLineStyleLayerLineCap);
}

- (void)setLineJoin:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineJoin {
    MGLSetEnumProperty(lineJoin, LineJoin, LineJoinType, MGLLineStyleLayerLineJoin);
}

- (id <MGLStyleAttributeValue>)lineJoin {
    MGLGetEnumProperty(LineJoin, LineJoinType, MGLLineStyleLayerLineJoin);
}

- (void)setLineMiterLimit:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineMiterLimit {
    self.layer->setLineMiterLimit(lineMiterLimit.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineMiterLimit {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineMiterLimit() ?: self.layer->getDefaultLineMiterLimit()];
}

- (void)setLineRoundLimit:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineRoundLimit {
    self.layer->setLineRoundLimit(lineRoundLimit.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineRoundLimit {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineRoundLimit() ?: self.layer->getDefaultLineRoundLimit()];
}

#pragma mark - Accessing the Paint Attributes

- (void)setLineOpacity:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineOpacity {
    self.layer->setLineOpacity(lineOpacity.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineOpacity {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineOpacity() ?: self.layer->getDefaultLineOpacity()];
}

- (void)setLineColor:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineColor {
    self.layer->setLineColor(lineColor.mbgl_colorPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineColor {
    return [MGLStyleAttribute mbgl_colorWithPropertyValueColor:self.layer->getLineColor() ?: self.layer->getDefaultLineColor()];
}

- (void)setLineTranslate:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineTranslate {
    self.layer->setLineTranslate(lineTranslate.mbgl_offsetPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineTranslate {
    return [MGLStyleAttribute mbgl_offsetWithPropertyValueOffset:self.layer->getLineTranslate() ?: self.layer->getDefaultLineTranslate()];
}

- (void)setLineTranslateAnchor:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineTranslateAnchor {
    MGLSetEnumProperty(lineTranslateAnchor, LineTranslateAnchor, TranslateAnchorType, MGLLineStyleLayerLineTranslateAnchor);
}

- (id <MGLStyleAttributeValue>)lineTranslateAnchor {
    MGLGetEnumProperty(LineTranslateAnchor, TranslateAnchorType, MGLLineStyleLayerLineTranslateAnchor);
}

- (void)setLineWidth:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineWidth {
    self.layer->setLineWidth(lineWidth.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineWidth {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineWidth() ?: self.layer->getDefaultLineWidth()];
}

- (void)setLineGapWidth:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineGapWidth {
    self.layer->setLineGapWidth(lineGapWidth.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineGapWidth {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineGapWidth() ?: self.layer->getDefaultLineGapWidth()];
}

- (void)setLineOffset:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineOffset {
    self.layer->setLineOffset(lineOffset.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineOffset {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineOffset() ?: self.layer->getDefaultLineOffset()];
}

- (void)setLineBlur:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineBlur {
    self.layer->setLineBlur(lineBlur.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineBlur {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getLineBlur() ?: self.layer->getDefaultLineBlur()];
}

- (void)setLineDasharray:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)lineDasharray {
    self.layer->setLineDasharray(lineDasharray.mbgl_numberArrayPropertyValue);
}

- (id <MGLStyleAttributeValue>)lineDasharray {
    return [MGLStyleAttribute mbgl_numberArrayWithPropertyValueNumberArray:self.layer->getLineDasharray() ?: self.layer->getDefaultLineDasharray()];
}

- (void)setLinePattern:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)linePattern {
    self.layer->setLinePattern(linePattern.mbgl_stringPropertyValue);
}

- (id <MGLStyleAttributeValue>)linePattern {
    return [MGLStyleAttribute mbgl_stringWithPropertyValueString:self.layer->getLinePattern() ?: self.layer->getDefaultLinePattern()];
}

@end
