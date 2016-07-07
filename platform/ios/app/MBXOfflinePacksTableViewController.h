#import <UIKit/UIKit.h>

@class MGLMapView;

@interface MBXOfflinePacksTableViewController : UITableViewController

@property (nonatomic, weak) MGLMapView *mapView;

@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic) NSUInteger iterations;
@property (nonatomic) uint64_t totalBytes;
@property (nonatomic) NSTimeInterval totalSeconds;

@end
