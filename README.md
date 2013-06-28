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

**Verbose Options**

There are verbose options that show the file, function, and line number:

    FFLogVError(lgr, fmt, ...)
    FFLogVWarn(lgr, fmt, ...) 
    FFLogVDebug(lgr, fmt, ...)
    
Output:

    -[FFLAppDelegate application:didFinishLaunchingWithOptions:] [Line 26] Network Error Test 123

License
-----

Copyright (c) 2013 Flashforward Labs, LLC.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
