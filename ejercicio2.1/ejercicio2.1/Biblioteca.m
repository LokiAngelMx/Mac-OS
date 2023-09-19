#import "Biblioteca.h"

@implementation Biblioteca

- (instancetype) initWithLibro: (NSMutableArray *) libros {
    self = [super init];
    if (self) {
        _libros = libros;
    }
    return self;
}

- (void) prestarLibro: (Libro *) libro aUsuario: (Usuario *) usuario {
    usuario.libroPrestado = libro;
    [_libros removeObject:libro];
}

- (void) devolverLibro: (Usuario *) usuario {
    [_libros addObject:usuario.libroPrestado];
    usuario.libroPrestado = nil;
}

@end
