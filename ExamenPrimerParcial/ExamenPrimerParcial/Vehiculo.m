#import "Vehiculo.h"

@implementation Vehiculo

- (instancetype) initWithMarca: (NSString *) marca AndModelo: (NSString *) modelo AndMatricula: (NSString *) matricula AndPrecio: (float) precio {
    self = [super initWithMarca:marca AndModelo:modelo];
    if (self) {
        _matricula = matricula;
        _precio = precio;
    }
    return self;
}

@end
