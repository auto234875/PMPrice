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

@interface PMPriceParser ()
@property (nonatomic,strong,readwrite) NSString* agBidPrice;
@property (nonatomic,strong,readwrite) NSString* ptBidPrice;
@property (nonatomic,strong,readwrite) NSString* auBidPrice;
@property (nonatomic, strong,readwrite) NSString* pdBidPrice;
@property (nonatomic,strong,readwrite) NSString* agAskPrice;
@property (nonatomic,strong,readwrite) NSString* ptAskPrice;
@property (nonatomic,strong,readwrite) NSString* auAskPrice;
@property (nonatomic, strong,readwrite) NSString* pdAskPrice;

@end
@implementation PMPriceParser

-(instancetype)init{
    self= [super init];
    [self refreshPrice];
    return self;
    
}

-(NSString*)agBidPrice{
    if (!_agBidPrice) {
        _agBidPrice = [[NSString alloc]init];
    }
    return _agBidPrice;
}

-(NSString*)auBidPrice{
    if (!_auBidPrice) {
        _auBidPrice = [[NSString alloc]init];
    }
    return _auBidPrice;
}
-(NSString*)ptBidPrice{
    if (!_ptBidPrice) {
        _ptBidPrice = [[NSString alloc]init];
    }
    return _ptBidPrice;
}
-(NSString*)pdBidPrice{
    if (!_pdBidPrice) {
        _pdBidPrice = [[NSString alloc]init];
    }
    return _pdBidPrice;
}
-(NSString*)agAskPrice{
    if (!_agAskPrice) {
        _agAskPrice = [[NSString alloc]init];
    }
    return _agAskPrice;
}

-(NSString*)auAskPrice{
    if (!_auAskPrice) {
        _auAskPrice = [[NSString alloc]init];
    }
    return _auAskPrice;
}
-(NSString*)ptAskPrice{
    if (!_ptAskPrice) {
        _ptAskPrice = [[NSString alloc]init];
    }
    return _ptAskPrice;
}
-(NSString*)pdAskPrice{
    if (!_pdAskPrice) {
        _pdAskPrice = [[NSString alloc]init];
    }
    return _pdAskPrice;
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
    self.auBidPrice=[bidPrice objectAtIndex:0];
    self.agBidPrice=[bidPrice objectAtIndex:1];
    self.ptBidPrice=[bidPrice objectAtIndex:2];
    self.pdBidPrice=[bidPrice objectAtIndex:3];
    self.auAskPrice=[askPrice objectAtIndex:0];
    self.agAskPrice=[askPrice objectAtIndex:1];
    self.ptAskPrice=[askPrice objectAtIndex:2];
    self.pdAskPrice=[askPrice objectAtIndex:3];
}
@end
