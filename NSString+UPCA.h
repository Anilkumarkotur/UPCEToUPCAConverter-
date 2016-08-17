//
//  NSString+UPCA.h
//  UPCEtoUPCAOBJC
//
//  Created by Anil on 31/03/16.
//  Copyright © 2016 Anil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UPCA)

- (char)firstChar;
- (char)lastChar;
- (NSString *)upcaCode;
- (BOOL)isLastChar:(char)character;

@end
