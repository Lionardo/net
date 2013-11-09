//
//  DetailViewController.h
//  net
//
//  Created by Lio Mendonça on 08.11.13.
//  Copyright (c) 2013 Lio Mendonça. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface DetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UILabel *total;

@property (strong, nonatomic) IBOutlet UILabel *pricecoffee;
@property (strong, nonatomic) IBOutlet UILabel *priceespresso;
@property (strong, nonatomic) IBOutlet UILabel *pricelatte;
@property (strong, nonatomic) IBOutlet UILabel *priceamericano;


@property (strong, nonatomic) IBOutlet UIStepper *changeQuantityCoffeecream;
@property (strong, nonatomic) IBOutlet UIStepper *changeQuantityEspresso;
@property (strong, nonatomic) IBOutlet UIStepper *changeQuantityLatte;
@property (strong, nonatomic) IBOutlet UIStepper *changeQuantityAmericano;

@property (strong, nonatomic) IBOutlet UILabel *metricQuantityCoffeeCream;
@property (strong, nonatomic) IBOutlet UILabel *metricQuantityEspresso;
@property (strong, nonatomic) IBOutlet UILabel *metricQuantityLatte;
@property (strong, nonatomic) IBOutlet UILabel *metricQuantityAmericano;

- (IBAction)order:(UIButton *)sender;
- (IBAction)ChangeQuantityCoffeeCream:(UIStepper *)sender;
- (IBAction)ChangeQuantityEspresso:(UIStepper *)sender;
- (IBAction)ChangeQuantityLatte:(UIStepper *)sender;
- (IBAction)ChangeQuantityAmericano:(UIStepper *)sender;
- (IBAction)cancel:(UIButton *)sender;


@end
