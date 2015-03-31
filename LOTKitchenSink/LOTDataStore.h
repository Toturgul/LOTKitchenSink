//
//  LOTDataStore.h
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/29/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOTDataStore : NSObject

-(instancetype)init;
+ (instancetype)sharedDataManager;
-(void)addInstagramData:(NSString*)someObject;
-(NSArray*)retrieveInstagramData;
-(void)addInstaToken:(NSString*)tokenAsString;
-(NSString*)retrieveInstaToken;


@end
