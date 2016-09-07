// This file is generated. 
// Edit platform/darwin/scripts/generate-style-code.js, then run `make style-code-darwin`.

#import "MGLSource.h"
#import "NSPredicate+MGLAdditions.h"
#import "MGLStyleLayer_Private.h"
#import "MGLStyleAttributeValue.h"
#import "MGLCircleStyleLayer.h"

#include <mbgl/style/layers/circle_layer.hpp>

@interface MGLCircleStyleLayer ()

@property (nonatomic) mbgl::style::CircleLayer *layer;
@property (nonatomic, readwrite) NSString *layerIdentifier;
@property (nonatomic, readwrite) NSString *sourceIdentifier;
@property (nonatomic, readwrite) NSString *sourceLayerIdentifier;

@end

@implementation MGLCircleStyleLayer

@synthesize mapView;


- (instancetype)initWithLayerIdentifier:(NSString *)layerIdentifier source:(MGLSource *)source
{
    if (self = [super init]) {
        _layerIdentifier = layerIdentifier;
        _sourceIdentifier = source.sourceIdentifier;
        _layer = new mbgl::style::CircleLayer(layerIdentifier.UTF8String, source.sourceIdentifier.UTF8String);
    }
    return self;
}

- (instancetype)initWithLayerIdentifier:(NSString *)layerIdentifier source:(MGLSource *)source sourceLayer:(NSString *)sourceLayer
{
    if (self = [super init]) {
        _layerIdentifier = layerIdentifier;
        _sourceIdentifier = source.sourceIdentifier;
        _layer = new mbgl::style::CircleLayer(layerIdentifier.UTF8String, source.sourceIdentifier.UTF8String);
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

#pragma mark - Accessing the Paint Attributes

- (void)setCircleRadius:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleRadius {
    self.layer->setCircleRadius(circleRadius.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)circleRadius {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getCircleRadius() ?: self.layer->getDefaultCircleRadius()];
}

- (void)setCircleColor:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleColor {
    self.layer->setCircleColor(circleColor.mbgl_colorPropertyValue);
}

- (id <MGLStyleAttributeValue>)circleColor {
    return [MGLStyleAttribute mbgl_colorWithPropertyValueColor:self.layer->getCircleColor() ?: self.layer->getDefaultCircleColor()];
}

- (void)setCircleBlur:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleBlur {
    self.layer->setCircleBlur(circleBlur.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)circleBlur {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getCircleBlur() ?: self.layer->getDefaultCircleBlur()];
}

- (void)setCircleOpacity:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleOpacity {
    self.layer->setCircleOpacity(circleOpacity.mbgl_floatPropertyValue);
}

- (id <MGLStyleAttributeValue>)circleOpacity {
    return [MGLStyleAttribute mbgl_numberWithPropertyValueNumber:self.layer->getCircleOpacity() ?: self.layer->getDefaultCircleOpacity()];
}

- (void)setCircleTranslate:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleTranslate {
    self.layer->setCircleTranslate(circleTranslate.mbgl_offsetPropertyValue);
}

- (id <MGLStyleAttributeValue>)circleTranslate {
    return [MGLStyleAttribute mbgl_offsetWithPropertyValueOffset:self.layer->getCircleTranslate() ?: self.layer->getDefaultCircleTranslate()];
}

- (void)setCircleTranslateAnchor:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circleTranslateAnchor {
    MGLSetEnumProperty(circleTranslateAnchor, CircleTranslateAnchor, TranslateAnchorType, MGLCircleStyleLayerCircleTranslateAnchor);
}

- (id <MGLStyleAttributeValue>)circleTranslateAnchor {
    MGLGetEnumProperty(CircleTranslateAnchor, TranslateAnchorType, MGLCircleStyleLayerCircleTranslateAnchor);
}

- (void)setCirclePitchScale:(id <MGLStyleAttributeValue, MGLStyleAttributeValue_Private>)circlePitchScale {
    MGLSetEnumProperty(circlePitchScale, CirclePitchScale, CirclePitchScaleType, MGLCircleStyleLayerCirclePitchScale);
}

- (id <MGLStyleAttributeValue>)circlePitchScale {
    MGLGetEnumProperty(CirclePitchScale, CirclePitchScaleType, MGLCircleStyleLayerCirclePitchScale);
}

@end
