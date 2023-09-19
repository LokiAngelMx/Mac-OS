#import "Operacion.h"

@implementation Operacion

- (NSNumber*) sumarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2 {
    float num1 = [numero1 floatValue];
    float num2 = [numero2 floatValue];
    float total = num1 + num2;
    return [NSNumber numberWithFloat:total];
}

- (NSNumber*) restarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2 {
    float num1 = [numero1 floatValue];
    float num2 = [numero2 floatValue];
    float total = num1 - num2;
    return [NSNumber numberWithFloat:total];
}

- (NSNumber*) multiplicarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2 {
    float num1 = [numero1 floatValue];
    float num2 = [numero2 floatValue];
    float total = num1 * num2;
    return [NSNumber numberWithFloat:total];
}

- (NSNumber*) dividirCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2 {
    return [NSNumber numberWithFloat:[numero1 floatValue] / [numero2 floatValue]];
}

@end
