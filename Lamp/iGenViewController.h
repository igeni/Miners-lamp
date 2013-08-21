//
//  iGenViewController.h
//  Lamp
//
//  Created by iGen on 17.03.13.
//  Copyright (c) 2013 iGen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface iGenViewController : UIViewController {
    UIImageView *image_lamp;
    UIImageView *image_fire;
    
}

-(void)gestureTapEvent:(UITapGestureRecognizer *)gesture;

@end
