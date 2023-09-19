#import <Cocoa/Cocoa.h>
#import "Objeto.h"
#import "Vehiculo.h"
#import "InventarioVehiculos.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Vehiculo *vehiculo1 = [[Vehiculo alloc] initWithMarca:@"VW" AndModelo:@"Jetta" AndMatricula:@"GKN391E" AndPrecio:280];
        
        Vehiculo *vehiculo2 = [[Vehiculo alloc] initWithMarca:@"BWM" AndModelo:@"M3" AndMatricula:@"GHE967F" AndPrecio:500];
        
        Vehiculo *vehiculo3 = [[Vehiculo alloc] initWithMarca:@"Mercedes" AndModelo:@"Clase G" AndMatricula:@"GWD817J" AndPrecio:800];
        
        NSMutableArray *vehiculos = [NSMutableArray arrayWithObjects:vehiculo1, vehiculo2, vehiculo3, nil];
        
        InventarioVehiculos *inventarioVehiculos = [[InventarioVehiculos alloc] initWithVehiculos:vehiculos];
        
        [inventarioVehiculos mostrarTodosLosVehiculos];
        [inventarioVehiculos mostrarPrecioConIVA];
        [inventarioVehiculos sumatoriaDePrecios];
        [inventarioVehiculos eliminarVehiculo:vehiculo1];
        [inventarioVehiculos mostrarTodosLosVehiculos];
        
        Vehiculo *vehiculo4 = [[Vehiculo alloc] initWithMarca:@"Nissan" AndModelo:@"Versa" AndMatricula:@"GXG395M" AndPrecio:200];
        
        [inventarioVehiculos agregarVehiculo:vehiculo4];
        [inventarioVehiculos mostrarTodosLosVehiculos];
    }
    return NSApplicationMain(argc, argv);
}
