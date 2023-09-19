#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Libro : NSObject

@property (nonatomic, strong) NSString *titulo;
@property (nonatomic, strong) NSString *autor;
@property (nonatomic, assign) NSInteger paginaActual;
@property (nonatomic, assign) NSInteger numerodePaginas;

- (instancetype) initConTitulo: (NSString *) titulo Autor: (NSString *) autor NumerodePaginas: (NSInteger) numeroPaginas;
- (void) avanzarPagina;
- (void) retrocederPagina;
- (void) irAPagina:(NSInteger) pagina;
- (NSString *) informacionDelLibro;

@end

NS_ASSUME_NONNULL_END
