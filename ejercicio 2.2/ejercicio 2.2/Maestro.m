#import "Maestro.h"

@implementation Maestro

- (instancetype) initWithExperiencia: (NSInteger) experiencia {
    self = [super init];
    if (self) {
        _experiencia = experiencia;
    }
    return self;
}

@end
