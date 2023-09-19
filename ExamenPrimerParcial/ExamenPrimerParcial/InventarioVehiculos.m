#import "InventarioVehiculos.h"

@implementation InventarioVehiculos

- (instancetype) initWithVehiculos: (NSMutableArray *) vehiculos {
    self = [super init];
    if (self) {
        _vehiculos = vehiculos;
    }
    return self;
}

- (void) agregarVehiculo: (Vehiculo *) vehiculo {
    [_vehiculos addObject:vehiculo];
}

- (void) eliminarVehiculo: (Vehiculo *) vehiculo {
    [_vehiculos removeObject:vehiculo];
}

- (void) mostrarTodosLosVehiculos {
    NSLog(@"Mostrar todos los vehículos: ");
    for (Vehiculo *vehiculo in _vehiculos) {
        NSLog(@"Nombre: %@, Modelo: %@, Matrícula: %@, Precio: %f", vehiculo.marca, vehiculo.modelo, vehiculo.matricula, vehiculo.precio);
    }
}

- (void) mostrarPrecioConIVA {
    NSLog(@"Vehículos con IVA: ");
    for (Vehiculo *vehiculo in _vehiculos) {
        NSLog(@"Nombre: %@, Modelo: %@, Matrícula: %@, Precio: %f, Precio con IVA: %f", vehiculo.marca, vehiculo.modelo, vehiculo.matricula, vehiculo.precio, (vehiculo.precio*1.16));
    }
}

- (void) sumatoriaDePrecios {
    NSLog(@"Sumatoria de precios: ");
    for (Vehiculo *vehiculo in _vehiculos) {
        _sumatoria = vehiculo.precio + _sumatoria;
    }
    NSLog(@"La sumatoria de precios es de: %f", _sumatoria);
}

@end
