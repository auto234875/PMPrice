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
@property (nonatomic,readwrite) CGFloat silverBidPrice;
@property (nonatomic,readwrite) CGFloat platinumBidPrice;
@property (nonatomic,readwrite) CGFloat goldBidPrice;
@property (nonatomic,readwrite) CGFloat palladiumBidPrice;
@property (nonatomic,readwrite) CGFloat silverAskPrice;
@property (nonatomic,readwrite) CGFloat platinumAskPrice;
@property (nonatomic,readwrite) CGFloat goldAskPrice;
@property (nonatomic,readwrite) CGFloat palladiumAskPrice;

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
    NSString *bidPriceXpathQueryString = @"//table[@class='table-spot-prices table-striped']/tbody/tr/td[@class='text-right']/span[@class='item-bid']";
    NSString *askPriceXpathQueryString = @"//table[@class='table-spot-prices table-striped']/tbody/tr/td[@class='text-right']/span[@class='item-ask']";
    NSArray *bidPriceNode = [priceParser searchWithXPathQuery:bidPriceXpathQueryString];
    NSArray *askPriceNode = [priceParser searchWithXPathQuery:askPriceXpathQueryString];

    
    NSMutableArray *bidPrice = [[NSMutableArray alloc] initWithCapacity:4];
    NSMutableArray *askPrice = [[NSMutableArray alloc] initWithCapacity:4];

    for (TFHppleElement *element in bidPriceNode) {
        [bidPrice addObject:[element text]];
    }
    for (TFHppleElement *element in askPriceNode) {
        [askPrice addObject:[element text]];
    }
    self.goldBidPrice=[self turnPriceStringIntoFloat:[bidPrice objectAtIndex:0]];
    self.silverBidPrice=[self turnPriceStringIntoFloat:[bidPrice objectAtIndex:1]];
    self.platinumBidPrice=[self turnPriceStringIntoFloat:[bidPrice objectAtIndex:2]];
    self.palladiumBidPrice=[self turnPriceStringIntoFloat:[bidPrice objectAtIndex:3]];
    self.goldAskPrice=[self turnPriceStringIntoFloat:[askPrice objectAtIndex:0]];
    self.silverAskPrice=[self turnPriceStringIntoFloat:[askPrice objectAtIndex:1]];
    self.platinumAskPrice=[self turnPriceStringIntoFloat:[askPrice objectAtIndex:2]];
    self.palladiumAskPrice=[self turnPriceStringIntoFloat:[askPrice objectAtIndex:3]];
}
@end
