//
//  OperacionController.m
//  macVisual1
//
//  Created by ISSC_401_2023 on 29/08/23.
//

#import "OperacionController.h"
#import "Operacion.h"

@interface OperacionController ()

@end

@implementation OperacionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [_txtNumero1 setFloatValue:0];
    [_txtNumero2 setFloatValue:0];
    [_txtResultado setFloatValue:0];
}

- (IBAction)btnAction:(id)sender {
    Operacion *operacion = [Operacion alloc];
    NSNumber *num1 = [NSNumber numberWithFloat:[_txtNumero1 floatValue]];
    NSNumber *num2 = [NSNumber numberWithFloat:[_txtNumero2 floatValue]];
    
    if ([[sender identifier] isEqualToString:@"btnSumar"]) {
        NSLog(@"BTN SUMAR");
        float resultado = [[operacion sumarCon:num1 YNumero2:num2] floatValue];
        [_txtResultado setFloatValue:resultado];
    }
    
    if ([[sender identifier] isEqualToString:@"btnRestar"]) {
        NSLog(@"BTN RESTAR");
        float resultado = [[operacion restarCon:num1 YNumero2:num2] floatValue];
        [_txtResultado setFloatValue:resultado];
    }
    
    if ([[sender identifier] isEqualToString:@"btnMultiplicar"]) {
        NSLog(@"BTN MULTIPLICAR");
        float resultado = [[operacion multiplicarCon:num1 YNumero2:num2] floatValue];
        [_txtResultado setFloatValue:resultado];
    }
    
    if ([[sender identifier] isEqualToString:@"btnDividir"]) {
        NSLog(@"BTN DIVIDIR");
        float resultado = [[operacion dividirCon:num1 YNumero2:num2] floatValue];
        [_txtResultado setFloatValue:resultado];
    }
}
@end
