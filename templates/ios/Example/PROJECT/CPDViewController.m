//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDViewController.h"

#import <MTRouterComponent/MTRouterComponentHeader.h>
#import <MTModuleServiceComponent/MTModuleServiceComponentHeader.h>

#import <PROJECT/CPDPROJECTServiceProtocol.h>

#import <PROJECT/CPDPROJECTRouterDefine.h>

@interface CPDViewController ()

@end
@implementation CPDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = [NSString stringWithFormat:@"%@",@"PROJECT Demo"];
}


- (IBAction)routerEvent:(id)sender {
    NSLog(@"这里调用模块的路由");
    [self mt_openUrl:kDemoRouterString parameter:@{}];
    
    
}

- (IBAction)serviceEvent:(id)sender {
    NSLog(@"这里调用模块的服务");
    NSError *err;
    __kindof Class<CPDPROJECTServiceProtocol> cls =MTModuleServiceWithProtocol(@protocol(CPDPROJECTServiceProtocol), &err);
      if (!err) {
        NSObject <CPDPROJECTServiceProtocol>* obj = [[cls alloc] init];
          [obj replaceThisMethod];
      }
}

- (void)mt_openUrl:(NSString *)url parameter:(NSDictionary *__nullable)parameters  {
    
    MTRouterUrlRequest* request = [MTRouterUrlRequest instanceWithBuilder:^(MTRouterUrlRequest * _Nonnull builder) {
        builder.url = url;
        builder.paramater = parameters;
    }];
    return [[MTRouterComponent shareInstance] openUrl:request complete:^(MTRouterUrlResponse * _Nonnull urlResponse) {
        
    }];
}


@end
