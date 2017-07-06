//
//  ViewController.m
//  MyFitnessPal-ObjC
//
//  Created by Thinh Le on 2017-07-01.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

#import "ViewController.h"
#import "RemoveDot.h"

#define kTestString1 @"foo/./bar"
#define kTestString2 @"foo/bar/../baz"
#define kTestString3 @"../foo/bar"
#define kTestString4 @"../foo/bar/./foo/../bar"
#define kTestString5 @"./foo/bar/./foo/../bar"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableString *path = [[NSMutableString alloc] initWithString:kTestString4];
    
    RemoveDot *removeDot = [[RemoveDot alloc] init];
    NSLog(@"path = %@", path);
    NSLog(@"normalized path using removeDot1 = %@", [removeDot removeDot1:path]);
    NSLog(@"normalized path using removeDot2 = %@", [removeDot removeDot2:path]);
    NSLog(@"normalized path using removeDot3 = %@", [removeDot removeDot3:path]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
