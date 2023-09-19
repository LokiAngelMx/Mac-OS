#import "Persona.h"

@implementation Persona

- (instancetype) initWithNombre: (NSString *) nombre AndApellido: (NSString *) apellido {
    self = [super init];
    if (self) {
        _nombre = nombre;
        _apellido = apellido;
    }
    return self;
}

@end
