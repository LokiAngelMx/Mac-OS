#import "Materia.h"

@implementation Materia

- (instancetype) initWithNombreMateria: (NSString *) nombreMateria {
    self = [super init];
    if (self) {
        _nombreMateria = nombreMateria;
    }
    return self;
}

@end
