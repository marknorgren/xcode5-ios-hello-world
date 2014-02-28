//
//  MRKFlashCardViewController.h
//  hello-ios
//
//  Created by Mark Norgren on 2/26/14.
//  Copyright (c) 2014 Mark Norgren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRKFlashCardViewController : UIViewController

@property NSUInteger pageIndex;


-(instancetype) initWithIndex:(NSUInteger)index;

@end
