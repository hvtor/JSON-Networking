//
//  ViewController.m
//  Shawteh
//
//  Created by Hemant V. Torsekar on 2015-04-17.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _APILogin = @"o_1s5r2bdu1p";
    _APIKey = @"R_71dc764e426a4e2a96c4e3c194c47b6a";
    _longURL = @"http://rypress.com/tutorials/objective-c/index";
    _requestString = [NSString stringWithFormat:@"http://api.bit.ly/shorten?version=2.0.1&longUrl=%@&login=%@&apiKey=%@&format=json",_longURL, _APILogin, _APIKey];
    
    NSURL *requestURL = [NSURL URLWithString:_requestString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:requestURL
            completionHandler:^(NSData *data, NSURLResponse *response,
            NSError *error){
                //handle errors
                NSError *e = nil;
                NSDictionary *bitlyJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
                NSLog(@"%@", bitlyJSON);
                if (!error) {
                    NSDictionary *results = [bitlyJSON objectForKey:@"results"];
                    NSDictionary *resultsForLongURL = [results objectForKey:_longURL];
                    NSString *shortURL = [resultsForLongURL objectForKey:@"shortUrl"];
                    NSLog(@"The short URL = %@", shortURL);
                }
                // Parse JSON
                // return JSON value
            }]resume];
        sleep(60);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
