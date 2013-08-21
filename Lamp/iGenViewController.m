//
//  iGenViewController.m
//  Lamp
//
//  Created by iGen on 17.03.13.
//  Copyright (c) 2013 iGen. All rights reserved.
//

#import "iGenViewController.h"

@interface iGenViewController ()

@end

@implementation iGenViewController

//  Инициализация системы
bool DebugMode=YES;
bool LightMode=NO;



- (void)viewDidLoad
{
    
    image_lamp=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhone4_1.png"]];
    [self.view addSubview:image_lamp];
    [image_lamp setCenter: CGPointMake (150, 220)];
    
    UITapGestureRecognizer *myTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapEvent:)];
    image_lamp.userInteractionEnabled = YES;
    [image_lamp addGestureRecognizer:myTapGesture];
    [myTapGesture release];
    
    
    


    
    
    
    
    //image_fire=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fire.png"]];
    //[self.view addSubview:image_fire];
    //[image_fire setCenter: CGPointMake (156, 325)];
    
    //[image_fire setHidden:YES];
    
    [self lamp_action :!LightMode];
    
    
    NSArray * imageArray  = [[NSArray alloc] initWithObjects:
                             [UIImage imageNamed:@"fire_0.gif"],
                             [UIImage imageNamed:@"fire_1.gif"],
                             [UIImage imageNamed:@"fire_2.gif"],
                             [UIImage imageNamed:@"fire_3.gif"],
                             [UIImage imageNamed:@"fire_4.gif"],
                             [UIImage imageNamed:@"fire_5.gif"],
                             [UIImage imageNamed:@"fire_6.gif"],
                             [UIImage imageNamed:@"fire_7.gif"],
                             [UIImage imageNamed:@"fire_8.gif"],
                             [UIImage imageNamed:@"fire_9.gif"],
                             nil];
	image_fire = [[UIImageView alloc] initWithFrame:CGRectMake(130, 170, 140, 170)];
	image_fire.animationImages = imageArray;
	image_fire.animationDuration = 1.1;
	image_fire.contentMode = UIViewContentModeBottomLeft;
	[self.view addSubview:image_fire];
	[image_fire startAnimating];
    //[self lamp_action :!LightMode];
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
}


-(void)gestureTapEvent:(UITapGestureRecognizer *)gesture {
    if (DebugMode) {NSLog(@"Tap event, %d", 0);}
    [self lamp_action :!LightMode];
}

- (void) lamp_action :(BOOL)OnStatus{
    AVCaptureDevice * captDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (OnStatus) { 
        [captDevice lockForConfiguration:nil];
        [captDevice setTorchMode:AVCaptureTorchModeOn];
        [captDevice unlockForConfiguration];
        [image_fire setHidden:NO];
    }
    else {
        [captDevice lockForConfiguration:nil];
        [captDevice setTorchMode:AVCaptureTorchModeOff];
        [captDevice unlockForConfiguration];
        [image_fire setHidden:YES];
    }
    LightMode=!LightMode;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
