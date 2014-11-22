//
//  PMPriceParser.h
//  PMPrices
//
//  Created by John on 10/14/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PMPriceParser : NSObject
@property (nonatomic,readonly) CGFloat silverBidUSD;
@property (nonatomic, readonly) CGFloat platinumBidUSD;
@property (nonatomic, readonly) CGFloat goldBidUSD;
@property (nonatomic,readonly) CGFloat palladiumBidUSD;
@property (nonatomic,readonly) CGFloat silverAskUSD;
@property (nonatomic, readonly) CGFloat platinumAskUSD;
@property (nonatomic,readonly) CGFloat goldAskUSD;
@property (nonatomic, readonly) CGFloat palladiumAskUSD;

-(void)refreshPrice;

@end
