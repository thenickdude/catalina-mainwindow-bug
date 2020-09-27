#import "AppDelegate.h"
#import "MainWindowViewController.h"

@interface AppDelegate ()

@property (strong) MainWindowViewController *myWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)notification
{
    self.myWindowController = [[MainWindowViewController alloc] init];
    [self.myWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
