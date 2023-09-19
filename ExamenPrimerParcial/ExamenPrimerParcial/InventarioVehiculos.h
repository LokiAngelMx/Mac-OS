#import <Foundation/Foundation.h>
#import "Vehiculo.h"

NS_ASSUME_NONNULL_BEGIN

@interface InventarioVehiculos : Vehiculo

@property (nonatomic, strong) NSMutableArray *vehiculos;
@property (nonatomic, assign) float sumatoria;

- (instancetype) initWithVehiculos: (NSMutableArray *) vehiculos;
- (void) agregarVehiculo: (Vehiculo *) vehiculo;
- (void) eliminarVehiculo: (Vehiculo *) vehiculo;
- (void) mostrarTodosLosVehiculos;
- (void) mostrarPrecioConIVA;
- (void) sumatoriaDePrecios;

@end

NS_ASSUME_NONNULL_END
