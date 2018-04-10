//
//  APICall.m
//  PokeAPI
//
//  Created by Lorenzo Hernandez III on 4/3/18.
//  Copyright © 2018 Lorenzo Hernandez III. All rights reserved.
//

#import "APICall.h"

@implementation APICall

@synthesize delegate;

-(void) URL_REQUEST_PICTURE:(NSString *)url{
    NSURL *callThis = [NSURL URLWithString:url];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithURL:callThis completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            [delegate send:data];
            NSLog(@"bam");
        });
    }];
    [dataTask resume];
}

@end
