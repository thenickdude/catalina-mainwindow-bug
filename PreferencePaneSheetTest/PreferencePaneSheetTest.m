//
//  PreferencePaneSheetTest.m
//  PreferencePaneSheetTest
//
//  Created by Nicholas Sherlock on 27/09/20.
//

#import "PreferencePaneSheetTest.h"
#import "CustomModalWindowController.h"

NSMutableArray *sheetControllers;

@implementation PreferencePaneSheetTest

- (void)mainViewDidLoad
{
}

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

- (IBAction)openButtonClicked:(id)sender {
    [PreferencePaneSheetTest showSheet];
    NSLog(@"");
}

@end
