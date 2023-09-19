#import <Foundation/Foundation.h>
#import "Objeto.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vehiculo : Objeto

@property (nonatomic, strong) NSString *matricula;
@property (nonatomic, assign) float precio;

- (instancetype) initWithMarca: (NSString *) marca AndModelo: (NSString *) modelo AndMatricula: (NSString *) matricula AndPrecio: (float) precio;

@end

NS_ASSUME_NONNULL_END
