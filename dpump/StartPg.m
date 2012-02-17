//
//  StartPg.m
//  dpump
//
//  Created by Motiejus on 17/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartPg.h"
#import "Settings.h"

@implementation StartPg

@synthesize pkrSettings;
@synthesize settings;

@synthesize statusDialog;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {                                              
    return 1;                     
}                                                                                                                     
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.settings count];                                                                                
}                                                                                                                     

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self.settings objectAtIndex:row] title];
}

- (IBAction)connectButtonClicked:(id)sender
{
    NSInteger row = [pkrSettings selectedRowInComponent:0];
    Settings *cur = [self.settings objectAtIndex:row];
    
    self.statusDialog = [[StatusDialog alloc] initWithNibName:@"StatusDialog"
                                               bundle:[NSBundle mainBundle]
                                                      setting:cur];
    
    [self.view addSubview:self.statusDialog.view];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.settings = [NSMutableArray new];
        Settings *s = [Settings new];
        s.title = @"Default";
        s.nameserv_addr = @"t.malpka.org";
        s.password = @"";
        [self.settings addObject:s];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
