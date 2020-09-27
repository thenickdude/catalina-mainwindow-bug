#import "MainWindowViewController.h"
#import "CustomModalWindowController.h"

NSMutableArray *sheetControllers;

@implementation MainWindowViewController

+ (void) showSheet {
    NSWindow *mainWindow = [NSApp mainWindow];
    
    NSLog(@"Main window is currently %p, want to show a new sheet on it", mainWindow);

    if ([mainWindow attachedSheet]) {
        NSLog(@"There's already a sheet showing, I'll close that first...");
        
        [mainWindow endSheet: [mainWindow attachedSheet]];
    }
    
    NSLog(@"No sheet attached to the main window, so opening new one now");

    CustomModalWindowController *sheetController = [[CustomModalWindowController alloc] init];
    [sheetControllers addObject: sheetController];

    [mainWindow beginSheet: [sheetController window]
         completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"Sheet closed");
        
            [sheetControllers removeObject:sheetController];
        }
    ];
}

- (MainWindowViewController*)init
{
    self = [super initWithWindowNibName:@"MainWindowViewController"];
   
    sheetControllers = [NSMutableArray arrayWithCapacity:1];
    
   return self;
}

- (IBAction)didTapOpenButton:(id)sender {
    [MainWindowViewController showSheet];
    NSLog(@"");
}

@end
