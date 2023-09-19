#import "Objeto.h"

@implementation Objeto

- (instancetype) initWithMarca: (NSString *) marca AndModelo: (NSString *) modelo {
    self = [super init];
    if (self) {
        _marca = marca;
        _modelo = modelo;
    }
    return self;
}

@end
