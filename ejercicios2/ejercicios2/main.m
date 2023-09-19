#import <Cocoa/Cocoa.h>
#import "Auto.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Auto *carro = [[Auto alloc] initWithMarca:@"VW" AndModelo:@"Jetta" AndNumeroPuertas:4];
        NSLog(@"Tengo un carro marca %@ modelo %@ con %ld puertas", carro.marca, carro.modelo, (long)carro.numeroDePuertas);
        
        NSArray *nombres = @[@"Ivan", @"Monica", @"Pepe"];
        NSString *segundoNombre = [nombres objectAtIndex:1];
        NSLog(@"El nombre es %@", segundoNombre);
        NSUInteger count = [nombres count];
        NSLog(@"El total de elementos son: %@", @(count));
        NSMutableArray *nombresMutable = [NSMutableArray arrayWithObjects: @"Angel", @"Joshua", @"Karla", nil];
        [nombresMutable addObject:@"Otro valor"];
        [nombresMutable replaceObjectAtIndex:3 withObject:@"Jaqueline"];
        NSLog(@"El total de elementos del arreglo mutable son: %@", @([nombresMutable count]));
        
        for (NSString *nombre in nombresMutable) {
            NSLog(@"%@\n", nombre);
        }
        
    }
    return NSApplicationMain(argc, argv);
}
