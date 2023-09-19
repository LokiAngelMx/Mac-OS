#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Objeto : NSObject

@property (nonatomic, strong) NSString *marca;
@property (nonatomic, strong) NSString *modelo;

- (instancetype) initWithMarca: (NSString *) marca AndModelo: (NSString *) modelo;

@end

NS_ASSUME_NONNULL_END
