#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "LibA.h"
#import "ClassA.h"
#import "ClassB.h"
#import "CustomViewA.h"

FOUNDATION_EXPORT double LibAVersionNumber;
FOUNDATION_EXPORT const unsigned char LibAVersionString[];

