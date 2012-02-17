//
//  StartPage.h
//  dpump
//
//  Created by Motiejus on 16/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartPage : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSMutableArray *settingsArray;
    UIPickerView *pkrSettings;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@property (nonatomic, retain) NSMutableArray *settingsArray;
@property (nonatomic, retain) IBOutlet UIPickerView *pkrSettings;

@end
