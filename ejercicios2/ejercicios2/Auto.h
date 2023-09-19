#import <Foundation/Foundation.h>
#import "Vehiculo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Auto : Vehiculo

@property (assign, nonatomic) NSInteger numeroDePuertas;

- (instancetype) initWithMarca:(NSString *) marca AndModelo: (NSString *) modelo AndNumeroPuertas: (NSInteger) numeroPuertas;

@end

NS_ASSUME_NONNULL_END
