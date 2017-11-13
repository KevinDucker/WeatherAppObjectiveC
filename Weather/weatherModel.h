//
//  weatherModel.h
//  Weather
//
//  Created by Kevin Ducker Marin on 11/13/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface weatherModel : NSObject

@property (nonatomic,weak) NSString * name;
@property double latitude;
@property double longitude;

@property int humidity;
@property double sea_level;
@property double temp_max;
@property double temp_min;

@property int sunrise;
@property int sunset;
@property (nonatomic,weak) NSString * weatherDescription;
@property (nonatomic,weak) NSString * mainWeather;
@property int windDeg;
@property double windSpeed;

-(void)getWeather;
-(id)init:(NSDictionary *) data;

@end
