//
//  ViewController.m
//  MessageForwardDemo
//
//  Created by reborn on 2020/8/27.
//  Copyright © 2020 reborn. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *p = [[Person alloc] init];
    [p run];
}


@end
