#import "NSExpression+MGLAdditions.h"

@implementation NSExpression (MGLAdditions)

- (std::vector<mbgl::Value>)mgl_filterValues
{
    if ([self.constantValue isKindOfClass:NSArray.class]) {
        NSArray *values = self.constantValue;
        std::vector<mbgl::Value>convertedValues;
        for (id value in values) {
            convertedValues.push_back([self mgl_convertedValueWithValue:value]);
        }
        return convertedValues;
    }
    [NSException raise:@"Values not handled" format:@""];
    return { };
}

- (mbgl::Value)mgl_filterValue
{
    return [self mgl_convertedValueWithValue:self.constantValue];
}

- (mbgl::Value)mgl_convertedValueWithValue:(id)value
{
    if ([value isKindOfClass:NSString.class]) {
        return { std::string([(NSString *)value UTF8String]) };
    } else if ([value isKindOfClass:NSNumber.class]) {
        NSNumber *number = (NSNumber *)value;
        // handle all types defined in NSNumber designated initializers
        if (strcmp([number objCType], @encode(char)) == 0) {
            return { number.charValue };
        } else if (strcmp([number objCType], @encode(unsigned char)) == 0) {
            return { number.unsignedCharValue };
        } else if (strcmp([number objCType], @encode(short)) == 0) {
            return { number.shortValue };
        } else if (strcmp([number objCType], @encode(unsigned short)) == 0) {
            return { number.unsignedShortValue };
        } else if (strcmp([number objCType], @encode(int)) == 0) {
            return { number.intValue };
        } else if (strcmp([number objCType], @encode(unsigned int)) == 0) {
            return { number.unsignedIntValue };
        } else if (strcmp([number objCType], @encode(long)) == 0) {
            return { number.longValue };
        } else if (strcmp([number objCType], @encode(unsigned long)) == 0) {
            return { number.unsignedLongValue };
        } else if (strcmp([number objCType], @encode(long long)) == 0) {
            return { number.longLongValue };
        } else if (strcmp([number objCType], @encode(unsigned long long)) == 0) {
            return { number.unsignedLongLongValue };
        } else if (strcmp([number objCType], @encode(float)) == 0) {
            return { number.floatValue };
        } else if (strcmp([number objCType], @encode(double)) == 0) {
            return { number.doubleValue };
        } else if (strcmp([number objCType], @encode(bool)) == 0) {
            return { number.boolValue };
        } else if (strcmp([number objCType], @encode(NSInteger)) == 0) {
            return { number.integerValue };
        } else if (strcmp([number objCType], @encode(NSUInteger)) == 0) {
            return { number.unsignedIntegerValue };
        }
    }
    [NSException raise:@"Value not handled"
                format:@"Can’t convert %s:%@ to mbgl::Value", [value objCType], value];
    return { };
}

@end
