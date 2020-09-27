#import "CustomModalWindowController.h"
#import "MainWindowViewController.h"

@implementation CustomModalWindowController

- (CustomModalWindowController*)init
{
   self = [super initWithWindowNibName:@"CustomModalWindowController"];
   
   return self;
}

- (IBAction)didTapCancelButton:(id)sender {
   [self.window.sheetParent endSheet:self.window returnCode:NSModalResponseCancel];
}

- (IBAction)didTapShowButton:(id)sender {
    [MainWindowViewController showSheet];
    NSLog(@"");
}

@end
