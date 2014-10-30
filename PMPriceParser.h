//
//  PMPriceParser.h
//  PMPrices
//
//  Created by John on 10/14/14.
//  Copyright (c) 2014 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMPriceParser : NSObject
@property (nonatomic,strong,readonly) NSString* agBidPrice;
@property (nonatomic,strong, readonly) NSString* ptBidPrice;
@property (nonatomic,strong, readonly) NSString* auBidPrice;
@property (nonatomic,strong,readonly) NSString* pdBidPrice;
@property (nonatomic,strong,readonly) NSString* agAskPrice;
@property (nonatomic,strong, readonly) NSString* ptAskPrice;
@property (nonatomic,strong,readonly) NSString* auAskPrice;
@property (nonatomic,strong, readonly) NSString* pdAskPrice;

-(void)refreshPrice;

@end
