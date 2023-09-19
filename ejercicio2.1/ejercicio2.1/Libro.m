#import "Libro.h"

@implementation Libro

- (instancetype) initWithTitulo: (NSString *) titulo AndAutor: (NSString *) autor AndCodigo: (NSString *) codigo {
    self = [super init];
    if (self) {
        _titulo = titulo;
        _autor = autor;
        _codigo = codigo;
    }
    return self;
}

@end
