FFLogr - iOS Logging Framework
======

This is a simple logging platform that lets your categorize and add levels to your logging.  
This allows you to make certain logging parts of your code more verbose as you work on it, 
while only displaying error messsages in more mature parts of your code.

Usage
------
**Download**

Download <code>FFLogr.m</code> and <code>FFLogr.h</code> and add them to your project.

**Include**

<code>#import "FFLogr.h"</code> in your <code>Prefix.pch</code> file to make it available everywhere.

**Setup**

Set the minimum level of errors to display for a certain category:

    [[FFLogr sharedInstance] setLevel:LOG_LEVEL_WARN forLogger:@"NetworkLogger"];

**Use**

    FFLogError(@"NetworkLogger", @"Network Error Test %@", @"123");   // Will display
    FFLogWarn(@"NetworkLogger", @"Network Warn Test %@", @"123");     // Will display
    FFLogDebug(@"NetworkLogger", @"Network Debug Test %@", @"123");   // Won't display
