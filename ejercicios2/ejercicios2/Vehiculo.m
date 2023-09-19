#import "Vehiculo.h"

@implementation Vehiculo

- (instancetype) initWithMarca:(NSString *) marca AndModelo: (NSString *) modelo {
    self = [super init];
    if (self) {
        _marca = marca;
        _modelo = modelo;
    }
    return self;
}

@end
