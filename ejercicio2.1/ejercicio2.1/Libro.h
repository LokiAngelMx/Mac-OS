#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Libro : NSObject

@property (nonatomic, strong) NSString *titulo;
@property (nonatomic, strong) NSString *autor;
@property (nonatomic, strong) NSString *codigo;

- (instancetype) initWithTitulo: (NSString *) titulo AndAutor: (NSString *) autor AndCodigo: (NSString *) codigo;

@end

NS_ASSUME_NONNULL_END
