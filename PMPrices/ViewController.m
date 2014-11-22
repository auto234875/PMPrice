//
//  ViewController.m
//  PMPrices
//
//  Created by John on 10/14/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "ViewController.h"
#import "PMPriceParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PMPriceParser *pmPrice=[[PMPriceParser alloc] init];
    NSLog(@"\n%f goldBid %f goldAsk \n%f silverBid %f silverAsk \n%f platinumBid %f platinumAsk \n%f palladiumBid %f palladiumAsk", pmPrice.goldBidUSD,pmPrice.goldAskUSD,pmPrice.silverBidUSD,pmPrice.silverAskUSD,pmPrice.platinumBidUSD,pmPrice.platinumAskUSD,pmPrice.palladiumBidUSD,pmPrice.palladiumAskUSD);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
