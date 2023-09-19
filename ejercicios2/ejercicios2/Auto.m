#import "Auto.h"

@implementation Auto

- (instancetype) initWithMarca:(NSString *) marca AndModelo: (NSString *) modelo AndNumeroPuertas: (NSInteger) numeroPuertas{
    self = [super initWithMarca:marca AndModelo:modelo];
    
    if (self) {
        _numeroDePuertas = numeroPuertas;
    }
    return self;
}

@end
