//
//  BaseWebController.m
//  GuXian
//
//  Created by menthu on 2020/5/3.
//  Copyright © 2020 menthu. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "BaseWebController.h"
#import "Masonry.h"
#import "CommonHead.h"

//https://www.jianshu.com/p/5cf0d241ae12

@interface BaseWebController ()

@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, weak) UIProgressView *progressView;

@end

@implementation BaseWebController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == _webView) {
        NSLog(@"网页加载进度 = %f",_webView.estimatedProgress);
        self.progressView.progress = _webView.estimatedProgress;
        if (_webView.estimatedProgress >= 1.0f) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.progress = 0;
                self.progressView.hidden = YES;
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

- (WKWebView *)webView{
    if (_webView == nil) {
        // 创建设置对象
        WKPreferences *preference = [[WKPreferences alloc]init];
        //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
        preference.minimumFontSize = 0;
        //设置是否支持javaScript 默认是支持的
        preference.javaScriptEnabled = YES;
        // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
        preference.javaScriptCanOpenWindowsAutomatically = YES;
        
        //创建网页配置对象
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.preferences = preference;
        // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
        config.allowsInlineMediaPlayback = YES;
        //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
        config.requiresUserActionForMediaPlayback = YES;
        //设置是否允许画中画技术 在特定设备上有效
        config.allowsPictureInPictureMediaPlayback = YES;
        //设置请求的User-Agent信息中应用程序名称 iOS9后可用
        config.applicationNameForUserAgent = @"ChinaDailyForiPad";
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) configuration:config];
        //添加监测网页加载进度的观察者
        [webView addObserver:self
                  forKeyPath:@"estimatedProgress"
                     options:0
                     context:nil];
        [self.view addSubview:(_webView = webView)];
        [webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        [self addProgressView];
    }
    return _webView;
}

- (void)addProgressView{
    if (_progressView == nil) {
        UIProgressView *progressView = [[UIProgressView alloc] init];
        progressView.progressTintColor = RGBA(233, 233, 233, 1);//进度颜色
        progressView.trackTintColor = UIColor.lightGrayColor;//整体颜色
        [self.view addSubview:(_progressView = progressView)];
        [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(2);
        }];
    }
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.webView.frame = self.view.bounds;
}

- (void)setLoadUrl:(NSString *)loadUrl{
    _loadUrl = loadUrl;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loadUrl]]];
}

@end
