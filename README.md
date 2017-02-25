CustomPromptBox

自定制的提示框

主要在PromptBoxView.h .m文件

/*
 Updated upstream


* titleString   展示的文字
    *
* titleColor   文字的颜色
* number     透明du 0~1
    *
* XYZ     展示view 的位置
* promptViewColor  展示view 的颜色
    *
* time  动画时长
    */

```objective-c
-(instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)titleString andTitleColor:(UIColor *)titleColor 

andPromptViewAlpha:(CGFloat)number addpromptViewY:(CGFloat )XYZ 

andpromptViewColor:(UIColor *)promptViewColor andAnimateShowTime:(NSInteger)time;

```

添加方法

```objective-c
PromptBoxView *prom = [[PromptBoxView  alloc] initWithFrame:self.view.bounds WithTitle:nil andTitleColor:nil andPromptViewAlpha:0.2 addpromptViewY:0 andpromptViewColor:nil andAnimateShowTime:2];
[[UIApplication sharedApplication].keyWindow addSubview:prom];
```

