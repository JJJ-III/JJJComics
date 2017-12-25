//
//  JJJTest01.h
//  多线程下载实验
//
//  Created by jinjiajian on 2017/8/29.
//  Copyright © 2017年 jjj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TZAssetModelMediaTypePhoto = 0,
    TZAssetModelMediaTypeLivePhoto,
    TZAssetModelMediaTypePhotoGif,
    TZAssetModelMediaTypeVideo,
    TZAssetModelMediaTypeAudio,
    /** jjj自增 url类型的图片 */
    TZAssetModelMediaTypeImageUrl
} TZAssetModelMediaType;


@interface JJJTest01 : UIView

@property (nonatomic,strong)NSString *gakki;

- (void)sayWorld;

- (void)say;

@end
