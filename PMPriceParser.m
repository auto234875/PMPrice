//
//  PMPriceParser.m
//  PMPrices
//
//  Created by John on 10/14/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import "PMPriceParser.h"
#import "TFHpple.h"
#import "TFHppleElement.h"
#import <UIKit/UIKit.h>

@interface PMPriceParser ()
@property (nonatomic,readwrite) CGFloat silverBidUSD;
@property (nonatomic,readwrite) CGFloat platinumBidUSD;
@property (nonatomic,readwrite) CGFloat goldBidUSD;
@property (nonatomic,readwrite) CGFloat palladiumBidUSD;
@property (nonatomic,readwrite) CGFloat silverAskUSD;
@property (nonatomic,readwrite) CGFloat platinumAskUSD;
@property (nonatomic,readwrite) CGFloat goldAskUSD;
@property (nonatomic,readwrite) CGFloat palladiumAskUSD;

@end
@implementation PMPriceParser

-(instancetype)init{
    self= [super init];
    if (self) {
        [self refreshPrice];
    }
    return self;
    
}
-(CGFloat)turnPriceStringIntoFloat:(NSString*)string{
    CGFloat priceFloat=[[string stringByReplacingOccurrencesOfString:@"," withString:@""] stringByReplacingOccurrencesOfString:@"$" withString:@""].floatValue;
    return priceFloat;
}
-(void)refreshPrice{
    NSURL *apmexURL = [NSURL URLWithString:@"http://www.apmex.com"];
    NSData *apmexData = [NSData dataWithContentsOfURL:apmexURL];
    TFHpple *priceParser = [TFHpple hppleWithHTMLData:apmexData];
    NSString *bidUSDXpathQueryString = @"//table[@class='table-spot-prices table-striped']/tbody/tr/td[@class='text-right']/span[@class='item-bid']";
    NSString *askUSDXpathQueryString = @"//table[@class='table-spot-prices table-striped']/tbody/tr/td[@class='text-right']/span[@class='item-ask']";
    NSArray *bidUSDNode = [priceParser searchWithXPathQuery:bidUSDXpathQueryString];
    NSArray *askUSDNode = [priceParser searchWithXPathQuery:askUSDXpathQueryString];

    
    NSMutableArray *bidUSD = [[NSMutableArray alloc] initWithCapacity:4];
    NSMutableArray *askUSD = [[NSMutableArray alloc] initWithCapacity:4];

    for (TFHppleElement *element in bidUSDNode) {
        [bidUSD addObject:[element text]];
    }
    for (TFHppleElement *element in askUSDNode) {
        [askUSD addObject:[element text]];
    }
    self.goldBidUSD=[self turnPriceStringIntoFloat:[bidUSD objectAtIndex:0]];
    self.silverBidUSD=[self turnPriceStringIntoFloat:[bidUSD objectAtIndex:1]];
    self.platinumBidUSD=[self turnPriceStringIntoFloat:[bidUSD objectAtIndex:2]];
    self.palladiumBidUSD=[self turnPriceStringIntoFloat:[bidUSD objectAtIndex:3]];
    self.goldAskUSD=[self turnPriceStringIntoFloat:[askUSD objectAtIndex:0]];
    self.silverAskUSD=[self turnPriceStringIntoFloat:[askUSD objectAtIndex:1]];
    self.platinumAskUSD=[self turnPriceStringIntoFloat:[askUSD objectAtIndex:2]];
    self.palladiumAskUSD=[self turnPriceStringIntoFloat:[askUSD objectAtIndex:3]];
}
@end
