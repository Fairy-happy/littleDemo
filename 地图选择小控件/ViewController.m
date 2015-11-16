//
//  ViewController.m
//  地图选择小控件
//
//  Created by fairy on 15/11/16.
//  Copyright © 2015年 fairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)selectClicked:(id)sender {
    //系统自带地图
    UIAlertController *mapselecte = [UIAlertController alertControllerWithTitle:nil message:@"选择地图" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action =[UIAlertAction actionWithTitle:@"系统自带地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *string = @"http://maps.apple.com/maps?saddr=39.98,116.31&daddr=41.59,117.40";
        [[UIApplication sharedApplication]  openURL:[NSURL URLWithString:string]];
    }];
    [mapselecte addAction:action];
    
    //百度地图
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"baidumap://map/"]])
    {
        UIAlertAction *baiduaction =[UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *stringURL = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%f,%f&coord_type=gcj02&src=" ,40.0,116.0];
            NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [[UIApplication sharedApplication] openURL:mapUrl];
        }];
        
        [mapselecte addAction:baiduaction];
        
    }else NSLog(@"未安装");
    
    //高德地图
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"iosamap://"]])
    {
        UIAlertAction *baiduaction =[UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *stringURL = [NSString stringWithFormat:@"iosamap://navi?sourceApplication=当前地址&backScheme=applicationScheme&poiname=fangheng&poiid=BGVIS&lat=%f&lon=%f&dev=0&style=3", 40.0, 116.0];
            
            NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            [[UIApplication sharedApplication] openURL:mapUrl];
            
        }];
        
        [mapselecte addAction:baiduaction];
    }else NSLog(@"未安装");
    
    //腾讯地图
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"qqmap://map"]])
    {
        
        UIAlertAction *tenxunaction =[UIAlertAction actionWithTitle:@"腾讯地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *stringURL = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&&fromcoord=36.547901,104.258354&tocoord=%f,%f&policy=1" ,40.0,116.0];
            NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [[UIApplication sharedApplication] openURL:mapUrl];
            
        }];
        
        [mapselecte addAction:tenxunaction];
    }else NSLog(@"腾讯地图 未安装");
    //取消
    UIAlertAction *cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [mapselecte addAction:cancelaction];
    [self presentViewController:mapselecte animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
