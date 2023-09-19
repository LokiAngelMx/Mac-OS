#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cine : NSObject

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, assign) NSInteger asientosDisponibles;
@property (nonatomic, assign) NSInteger asientosVIP;
@property (nonatomic, assign) NSInteger asientosNormales;
@property (nonatomic, strong) NSString *peliculaActual;

- (instancetype) initConNombre: (NSString *) nombre AsientosVIP: (NSInteger) asientosVIP AsientosNormales: (NSInteger) asientosNormales;
-(BOOL) venderEntradaDeTipo: (NSString *) tipo conNumeroDeAsientos: (NSInteger) numeroAsientos;
- (void) proyectarPelicula: (NSString *) nombrePelicula;
- (NSString *) estadoDelCine;

@end

NS_ASSUME_NONNULL_END
