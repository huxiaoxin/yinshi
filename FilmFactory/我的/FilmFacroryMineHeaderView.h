//
//  FilmFacroryMineHeaderView.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FilmFacroryMineHeaderViewDelegate <NSObject>

-(void)FilmFacroryMineHeaderViewChangeInfo;

@end
@interface FilmFacroryMineHeaderView : UIView
@property(nonatomic,weak) id <FilmFacroryMineHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
