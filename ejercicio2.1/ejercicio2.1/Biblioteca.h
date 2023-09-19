#import <Foundation/Foundation.h>
#import "Libro.h"
#import "Usuario.h"

NS_ASSUME_NONNULL_BEGIN

@interface Biblioteca : NSObject

@property (nonatomic, strong) NSMutableArray *libros;

- (instancetype) initWithLibro: (NSMutableArray *) libros;
- (void) prestarLibro: (Libro *) libro aUsuario: (Usuario *) usuario;
- (void) devolverLibro: (Usuario *) usuario;

@end

NS_ASSUME_NONNULL_END
