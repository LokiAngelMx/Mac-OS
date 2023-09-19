#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface OperacionController : NSViewController

@property (strong) IBOutlet NSTextField *txtNumero1;
@property (strong) IBOutlet NSTextField *txtNumero2;
@property (strong) IBOutlet NSTextField *txtResultado;
- (IBAction)btnAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
