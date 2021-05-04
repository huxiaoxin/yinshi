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

#import "QRCodeUIKit.h"
#import "QuickBarCodeGenerator.h"
#import "QuickBarCodeScanController.h"
#import "QuickQRCodeDetector.h"
#import "QuickQRCodeGenerator.h"
#import "QuickQRCodeScanController.h"
#import "QuickQRCodeScanResultHandler.h"
#import "QuickQRCodeScanViewStyle.h"
#import "QuickTextQRResultController.h"

FOUNDATION_EXPORT double QRCodeUIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char QRCodeUIKitVersionString[];

