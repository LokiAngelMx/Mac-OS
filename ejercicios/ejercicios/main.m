#import <Cocoa/Cocoa.h>
#import "Libro.h"
#import "Cine.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         Libro *libro = [[Libro alloc] initConTitulo:@"1984" Autor:@"George Orwll" NumerodePaginas:253];
         [libro irAPagina:189];
         [libro avanzarPagina];
         NSLog(@"%@", [libro informacionDelLibro]);
         */
        
        Cine *cine = [[Cine alloc] initConNombre:@"Cinepollis" AsientosVIP:30 AsientosNormales:100];
        [cine venderEntradaDeTipo:@"VIP" conNumeroDeAsientos:18];
        [cine venderEntradaDeTipo:@"Normal" conNumeroDeAsientos:57];
        [cine proyectarPelicula:@"Barbie"];
        NSLog(@"%@", [cine estadoDelCine]);
    }
    
    return NSApplicationMain(argc, argv);
}
