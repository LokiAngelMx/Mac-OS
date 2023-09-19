#import <Foundation/Foundation.h>
#import "Maestro.h"

NS_ASSUME_NONNULL_BEGIN

@interface Materia : NSObject

@property (nonatomic, strong) NSString *nombreMateria;
@property (nonatomic, strong) Maestro *maestro;

- (instancetype) initWithNombreMateria: (NSString *) nombreMateria;

@end

NS_ASSUME_NONNULL_END
