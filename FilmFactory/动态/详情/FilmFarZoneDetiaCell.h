#import <UIKit/UIKit.h>
#import "FilmFactoryComentModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FilmFarZoneDetiaCellDelegate <NSObject>

-(void)FilmFarZoneDetiaCellDetailTableViewCellWithIndex:(NSInteger)Cellindex FilmFarZoneDetiaCellbtnTag:(NSInteger)btnIndex;

@end
@interface FilmFarZoneDetiaCell : UITableViewCell
@property(nonatomic,strong) FilmFactoryComentModel * comentModel;
@property(nonatomic,weak) id <FilmFarZoneDetiaCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
