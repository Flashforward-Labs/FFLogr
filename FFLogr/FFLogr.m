//
//  FFLogr.m
//  FFLogr
//
//  Created by Erik Weiss on 6/27/13.
//  Copyright (c) 2013 Flashforward Labs. All rights reserved.
//

#import "FFLogr.h"

@interface FFLogr ()

@property (nonatomic, strong) NSMutableDictionary *loggers;

@end

@implementation FFLogr

+(id)sharedInstance
{
    static dispatch_once_t pred;
    static FFLogr *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[FFLogr alloc] init];
    });
    return sharedInstance;
}

-(id)init{
    if (self = [super init]){
        self.loggers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)log:(NSString *)logger level:(int)level format:(NSString *)format, ...
{
    int loggerLevel = [self.loggers[logger] integerValue];
    if(loggerLevel & level) {
        va_list args;
        va_start(args, format);
        NSString *formattedMessage = [[NSString alloc] initWithFormat:format arguments:args];
        NSLog(@"%@", formattedMessage);
    }
}

-(void)setLevel:(int)level forLogger:(NSString *)logger
{
    self.loggers[logger] = [NSNumber numberWithInt:level];
}

@end
