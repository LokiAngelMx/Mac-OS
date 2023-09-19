#import "Alumno.h"

@implementation Alumno

- (instancetype) initWithMatricula: (NSString *) matricula AndMaterias: (NSMutableArray *) materias {
    self = [super init];
    if (self) {
        _matricula = matricula;
        _materias = materias;
    }
    return self;
}

- (void) agregarMateria: (Materia *) materia {
    materia.nombreMateria = materia
}

- (void) quitarMateria: (Materia *) materia {
    
}

@end
