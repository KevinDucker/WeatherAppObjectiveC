//
//  ViewController.h
//  Weather
//
//  Created by Kevin Ducker Marin on 11/13/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherModel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_description;
@property (weak, nonatomic) IBOutlet UILabel *lb_latitude;
@property (weak, nonatomic) IBOutlet UILabel *lb_longitude;
@property (weak, nonatomic) IBOutlet UILabel *lb_humidity;
@property (weak, nonatomic) IBOutlet UILabel *lb_seaLvl;
@property (weak, nonatomic) IBOutlet UILabel *lb_minTemp;
@property (weak, nonatomic) IBOutlet UILabel *lb_maxTemp;
@property (weak, nonatomic) IBOutlet UILabel *lb_sunrise;
@property (weak, nonatomic) IBOutlet UILabel *lb_sunset;
@property (weak, nonatomic) IBOutlet UILabel *lb_windDir;
@property (weak, nonatomic) IBOutlet UILabel *lb_windSpeed;


@end

