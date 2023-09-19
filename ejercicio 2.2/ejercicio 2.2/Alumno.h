#import <Foundation/Foundation.h>
#import "Materia.h"

NS_ASSUME_NONNULL_BEGIN

@interface Alumno : NSObject

@property (nonatomic, strong) NSString *matricula;
@property (nonatomic, strong) NSMutableArray *materias;

- (instancetype) initWithMatricula: (NSString *) matricula AndMaterias: (NSMutableArray *) materias;
- (void) agregarMateria: (Materia *) materia;
- (void) quitarMateria: (Materia *) materia;

@end

NS_ASSUME_NONNULL_END
