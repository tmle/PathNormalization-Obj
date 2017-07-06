//
//  RemoveDot.m
//  MyFitnessPal-ObjC
//
//  Created by Thinh Le on 2017-07-01.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import "RemoveDot.h"

@implementation RemoveDot

- (NSMutableString *)removeDot3:(NSMutableString *)path {
    
    [path replaceOccurrencesOfString:@"/../" withString:@"/" options:0 range:NSMakeRange(0,path.length)];
    [path replaceOccurrencesOfString:@"/./" withString:@"/" options:0 range:NSMakeRange(0,path.length)];
    [path replaceOccurrencesOfString:@"../" withString:@"/" options:0 range:NSMakeRange(0,path.length)];
    [path replaceOccurrencesOfString:@"./" withString:@"/" options:0 range:NSMakeRange(0,path.length)];

    //NSLog(@"newPath3  = %@\n", newPath);
    
    return path;
    
}

- (NSMutableString *)removeDot2:(NSMutableString *)path {
    int i;
    int pathLen = (int)path.length;
    //NSLog(@"path      = %@\n", path);
    
    // it checks for patterns: './' and '../, removes the dot(s) accordingly
    NSMutableString *newPath = [[NSMutableString alloc] initWithCapacity:pathLen];
    int j = 0;
    for (i = 0; i < pathLen; i++) {
        if (([path characterAtIndex:i] == '.') && ([path characterAtIndex:i+1] == '/')) {
            i++;
            if (j==0) {
                // since the very first / is removed, it has to be added back.
                NSString *c = [NSString stringWithFormat:@"%c", '/'];
                [newPath insertString:c atIndex:j];
                j++;
            }
        } else if (([path characterAtIndex:i] == '.') && ([path characterAtIndex:i+1] == '.') && ([path characterAtIndex:i+2] == '/')) {
            i++; i++;
            if (j==0) {
                // since the very first / is removed, it has to be added back.
                NSString *c = [NSString stringWithFormat:@"%c", '/'];
                [newPath insertString:c atIndex:j];
                j++;
            }
        } else {
            NSString *c = [NSString stringWithFormat:@"%c", [path characterAtIndex:i]];
            [newPath insertString:c atIndex:j];
            j++;
        }
    }
    //NSLog(@"newPath2  = %@\n", newPath);
    
    return newPath;

}

- (NSMutableString *)removeDot1:(NSMutableString *)path {
    int i;
    int pathLen = (int)path.length;

    // remove the '.'
    //NSLog(@"path      = %@", path);
    NSMutableString *newPath = [[NSMutableString alloc] initWithCapacity:pathLen];
    int j = 0;
    for (i = 0; i < pathLen; i++) {
        if ([path characterAtIndex:i] != '.') {
            NSString *c  = [NSString stringWithFormat:@"%c", [path characterAtIndex:i]];
            [newPath insertString:c atIndex:j];
            j++;
        }
    }
    //NSLog(@"tempPath1 = %@", newPath);
    
    // remove the '/' of the '//'
    j = 0;
    int newPathLen = (int)newPath.length;
    NSMutableString *nextPath = [[NSMutableString alloc] initWithCapacity:newPathLen];
    for (i = 0; i<newPathLen; i++) {
        if (([newPath characterAtIndex:i] == '/') && ([newPath characterAtIndex:i+1] == '/')) {
        } else {
            NSString *c = [NSString stringWithFormat:@"%c", [newPath characterAtIndex:i]];
            [nextPath insertString:c atIndex:j];
            j++;
        }
    }
    //NSLog(@"newPath1  = %@\n", nextPath); // path is reused the second time.
    
    return nextPath;

}

@end
