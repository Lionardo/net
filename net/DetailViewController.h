//
//  DetailViewController.h
//  net
//
//  Created by Lio Mendonça on 08.11.13.
//  Copyright (c) 2013 Lio Mendonça. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
