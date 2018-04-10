//
//  ViewController.h
//  PokeAPI
//
//  Created by Lorenzo Hernandez III on 4/3/18.
//  Copyright © 2018 Lorenzo Hernandez III. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokeAPI-Swift.h"
#import "APICall.h"

//Mark: API call
@class APICall;

@interface ViewController : UIViewController<APICallDelegate>

@property(strong) APICall *call;
@property(strong) DropDownReturn *dReturn;

//Mark: Drop down

//Mark: Dropdown button
@property(strong) UIButton *dropDownButton;

//Mark: screen references
@property(assign) float screenWidth;
@property(assign) float screenHeight;

//Mark: UI references
@property(strong) UIImageView *imageView;
@property(strong) UIView *imageViewContainer;
@property(strong) UITextView *pokeInfo;
@property(strong) UIView *pokeInfoContainer;
@property(strong) UIImage *pokeImage;
@property(strong) UIButton *refresh;

//Mark: url and random pokemon
@property(assign) int randomPokeNum;
@property(assign) NSString *URLCall;

//set up layout
-(void)setupLayout;

//call another pokemon
-(int)randomNum;
-(void)refreshCall:(UIButton*)sender;
-(void)randomPoke;

@end

