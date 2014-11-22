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
@property (nonatomic,readonly) CGFloat silverBidPrice;
@property (nonatomic, readonly) CGFloat platinumBidPrice;
@property (nonatomic, readonly) CGFloat goldBidPrice;
@property (nonatomic,readonly) CGFloat palladiumBidPrice;
@property (nonatomic,readonly) CGFloat silverAskPrice;
@property (nonatomic, readonly) CGFloat platinumAskPrice;
@property (nonatomic,readonly) CGFloat goldAskPrice;
@property (nonatomic, readonly) CGFloat palladiumAskPrice;

-(void)refreshPrice;

@end
