//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Suyash Joshi on 9/18/13.
//  Copyright (c) 2013 Suyash Joshi. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;


@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
// This method update the totol amount after user enters the bill amount
- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
  
    NSArray *tipPercentValues = @[@(0.10), @(0.15), @(0.20)];
  
    float tipAmount = billAmount * [tipPercentValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
  
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
   self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
@end
