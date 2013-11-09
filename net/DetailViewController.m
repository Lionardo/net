//
//  DetailViewController.m
//  net
//
//  Created by Lio Mendonça on 08.11.13.
//  Copyright (c) 2013 Lio Mendonça. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize pricecoffee;
@synthesize changeQuantityCoffeecream;
@synthesize metricQuantityCoffeeCream;

@synthesize priceespresso;
@synthesize changeQuantityEspresso;
@synthesize metricQuantityEspresso;

@synthesize pricelatte;
@synthesize changeQuantityLatte;
@synthesize metricQuantityLatte;

@synthesize priceamericano;
@synthesize changeQuantityAmericano;
@synthesize metricQuantityAmericano;


@synthesize total;
NSString *finalPath;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        NSUInteger value  = changeQuantityCoffeecream.value;
    
    if (value == 0) {
        pricecoffee.text=@" ";
    }
    
    NSUInteger value2  = changeQuantityEspresso.value;
    
    if (value2 == 0) {
        priceespresso.text=@" ";
    }
    
    NSUInteger value3  = changeQuantityLatte.value;
    
    if (value3 == 0) {
        pricelatte.text=@" ";
    }
    
    NSUInteger value4  = changeQuantityAmericano.value;
    
    if (value4 == 0) {
        priceamericano.text=@" ";
    }
    
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)order:(UIButton *)sender {
    [self loadMail];
}

- (IBAction)ChangeQuantityCoffeeCream:(UIStepper *)sender {
    
    NSUInteger value = sender.value;
    metricQuantityCoffeeCream.text = [NSString stringWithFormat:@"%i", (unsigned int)value];
    
    /*The NSDictionary class declares the programmatic interface to objects that manage immutable associations of keys and values.
     In ths case our item in dictionary has a float number that is the price
     */
    NSDictionary *fluffyStoreList =
    @{
      @"Coffee Cream" : [NSNumber numberWithFloat:2.90],
      };
    
    /*
     Here we create a label that has a view tag number 11
     we set a variable val of type float that multiplies the steps with the price of coffeecream.
     */
    
    float val = [((NSNumber*)[fluffyStoreList objectForKey:@"Coffee Cream"]) floatValue] * value;
    
    [pricecoffee setText:[NSString stringWithFormat:@"%.02f",val]];
    
    
    [self calculateTotal];
}


- (IBAction)ChangeQuantityEspresso:(UIStepper *)sender {
    
    NSUInteger value = sender.value;
    metricQuantityEspresso.text = [NSString stringWithFormat:@"%i", (unsigned int)value];
    
    /*The NSDictionary class declares the programmatic interface to objects that manage immutable associations of keys and values.
     In ths case our item in dictionary has a float number that is the price
     */
    NSDictionary *fluffyStoreList =
    @{
      @"Espresso" : [NSNumber numberWithFloat:3.10],
      };
    
    /*
     Here we create a label that has a view tag number 11
     we set a variable val of type float that multiplies the steps with the price of coffeecream.
     */
    
    float val = [((NSNumber*)[fluffyStoreList objectForKey:@"Espresso"]) floatValue] * value;
    
    [priceespresso setText:[NSString stringWithFormat:@"%.02f",val]];
    
    
    [self calculateTotal];
    
}

- (IBAction)ChangeQuantityLatte:(UIStepper *)sender {
    
    NSUInteger value = sender.value;
    metricQuantityLatte.text = [NSString stringWithFormat:@"%i", (unsigned int)value];
    
    /*The NSDictionary class declares the programmatic interface to objects that manage immutable associations of keys and values.
     In ths case our item in dictionary has a float number that is the price
     */
    NSDictionary *fluffyStoreList =
    @{
      @"Latte" : [NSNumber numberWithFloat:4.50],
      };
    
    /*
     Here we create a label that has a view tag number 11
     we set a variable val of type float that multiplies the steps with the price of coffeecream.
     */
    
    float val = [((NSNumber*)[fluffyStoreList objectForKey:@"Latte"]) floatValue] * value;
    
    [pricelatte setText:[NSString stringWithFormat:@"%.02f",val]];
    
    
    [self calculateTotal];
    
}

- (IBAction)ChangeQuantityAmericano:(UIStepper *)sender {
    
    NSUInteger value = sender.value;
    metricQuantityAmericano.text = [NSString stringWithFormat:@"%i", (unsigned int)value];
    
    /*The NSDictionary class declares the programmatic interface to objects that manage immutable associations of keys and values.
     In ths case our item in dictionary has a float number that is the price
     */
    NSDictionary *fluffyStoreList =
    @{
      @"Americano" : [NSNumber numberWithFloat:4.00],
      };
    
    /*
     Here we create a label that has a view tag number 11
     we set a variable val of type float that multiplies the steps with the price of coffeecream.
     */
    
    float val = [((NSNumber*)[fluffyStoreList objectForKey:@"Americano"]) floatValue] * value;
    
    [priceamericano setText:[NSString stringWithFormat:@"%.02f",val]];
    
    
    [self calculateTotal];
    
}

- (IBAction)cancel:(UIButton *)sender {
    
    pricecoffee.text=@" ";
    metricQuantityCoffeeCream.text=@"0";
    priceespresso.text=@" ";
    metricQuantityEspresso.text=@"0";
    pricelatte.text=@" ";
    metricQuantityLatte.text=@"0";
    priceamericano.text=@" ";
    metricQuantityAmericano.text=@"0";
    [self calculateTotal];
    
    
    
}

- (void)calculateTotal{
    
    float floatPriceCoffee = [pricecoffee.text floatValue];
    float floatPriceEspresso = [priceespresso.text floatValue];
    float floatPriceLatte = [pricelatte.text floatValue];
    float floatPriceAmericano = [priceamericano.text floatValue];

    
    float sum = floatPriceCoffee + floatPriceEspresso + floatPriceLatte + floatPriceAmericano;
    [total setText:[NSString stringWithFormat:@"%.02f",sum]];
    
    float *end = &sum;
    
}

- (void) createXml{
    NSLog(@"entered createXml");
    //Create xml string
    NSMutableString *xmlString = [[NSMutableString alloc] init];
    
    float floatPriceCoffee = [pricecoffee.text floatValue];
    float floatPriceEspresso = [priceespresso.text floatValue];
    float floatPriceLatte = [pricelatte.text floatValue];
    float floatPriceAmericano = [priceamericano.text floatValue];
    
    //Add all the data to the string
    [xmlString appendFormat:@"<You have ordered>"];
    [xmlString appendFormat:@"<%@ Coffee Cream for the price of %.02f>", metricQuantityCoffeeCream, floatPriceCoffee];
    [xmlString appendFormat:@"<%@ Espresso for the price of %.02f>", metricQuantityEspresso, floatPriceEspresso];
    [xmlString appendFormat:@"<%@ Latte for the price of %.02f>", metricQuantityLatte, floatPriceLatte];
    [xmlString appendFormat:@"<%@ Americano for the price of %.02f>", metricQuantityAmericano, floatPriceAmericano];
    [xmlString appendFormat:@" for the total sum of %@ Sfr>", total];
    
    //Create a variable to represent the filepath of the outputted file
    //This is taken from some code which saves to an iPhone app's documents directory, it might not be ideal
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    finalPath = [documentsDirectory stringByAppendingPathComponent:@"output.xml"];
    
    //Actually write the information
    NSData *data = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
    [[NSFileManager defaultManager] createFileAtPath:finalPath contents:data attributes:nil];
}


- (void)loadMail
{
    NSLog(@"entered loadMail");
    [self createXml];
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    // Set the subject of email
    [picker setSubject:@"Invoice"];
    
    // Add email addresses
    // Notice three sections: "to" "cc" and "bcc"
    [picker setToRecipients:[NSArray arrayWithObjects:@"m.lionardo@gmail.com", nil]];
    

    // Fill out the email body text
    
    NSString *emailBody =@"Dear customer\n this is your validation.\n Have a nice day!\n";
    
    // This is not an HTML formatted email
    [picker setMessageBody:emailBody isHTML:NO];
    
    
    
    // Attach data to the email
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:finalPath];
    
    [picker addAttachmentData:data mimeType:@"text/xml" fileName:@"coffee.xml"];
    
    //UIImage * logo = [UIImage imageNamed:@"coffee-icon-58.png"];
    
    //NSData * imagedata = UIImageJPEGRepresentation(logo, 1);
    
    //[picker addAttachmentData:imagedata mimeType:@"image/jpeg" fileName:@"coffee-icon-58.png"];
    
    // Show email view
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    // Called once the email is sent
    // Remove the email view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
