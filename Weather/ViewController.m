//
//  ViewController.m
//  Weather
//
//  Created by Kevin Ducker Marin on 11/13/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    weatherModel *weatherControl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNotifications];
    weatherControl = [[weatherModel alloc]init];
    [weatherControl getWeather];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getWeatherSuccess:) name:@"getWeatherSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getWeatherError:) name:@"getWeatherError" object:nil];
}

-(void)getWeatherSuccess:(NSNotification *)notification{
    
    _lb_title.text = weatherControl.name;
    _lb_description.text = [NSString stringWithFormat:@"Weather: %@ Description: %@", weatherControl.mainWeather, weatherControl.weatherDescription];
    _lb_latitude.text = [NSString stringWithFormat:@"%@ %f",@"Latitude:",weatherControl.latitude];
    _lb_longitude.text = [NSString stringWithFormat:@"%@ %f",@"Longitude:",weatherControl.longitude];
    _lb_humidity.text = [NSString stringWithFormat:@"%@ %d",@"Humidity:",weatherControl.humidity];
    _lb_seaLvl.text = [NSString stringWithFormat:@"%@ %f",@"Sea level:",weatherControl.sea_level];
    _lb_minTemp.text = [NSString stringWithFormat:@"%@ %f",@"Min temp:",weatherControl.temp_min];
    _lb_maxTemp.text = [NSString stringWithFormat:@"%@ %f",@"Max temp:",weatherControl.temp_max];
    _lb_sunrise.text = [NSString stringWithFormat:@"%@ %d",@"Sunrise:",weatherControl.sunrise];
    _lb_sunset.text = [NSString stringWithFormat:@"%@ %d",@"Sunset:",weatherControl.sunset];
    _lb_windDir.text = [NSString stringWithFormat:@"%@ %d",@"Wind direction:",weatherControl.windDeg];
    _lb_windSpeed.text = [NSString stringWithFormat:@"%@ %f",@"Wind speed",weatherControl.windSpeed];
    
}
-(void)getWeatherError:(NSNotification *)notification{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
