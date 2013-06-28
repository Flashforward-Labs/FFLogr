//
//  FFLogr.h
//  FFLogr
//
//  Created by Erik Weiss on 6/27/13.
//  Copyright (c) 2013 Flashforward Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOG_FLAG_ERROR    (1 << 0)  // 0...0001
#define LOG_FLAG_WARN     (1 << 1)  // 0...0010
#define LOG_FLAG_DEBUG     (1 << 2) // 0...0100

#define LOG_LEVEL_OFF     0
#define LOG_LEVEL_ERROR   (LOG_FLAG_ERROR)                                      // 0...0001
#define LOG_LEVEL_WARN    (LOG_FLAG_ERROR | LOG_FLAG_WARN)                      // 0...0011
#define LOG_LEVEL_DEBUG    (LOG_FLAG_ERROR | LOG_FLAG_WARN | LOG_FLAG_DEBUG)    // 0...0111

#define FFLog(lgr, lvl, fmt, ...) [[FFLogr sharedInstance] log:lgr level:lvl format:(fmt), ##__VA_ARGS__];
#define FFLogV(lgr, lvl, fmt, ...) [[FFLogr sharedInstance] log:lgr level:lvl format:(@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__];

#define FFLogError(lgr, fmt, ...) FFLog(lgr, LOG_FLAG_ERROR, fmt, ##__VA_ARGS__)
#define FFLogVError(lgr, fmt, ...) FFLogV(lgr, LOG_FLAG_ERROR, fmt, ##__VA_ARGS__)
#define FFLogWarn(lgr, fmt, ...) FFLog(lgr, LOG_FLAG_WARN, fmt, ##__VA_ARGS__)
#define FFLogVWarn(lgr, fmt, ...) FFLogV(lgr, LOG_FLAG_WARN, fmt, ##__VA_ARGS__)
#define FFLogDebug(lgr, fmt, ...) FFLog(lgr, LOG_FLAG_DEBUG, fmt, ##__VA_ARGS__)
#define FFLogVDebug(lgr, fmt, ...) FFLogV(lgr,LOG_FLAG_DEBUG, fmt, ##__VA_ARGS__)

@interface FFLogr : NSObject

+(id)sharedInstance;

-(void)log:(NSString *)logger level:(int)level format:(NSString *)format, ...;

-(void)setLevel:(int)level forLogger:(NSString *)logger;

@end
