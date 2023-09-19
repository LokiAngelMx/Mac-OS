#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (strong) IBOutlet NSTextField *txtNombre;
@property (strong) IBOutlet NSTextField *txtEdad;
@property (strong) IBOutlet NSTextField *lbMensaje;
- (IBAction)clickEnBoton:(id)sender;

@end
