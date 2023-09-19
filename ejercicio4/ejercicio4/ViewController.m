#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)buttonAction:(id)sender {
    NSString *autor = _txtAutor.stringValue;
    NSString *fechaPublicacion = _txtFechaPublicacion.stringValue;
    NSString *titulo = _txtTituloLibro.stringValue;
    NSString *editorial = _txtEditorialLibro.stringValue;
    NSDate *fechaConsulta = _txtFechaConsulta.dateValue;
    
    NSLog(@"%@", [sender identifier]);
    
    if ([[sender identifier] isEqualToString:@"btnGenerar"]) {
        NSString *cita;
        
        if (_toogleHabilitarFechaConsultaEstado == YES) {
            cita = [self generarCitaConAutor:autor FechaPublicacion:fechaPublicacion TituloLibro:titulo EditorialLibro:editorial FechaConsulta:fechaConsulta];
        } else {
            cita = [self generarCitaConAutor:autor FechaPublicacion:fechaPublicacion TituloLibro:titulo EditorialLibro:editorial];
        }
        
        [_txtCita setStringValue:cita];
        
        if (_toggleCopiar.state == YES) {
            [self copiarAlPortapapeles:cita];
        }
    }
    
    if ([[sender identifier] isEqualToString:@"btnCopiar"]) {
        [self copiarAlPortapapeles:_txtCita.stringValue];
    }
}

- (NSString*) generarCitaConAutor: (NSString*) autor FechaPublicacion: (NSString*) fechaPublicacion TituloLibro: (NSString*) tituloLibro EditorialLibro: (NSString*) editorialLibro FechaConsulta: (NSDate*) fechaConsulta {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *fechaConFormato = [formatter stringFromDate: fechaConsulta];
    
    return [NSString stringWithFormat:@"%@. (%@). %@. %@. Consultado el %@", autor, fechaPublicacion, tituloLibro, editorialLibro, fechaConFormato];
}

- (NSString*) generarCitaConAutor: (NSString*) autor FechaPublicacion: (NSString*) fechaPublicacion TituloLibro: (NSString*) tituloLibro EditorialLibro: (NSString*) editorialLibro {
    return [NSString stringWithFormat:@"%@. (%@). %@. %@.", autor, fechaPublicacion, tituloLibro, editorialLibro];
}

- (void) copiarAlPortapapeles: (NSString*) contenido {
    NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
    [pasteBoard declareTypes:[NSArray arrayWithObject:NSPasteboardTypeString] owner:nil];
    [pasteBoard setString:contenido forType:NSPasteboardTypeString];
}
@end
