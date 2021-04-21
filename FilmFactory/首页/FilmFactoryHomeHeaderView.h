//
//  FilmFactoryHomeHeaderView.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FilmFactoryHomeHeaderViewDelegate <NSObject>

-(void)FilmFactoryHomeHeaderViewMToMoreVc;

@end
@interface FilmFactoryHomeHeaderView : UIView
@property(nonatomic,weak) id <FilmFactoryHomeHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
