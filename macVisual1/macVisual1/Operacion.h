#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Operacion : NSObject

- (NSNumber*) sumarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2;
- (NSNumber*) restarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2;
- (NSNumber*) multiplicarCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2;
- (NSNumber*) dividirCon: (NSNumber*) numero1 YNumero2: (NSNumber*) numero2;

@end

NS_ASSUME_NONNULL_END
