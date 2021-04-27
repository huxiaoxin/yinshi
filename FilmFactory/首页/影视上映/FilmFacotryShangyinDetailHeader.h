//
//  FilmFacotryShangyinDetailHeader.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import <UIKit/UIKit.h>
#import "FilmFacotryHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FilmFacotryShangyinDetailHeader : UIView
-(instancetype)initWithFrame:(CGRect)frame WithConfig:(FilmFacotryHomeModel *)filmModel;
-(CGFloat)FilmFacotryShangyinDetailHeaderHeight;

@end

NS_ASSUME_NONNULL_END
