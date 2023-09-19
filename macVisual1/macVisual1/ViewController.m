#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_lbMensaje setStringValue:@"Hola a todos"];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)clickEnBoton:(id)sender {
    if ([sender isKindOfClass:[NSButton class]]) {
        NSString *mensaje = [NSString stringWithFormat:@"Mi nombre es %@ y tengo %@ años.", _txtNombre.stringValue, _txtEdad.stringValue];
        
        [_lbMensaje setStringValue:mensaje];
        
        NSLog(@"Click en un botón");
    } else {
        NSLog(@"Click en otra cosa");
    }
}
@end
