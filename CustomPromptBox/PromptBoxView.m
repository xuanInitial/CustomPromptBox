//
//  PromptBoxView.m
//  CustomPromptBox
//
//  Created by bihu_Mac on 2017/2/22.
//  Copyright © 2017年 initial. All rights reserved.
//

#import "PromptBoxView.h"

@interface PromptBoxView()

@property (nonatomic, strong) UIView *promptView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *zheZhaoView;
@property (nonatomic, assign)CGFloat promptViewLength;
@property (nonatomic, strong)NSString *titleString;

@property (nonatomic, strong)UIColor *titleColor;

@property (nonatomic, assign)CGFloat promptViewAlpha;//提示框透明度
@property (nonatomic, strong)UIColor *promptViewColor;
@property (nonatomic, assign)CGFloat addpromptViewXYZ;//提示框距上距离

@property (nonatomic ,assign)NSInteger animateShowTime;
@end
@implementation PromptBoxView

-(instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)titleString andTitleColor:(UIColor *)titleColor andPromptViewAlpha:(CGFloat)number addpromptViewY:(CGFloat )XYZ andpromptViewColor:(UIColor *)promptViewColor andAnimateShowTime:(NSInteger)time{
    
    
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        
        //_changdu = [UIScreen mainScreen].bounds.size.width - 140;
        _titleString = titleString;
        _titleColor = titleColor;
        _promptViewAlpha = number;
        _addpromptViewXYZ = XYZ;
        _promptViewColor = promptViewColor;
        
        _animateShowTime = time;
        
        [self createUI];

    }
    return self;
}



-(void)createUI{
    
    
    self.zheZhaoView = [[UIView alloc] init];
    self.zheZhaoView.frame = CGRectMake(0, 0, BHSCREEN_W ,BHSCREEN_H);
    self.zheZhaoView.backgroundColor = [UIColor clearColor];
    self.zheZhaoView.userInteractionEnabled = YES;
    [self addSubview:self.zheZhaoView];
    
    self.promptView = [[UIView alloc]init];
  
    
    self.promptView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.promptViewAlpha == 0?0.2:self.promptViewAlpha];
    
    self.promptView.layer.masksToBounds = YES;
    self.promptView.layer.cornerRadius = 6;
    [self.zheZhaoView addSubview:self.promptView];
    
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = !self.titleString?@"这是一个定制提示框":self.titleString;
    [self.titleLabel setTextColor:self.titleColor==nil? [UIColor whiteColor]:self.titleColor];
    // CGFloat titleHeight = [self getHeightWithTitle:title andFont:15];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.titleLabel.frame = CGRectMake(0, 0, self.promptViewLength== 0?280:self.promptViewLength , 54);
    
    self.titleLabel.numberOfLines = 0;
    [self.promptView addSubview:self.titleLabel];
    
    self.promptView.frame = CGRectMake((BHSCREEN_W -(self.promptViewLength== 0?280:self.promptViewLength))/2, !self.addpromptViewXYZ?(BHSCREEN_H-54)/2:self.addpromptViewXYZ,
                                       self.promptViewLength== 0?280:self.promptViewLength ,54);
    
   
    [self shakeToShow:self.promptView];
    
    
    [self performSelector:@selector(dismissView) withObject:self afterDelay:1];
    
    
}

//动态计算高度
-(CGFloat)getHeightWithTitle:(NSString *)title andFont:(NSInteger)fontsize
{
    CGFloat height = [title boundingRectWithSize:CGSizeMake(self.promptViewLength== 0?280:self.promptViewLength , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil].size.height;
    return height;
}

//显示提示框的动画
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}


- (void)dismissView{
    
    [UIView animateWithDuration:!self.animateShowTime?2:self.animateShowTime animations:^{
        
        self.promptView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        self.promptView = nil;
    }];
    
}



@end
