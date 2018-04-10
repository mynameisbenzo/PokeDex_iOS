//
//  ViewController.m
//  PokeAPI
//
//  Created by Lorenzo Hernandez III on 4/3/18.
//  Copyright © 2018 Lorenzo Hernandez III. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

@end

@implementation ViewController

#define GREEN [UIColor colorWithRed:(float)153/255 green:(float)202/255 blue:(float)154/255 alpha:1]
#define RED [UIColor colorWithRed:((float)217/255) green:((float)16/255) blue:((float)43/255) alpha:1.0]

@synthesize call = _call;
@synthesize dReturn = _dReturn;
@synthesize dropDownButton = _dropDownButton;
@synthesize screenWidth = _screenWidth;
@synthesize screenHeight = _screenHeight;
@synthesize imageView = _imageView;
@synthesize imageViewContainer = _imageViewContainer;
@synthesize pokeInfo = _pokeInfo;
@synthesize pokeInfoContainer = _pokeInfoContainer;
@synthesize pokeImage = _pokeImage;
@synthesize refresh = _refresh;
@synthesize randomPokeNum = _randomPokeNum;
@synthesize URLCall = _URLCall;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _call = [[APICall alloc] init];
    _dReturn = [[DropDownReturn alloc] init];
    _screenHeight = [[UIScreen mainScreen] bounds].size.height;
    _screenWidth = [[UIScreen mainScreen] bounds].size.width;
    _call.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self setupLayout];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayout{
    //set up imageview and imageview container sizes
    _imageViewContainer = [[UIView alloc] initWithFrame:CGRectMake(20, 20, _screenWidth-40, _screenHeight/2)];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60, _screenWidth-120, _screenHeight/2-80)];
    _pokeInfoContainer = [[UIView alloc] initWithFrame:CGRectMake(20, _screenHeight/2 + 50, _screenWidth-150, _screenHeight/2-125)];
    float pInfoHeight = (float)_pokeInfoContainer.bounds.size.height * 0.8;
    _pokeInfo = [[UITextView alloc] initWithFrame:CGRectMake(40, _screenHeight/2 + 75, _screenWidth-190, pInfoHeight)];
    
    //create drop down button anchor
    _dropDownButton = [_dReturn
                       createDropDownWithX: (_screenWidth-120+60) y: (_screenHeight/2-20) w:35 h:35 view:[self view]];
    [_dropDownButton addTarget:self action:@selector(refreshCall:) forControlEvents:UIControlEventTouchUpInside];
    
    //create refresh button
    _refresh = [[UIButton alloc] initWithFrame:CGRectMake(_screenWidth-120 + 60, _screenHeight/2-20, 35, 35)];
    [_refresh setTitle:@"Refresh" forState:UIControlStateNormal];
    [_refresh setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
//    [_refresh addTarget:self action:@selector(refreshCall:) forControlEvents:UIControlEventTouchUpInside];
    
    [self randomPoke];
    [_call URL_REQUEST_PICTURE:_URLCall];
    
    //set up background and borders
    //main view
    [self.view setBackgroundColor:RED];
    [self.view setNeedsDisplay];
    
    //image view
    [_imageView setBackgroundColor:GREEN];
    _imageView.layer.cornerRadius = 5.0;
    _imageView.layer.borderColor = UIColor.blackColor.CGColor;
    _imageView.layer.borderWidth = 1;
    
    
    
    //image view container
    _imageViewContainer.backgroundColor = UIColor.whiteColor;
    _imageViewContainer.layer.cornerRadius = 5.0;
    _imageViewContainer.layer.borderColor = UIColor.blackColor.CGColor;
    _imageViewContainer.layer.borderWidth = 1;
    
    //poke information text
    _pokeInfo.text = @"ayy";
    _pokeInfo.font = [UIFont fontWithName:@"Pokemon GB" size:12];
    [_pokeInfo setTextColor:UIColor.blackColor];
    [_pokeInfo setBackgroundColor:UIColor.clearColor];
    
    //poke information text container
    [_pokeInfoContainer setBackgroundColor:GREEN];
    _pokeInfoContainer.layer.cornerRadius = 5.0;
    _pokeInfoContainer.layer.borderColor = UIColor.blackColor.CGColor;
    _pokeInfoContainer.layer.borderWidth = 1;
    
    //drop down goes here
    
    //add views to display
    [self.view addSubview:_imageViewContainer];
    [self.view addSubview:_imageView];
    [[self view] addSubview:_dropDownButton];
    [self.view addSubview:_pokeInfoContainer];
    [self.view addSubview:_pokeInfo];
}

// return random number from max allowed pokemon
-(int)randomNum{
    return (int)arc4random_uniform(712);
}

// set random pokenumber to string for random pokepic
-(void)randomPoke{
    _randomPokeNum = [self randomNum];
    if(_randomPokeNum < 10){
        _URLCall = [NSString stringWithFormat:@"url/%d.png", _randomPokeNum];
    }else if(_randomPokeNum < 100){
        _URLCall = [NSString stringWithFormat:@"url/%d.png", _randomPokeNum];
    }else{
        _URLCall = [NSString stringWithFormat:@"url/%d.png", _randomPokeNum];
    }
}

-(void)refreshCall:(UIButton*)sender{
    [_dReturn dropDownCallWithSender:sender];
}

- (void)send:(NSData *)data {
    _pokeImage = nil;
    _pokeImage = [[UIImage alloc] initWithData:data];
    [_imageView setImage:_pokeImage];
}


@end
