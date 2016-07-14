//
//  GoodsTableViewCell.m
//  LeTian
//
//  Created by jobs on 16/7/13.
//  Copyright © 2016年 jobs. All rights reserved.
//

#import "GoodsTableViewCell.h"

@implementation GoodsTableViewCell


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)setShowModel:(showModel *)showModel{
    _showModel = showModel;
    
    if (_showModel) {
        
        UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 160)];
        //    backView.backgroundColor=klogoColor;
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, backView.frame.size.width, 140)];
        imageView.backgroundColor=[UIColor redColor];
        //    imageView.image=[UIImage imageNamed:@"me"];
        //    NSLog(@"url%@",showModel.picUrl);
        NSURL *imageUrl=[NSURL URLWithString:showModel.picUrl];
        [imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"load"]];
        
        self.title=[[UILabel alloc]init];
        self.title.frame=CGRectMake(backView.frame.origin.x, imageView.frame.origin.y+imageView.frame.size.height+kHeight(10), kScreenWidth-20, 30);
        self.title.textAlignment = NSTextAlignmentCenter;
        //    title.backgroundColor=[UIColor greenColor];
        self.title.text=showModel.title;
        
        UILabel *description=[[UILabel alloc]init];
        description.frame=CGRectMake(backView.frame.origin.x, self.title.frame.origin.y+self.title.frame.size.height, kScreenWidth-20, 30);
        description.textColor=[UIColor grayColor];
        //    description.backgroundColor=[UIColor brownColor];
        description.text=showModel.describe;
        NSLog(@"%@",showModel.describe);
        
        [self addSubview:backView];
        [backView addSubview:imageView];
        [backView addSubview:self.title];
//        [backView addSubview:description];
        
        
        
        
        
        
    }
    
    
    
}




@end
