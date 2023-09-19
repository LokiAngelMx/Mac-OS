#import <Cocoa/Cocoa.h>
#import "Libro.h"
#import "Usuario.h"
#import "Biblioteca.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Libro *libro1 = [[Libro alloc] initWithTitulo:@"Padre rico, padre pobre" AndAutor:@"Robert" AndCodigo:@"SKDI-DEF-JHSGT"];
        Libro *libro2 = [[Libro alloc] initWithTitulo:@"El hombre más rico de Babilonia" AndAutor:@"George" AndCodigo:@"HDGJ-JDK-PWURH"];
        Libro *libro3 = [[Libro alloc] initWithTitulo:@"El principito" AndAutor:@"Antoine" AndCodigo:@"LQOR-URY-MCNBD"];
        Libro *libro4 = [[Libro alloc] initWithTitulo:@"Pequeño cerdo capitalista" AndAutor:@"Sofia" AndCodigo:@"ÑLOR-ÑLD-MVHFR"];
        Libro *libro5 = [[Libro alloc] initWithTitulo:@"Harry Potter" AndAutor:@"Guzmán" AndCodigo:@"CADF-KWN-LSMDJ"];
        
        NSMutableArray *libros = [NSMutableArray arrayWithObjects:libro1, libro2, libro3, libro4, libro5, nil];
        
        Biblioteca *biblioteca = [[Biblioteca alloc] initWithLibro: libros];
        
        Usuario *joshua = [[Usuario alloc] initWithNombre:@"Joshua" AndIdentificacion:@"6709518272"];
        
        NSLog(@"Libros existentes: ");
        for (Libro *libro in biblioteca.libros) {
            NSLog(@"%@", libro.titulo);
        }
        
        [biblioteca prestarLibro:libro3 aUsuario:joshua];
        
        if (joshua.libroPrestado == nil) {
            NSLog(@"%@ está triste porque no tiene un libro", joshua.nombre);
        } else {
            NSLog(@"%@ tiene el libro %@", joshua.nombre, joshua.libroPrestado.titulo);
        }
    }
    return NSApplicationMain(argc, argv);
}
