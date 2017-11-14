//
//  weatherModel.m
//  Weather
//
//  Created by Kevin Ducker Marin on 11/13/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

#import "weatherModel.h"

@implementation weatherModel

- (id)init {
    self = [super init];
    
    if (self) {
        _name = @"";
        _latitude = 0.0;
        _longitude =0.0;
        _humidity = 0;
        _sea_level = 0.0;
        _temp_max = 0.0;
        _temp_min = 0.0;
        _sunrise = 0;
        _sunset = 0;
        _weatherDescription = @"";
        _mainWeather = @"";
        _windDeg = 0;
        _windSpeed = 0.0;
    }
    
    return self;
    
}
-(id)init:(NSDictionary *) data{
    self = [super init];
    if (self) {
    _name = [data objectForKey:@"name"];
    _latitude = [[[data objectForKey:@"coord"] objectForKey:@"lat"] doubleValue];
    _longitude = [[[data objectForKey:@"coord"] objectForKey:@"lon"] doubleValue];
    _humidity = [[[data objectForKey:@"main"] objectForKey:@"humidity"] intValue];
    _sea_level = [[[data objectForKey:@"main"] objectForKey:@"sea_level"] doubleValue];
    _temp_max = [[[data objectForKey:@"main"] objectForKey:@"temp_max"] doubleValue];
    _temp_min = [[[data objectForKey:@"main"] objectForKey:@"temp_min"] doubleValue];
    _sunrise = [[[data objectForKey:@"sys"] objectForKey:@"sunrise"] intValue];
    _sunset = [[[data objectForKey:@"sys"] objectForKey:@"sunset"] intValue];
    _weatherDescription = [[[data objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"description"];
    _mainWeather = [[[data objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"main"];
    _windDeg = [[[data objectForKey:@"wind"] objectForKey:@"deg"] intValue];
    _windSpeed = [[[data objectForKey:@"wind"] objectForKey:@"speed"] doubleValue];
    }
    return self;
}

-(void)getWeather{
    NSString *url= @"http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1";
    static AFHTTPRequestOperationManager *manager;
    
    if (manager == nil) {
        manager = [AFHTTPRequestOperationManager manager];
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [manager.requestSerializer setTimeoutInterval:30];
    }
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject ) {
        NSLog(@"Response - %@", responseObject);
        NSDictionary *responseWeather = [[NSDictionary alloc]initWithDictionary:responseObject];
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //[self init:responseWeather];
            if ([self init:responseWeather]) {
                if(_delegate != nil){
                    [_delegate successWeatherModel];
                }
            }
        }
        else
        {
            NSLog(@"Error");
            [_delegate errorWeatherModel];
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Fail");
        [_delegate errorWeatherModel];
    }
     ];
}

@end
