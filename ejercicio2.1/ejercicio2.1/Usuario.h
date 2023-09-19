#import <Foundation/Foundation.h>
#import "Libro.h"

NS_ASSUME_NONNULL_BEGIN

@interface Usuario : NSObject

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *identificacion;
@property (nonatomic, strong, nullable) Libro *libroPrestado;

- (instancetype) initWithNombre: (NSString *) nombre AndIdentificacion: (NSString *) identificacion;

@end

NS_ASSUME_NONNULL_END
