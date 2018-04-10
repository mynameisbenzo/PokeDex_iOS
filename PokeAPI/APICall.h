//
//  APICall.h
//  PokeAPI
//
//  Created by Lorenzo Hernandez III on 4/3/18.
//  Copyright © 2018 Lorenzo Hernandez III. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol APICallDelegate <NSObject>
-(void)send: (NSData*)data;
@end

@interface APICall : NSObject

@property(nonatomic, weak) id <APICallDelegate> delegate;

-(void)URL_REQUEST_PICTURE: (NSString*)url;

@end
