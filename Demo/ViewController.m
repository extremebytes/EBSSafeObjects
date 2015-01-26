//
//  ViewController.m
//  Demo
//
//  Created by John Woolsey on 1/18/15.
//  Copyright (c) 2015 ExtremeBytes Software. All rights reserved.
//


#import "ViewController.h"
#import "EBSSafeObjects.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *symbolLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (assign, nonatomic) BOOL showStatus;
@property (strong, nonatomic) NSDateFormatter *inputDateFormatter;
@property (strong, nonatomic) NSDateFormatter *outputDateFormatter;
@property (strong, nonatomic) NSDictionary *sampleDictionary;

@end


@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   self.statusLabel.hidden = YES;
   
   // Set up date formatters
   self.inputDateFormatter = [[NSDateFormatter alloc] init];
   self.inputDateFormatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
   self.outputDateFormatter = [[NSDateFormatter alloc] init];
   self.outputDateFormatter.dateFormat = @"EEE MMM dd yyyy HH:mm:ss";
   
   // Set up sample JSON dictionary
   NSMutableDictionary *sampleDataDictionary = [NSMutableDictionary dictionary];
   sampleDataDictionary[@"Status"] = @"SAMPLE";
   sampleDataDictionary[@"Name"] = @"Apple Inc";
   sampleDataDictionary[@"Symbol"] = @"AAPL";
   // sampleDataDictionary[@"Symbol"] = [NSNull null];
   sampleDataDictionary[@"LastPrice"] = @106;
   // sampleDataDictionary[@"LastPrice"] = [NSNull null];
   sampleDataDictionary[@"Change"] = @0.0100000000000051;
   sampleDataDictionary[@"ChangePercent"] = @0.00943485234456564;
   sampleDataDictionary[@"Timestamp"] = @"Fri Jan 16 15:59:00 UTC-05:00 2015";
   // sampleDataDictionary[@"Timestamp"] = [NSNull null];
   sampleDataDictionary[@"MarketCap"] = @621673040000;
   sampleDataDictionary[@"Volume"] = @6751953;
   sampleDataDictionary[@"ChangeYTD"] = @110.38;
   sampleDataDictionary[@"ChangePercentYTD"] = @-3.96811016488494;
   sampleDataDictionary[@"High"] = @107.58;
   sampleDataDictionary[@"Low"] = @105.2;
   sampleDataDictionary[@"Open"] = @107.1;
   self.sampleDictionary = @{@"Data":sampleDataDictionary};
}


- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


#pragma mark - Actions

/**
 *  Retrieve and display JSON sample data for AAPL stock when the Load Sample Data button is pressed.
 *
 *  @param sender The object that requested the action.
 */
- (IBAction)loadSampleDataButtonPressed:(UIButton *)sender
{
   [self displayStockInfo:[self validatedStockInfo:self.sampleDictionary[@"Data"]]];
}


/**
 *  Retrieve and display JSON server data for AAPL stock when the Load Server Data button is pressed.
 *
 *  @param sender The object that requested the action.
 */
- (IBAction)loadServerDataButtonPressed:(UIButton *)sender
{
   // Retrieve stock information from the server
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   NSURL *serverURL = [NSURL URLWithString:@"http://dev.markitondemand.com/api/quote/json?symbol=AAPL"];
   NSURLSession *serverSession = [NSURLSession sharedSession];
   [[serverSession dataTaskWithURL:serverURL completionHandler:^(NSData *serverData, NSURLResponse *serverResponse, NSError *serverError) {
      dispatch_async(dispatch_get_main_queue(), ^{
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         NSString *errorMessage;
         if (serverError) {
            errorMessage = [serverError localizedDescription];
         } else {
            NSError *jsonError;
            NSDictionary *serverDictionary = [NSJSONSerialization JSONObjectWithData:serverData options:NSJSONReadingAllowFragments error:&jsonError];
            if (jsonError) {
               errorMessage = [jsonError localizedDescription];
            } else {
               if ([EBSSafeObjects isSafeNonEmptyString:serverDictionary[@"Message"]]) {
                  errorMessage = NSLocalizedString(serverDictionary[@"Message"], @"Server Message");
               } else if (![EBSSafeObjects isString:serverDictionary[@"Data"][@"Status"] safeNonEmptyEqualToString:@"SUCCESS"]) {
                  errorMessage = @"Did not retrieve a successful status from the server.";
               } else {
                  [self displayStockInfo:[self validatedStockInfo:serverDictionary[@"Data"]]];
               }
            }
         }
         
         // Display and error message to the user if an error occurred
         if (errorMessage) {
            NSLog(@"ERROR: Could not retrieve stock information for AAPL.  %@", errorMessage);
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:NSLocalizedString(@"Could not retrieve stock information.  Please check your network connection and try again.", @"Network Error")
                                                  preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK")
                                       style:UIAlertActionStyleDefault
                                       handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            [self displayStockInfo:[self validatedStockInfo:nil]];
         }
      });
   }] resume];
}


#pragma mark - Custom

/**
 *  Display stock information on screen.
 *
 *  @param stockInfo Dictionary containing stock information.
 */
- (void)displayStockInfo:(NSDictionary *)stockInfo
{
   self.symbolLabel.text = stockInfo[@"Symbol"];
   self.nameLabel.text = stockInfo[@"Name"];
   self.priceLabel.text = stockInfo[@"LastPrice"];
   self.timeLabel.text = stockInfo[@"Timestamp"];
   self.statusLabel.hidden = !self.showStatus;
}


/**
 *  Validates and stringifies stock information from raw JSON dictionary.
 *
 *  @param stockInfo Raw JSON dictionary of stock information.
 *
 *  @return Validated and stringified dictionary of stock information.
 */
- (NSDictionary *)validatedStockInfo:(NSDictionary *)stockInfo
{
   // Log class types
#if defined(DEBUG)
   for (NSString *key in stockInfo) {
      NSLog(@"%@ = %@ : %@", key, stockInfo[key], NSStringFromClass([stockInfo[key] class]));
   }
#endif
   
   // Validate and stringify information
   NSMutableDictionary *validatedStockInfo = [NSMutableDictionary dictionary];
   validatedStockInfo[@"Symbol"] = [EBSSafeObjects isSafeNonEmptyString:stockInfo[@"Symbol"]] ? stockInfo[@"Symbol"] : @"unknown";
   validatedStockInfo[@"Name"] = [EBSSafeObjects isSafeNonEmptyString:stockInfo[@"Name"]] ? stockInfo[@"Name"] : @"unknown";
   validatedStockInfo[@"LastPrice"] = [EBSSafeObjects isSafeNonEmptyNumber:stockInfo[@"LastPrice"]] ? [stockInfo[@"LastPrice"] stringValue] : @"unknown";
   if ([EBSSafeObjects isSafeNonEmptyDate:stockInfo[@"Timestamp"]]) {
      validatedStockInfo[@"Timestamp"] = [self.outputDateFormatter stringFromDate:stockInfo[@"Timestamp"]];
   } else if ([EBSSafeObjects isSafeNonEmptyString:stockInfo[@"Timestamp"]]) {
      NSDate *timeStampDate = [self.inputDateFormatter dateFromString:stockInfo[@"Timestamp"]];
      validatedStockInfo[@"Timestamp"] = [EBSSafeObjects isSafeNonEmptyDate:timeStampDate] ? [self.outputDateFormatter stringFromDate:timeStampDate] : @"unknown";
   } else {
      validatedStockInfo[@"Timestamp"] = @"unknown";
   }
   self.showStatus = [EBSSafeObjects isString:stockInfo[@"Status"] safeNonEmptyEqualToString:@"SUCCESS"] ? YES : NO;
   return [NSDictionary dictionaryWithDictionary:validatedStockInfo];
}

@end
