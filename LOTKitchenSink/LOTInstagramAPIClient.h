//
//  LOTInstagramAPIClient.h
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/30/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOTInstagramAPIClient : NSObject

+(void)methodWithBlock:(void (^)(NSString *myString))blockName;


@end
