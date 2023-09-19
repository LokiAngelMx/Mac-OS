#import "Cine.h"

@implementation Cine

- (instancetype) initConNombre: (NSString *) nombre AsientosVIP: (NSInteger) asientosVIP AsientosNormales: (NSInteger) asientosNormales {
    self = [super init];
    if (self) {
        _nombre = nombre;
        _asientosNormales = asientosNormales;
        _asientosVIP = asientosVIP;
        _asientosDisponibles = asientosNormales + asientosVIP;
    }
    
    return self;
}

-(BOOL) venderEntradaDeTipo: (NSString *) tipo conNumeroDeAsientos: (NSInteger) numeroAsientos{
    BOOL transaccionExitosa = NO;
    
    if ([tipo isEqualToString:@"VIP"] && numeroAsientos <= _asientosVIP) {
        _asientosVIP -= numeroAsientos;
        _asientosDisponibles -= numeroAsientos;
        transaccionExitosa = YES;
    }
    
    else if ([tipo isEqualToString:@"Normal"] && numeroAsientos <= _asientosNormales) {
        _asientosNormales -= numeroAsientos;
        _asientosDisponibles -= numeroAsientos;
        transaccionExitosa = YES;
    }
    
    return transaccionExitosa;
}

- (void) proyectarPelicula: (NSString *) nombrePelicula{
    _peliculaActual = nombrePelicula;
}

- (NSString *) estadoDelCine{
    return [NSString stringWithFormat:@"\nCine: %@\nPelicula Actual: %@\nAsientos VIP Disponibles: %ld\nAsientos Normales Disponibles: %ld", _nombre, _peliculaActual, _asientosVIP, _asientosNormales];
}

@end
