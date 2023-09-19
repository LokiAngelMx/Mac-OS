#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property BOOL toogleHabilitarFechaConsultaEstado;
@property (strong) IBOutlet NSTextField *txtAutor;
@property (strong) IBOutlet NSTextField *txtFechaPublicacion;
@property (strong) IBOutlet NSTextField *txtTituloLibro;
@property (strong) IBOutlet NSTextField *txtEditorialLibro;
@property (strong) IBOutlet NSDatePicker *txtFechaConsulta;
@property (strong) IBOutlet NSTextField *txtCita;
@property (strong) IBOutlet NSSwitch *toggleCopiar;
- (IBAction)buttonAction:(id)sender;

- (NSString*) generarCitaConAutor: (NSString*) autor FechaPublicacion: (NSString*) fechaPublicacion TituloLibro: (NSString*) tituloLibro EditorialLibro: (NSString*) editorialLibro FechaConsulta: (NSDate*) fechaConsulta;
- (NSString*) generarCitaConAutor: (NSString*) autor FechaPublicacion: (NSString*) fechaPublicacion TituloLibro: (NSString*) tituloLibro EditorialLibro: (NSString*) editorialLibro;
- (void) copiarAlPortapapeles: (NSString*) contenido;
@end
