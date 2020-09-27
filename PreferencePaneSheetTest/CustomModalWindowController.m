//
//  CustomModalWindowViewController.m
//  CustomModalWindow
//
//  Created by Nick Kuh on 16/01/2015.
//  Copyright (c) 2015 Mumbo Apps Ltd. All rights reserved.
//

#import "CustomModalWindowController.h"
#import "PreferencePaneSheetTest.h"

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
    [PreferencePaneSheetTest showSheet];
    NSLog(@"");
}

@end
