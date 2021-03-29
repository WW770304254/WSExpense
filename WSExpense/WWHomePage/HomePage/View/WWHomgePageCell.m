//
//  WWHomgePageCell.m
//  WSExpense
//
//  Created by APPLE on 2021/3/17.
//

#import "WWHomgePageCell.h"

@interface WWHomgePageCell ()

@property (nonatomic, strong)UIImageView *headImageView;
@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation WWHomgePageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.contentView.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:0.3];
    
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10*SCRMUTI, 10*SCRMUTI, 60*SCRMUTI, 60*SCRMUTI)];
    [self.contentView addSubview:_headImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80*SCRMUTI, 10*SCRMUTI, 100*SCRMUTI, 20*SCRMUTI)];
    self.titleLabel.text = @"这是标题";
    [self.contentView addSubview:self.titleLabel];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
