//
//  YLAppCellTableViewCell.m
//  A1爱限免
//
//  Created by qianfeng on 15-7-8.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLAppCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@interface YLAppCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *lastPriceLab;
@property (weak, nonatomic) IBOutlet UILabel *sharesLab;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLab;
@property (weak, nonatomic) IBOutlet UILabel *downLoadsLab;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLab;

@end
@implementation YLAppCellTableViewCell
-(id)initWithTableView:(UITableView *)tableView androw:(NSInteger)row
{
    YLAppCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"appCell"];
    cell.row=row;
    return cell;
}
+(id)appWithTableView:(UITableView *)tableView androw:(NSInteger)row
{
    
    return [[self alloc]initWithTableView:tableView androw:row];
}
-(void)setApp:(YLAppModel *)app
{
    _app=app;
    //self.iconView.image=[UIImage imageNamed:app.]
    
    self.nameLab.text=[NSString stringWithFormat:@"%lu %@",self.row+1,app.name];
    
    //NSURL *url=[NSURL URLWithString:app.iconUrl];
    //NSData * image=[NSData dataWithContentsOfURL:url];
    //self.iconView.image=[UIImage imageWithData:image];
  
    [self.iconView setImageWithURL:[NSURL URLWithString:app.iconUrl]];
    
    // NSLog(@"%@",app.iconUrl);
    self.lastPriceLab.text=app.lastPrice;
    self.sharesLab.text=app.shares;
    self.favoritesLab.text=app.favorites;
    self.downLoadsLab.text=app.downloads;
    self.categoryNameLab.text=app.categoryName;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
