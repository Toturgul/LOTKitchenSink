//
//  LOTDataStore.m
//  LOTKitchenSink
//
//  Created by Levan Toturgul on 3/29/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//

#import "LOTDataStore.h"

@interface LOTDataStore()
@property (strong, nonatomic) NSMutableArray *instaData;
@property (strong, nonatomic) NSMutableString *instaToken;


@end


@implementation LOTDataStore


-(instancetype)init{
    self = [super init];
    if (self) {
        _instaData = [[NSMutableArray alloc]init];
        _instaToken = [[NSMutableString alloc]init];
    }
    return self;
}



+ (instancetype)sharedDataManager {
    static LOTDataStore *_sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataManager = [[LOTDataStore alloc] init];
    });
    
    return _sharedDataManager;
}

-(void)addInstagramData:(NSArray*)someObject{
    
    [self.instaData addObject:someObject];
}

-(NSArray*)retrieveInstagramData{
    return self.instaData;
}

-(void)addInstaToken:(NSString *)tokenAsString{
    [self.instaToken setString:tokenAsString];
}

-(NSString *)retrieveInstaToken{
    return self.instaToken;
}

@end
