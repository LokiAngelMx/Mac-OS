#import "Libro.h"

@implementation Libro

- (instancetype) initConTitulo: (NSString *) titulo Autor: (NSString *) autor NumerodePaginas: (NSInteger) numeroPaginas{
    self = [super init];
    _titulo = titulo;
    _autor = autor;
    _numerodePaginas = numeroPaginas;
    _paginaActual = 1;
    return self;
}

- (void) avanzarPagina {
    if (_paginaActual < _numerodePaginas) {
        _paginaActual += 1;
    }
}

- (void) retrocederPagina {
    if (_paginaActual > 1) {
        _paginaActual -= 1;
    }
}

- (void) irAPagina:(NSInteger) pagina {
    if (pagina >= 1 && pagina <= _numerodePaginas) {
        _paginaActual = pagina;
    }
}

- (NSString *) informacionDelLibro {
    return [NSString stringWithFormat:@"\nTitulo: %@\nAutor: %@\nPAgina Actual: %ld de %ld", _titulo, _autor, (long) _paginaActual, (long) _numerodePaginas];
}

@end
