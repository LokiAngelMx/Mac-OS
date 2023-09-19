#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persona : NSObject

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *apellido;

- (instancetype) initWithNombre: (NSString *) nombre AndApellido: (NSString *) apellido;

@end

NS_ASSUME_NONNULL_END
