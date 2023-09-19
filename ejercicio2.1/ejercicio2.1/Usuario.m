#import "Usuario.h"

@implementation Usuario

- (instancetype) initWithNombre: (NSString *) nombre AndIdentificacion: (NSString *) identificacion {
    self = [super init];
    if (self) {
        _nombre = nombre;
        _identificacion = identificacion;
    }
    return self;
}

@end
