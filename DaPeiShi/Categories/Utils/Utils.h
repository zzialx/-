//
//  Utils.h
//  SuiYangApp
//
//  Created by admin on 2017/11/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject


+(NSString *)stringWithObject:(id)obj;

//字典转json格式字符串
+(NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (BOOL)isAppInReview;
+ (BOOL)validateZipCode:(NSString *)zipCode;

//! 是否是有效的字典
+ (BOOL)isValidDictionary:(id)object;

//! 是否是有效的数组
+ (BOOL)isValidArray:(id)object;

//! 是否是有效的字符串
+ (BOOL)isValidString:(id)object;

//! 是否是有效的Number
+ (BOOL)isValidNumber:(id)object;

//!获取当前时间
+(NSString*)getCurrentTimes;


typedef NS_ENUM(NSUInteger, BinaryUnit) {b, B, KB, MB, GB, TB, PB, ZB, YB};



+ (void)rotateToPortrait;
+ (void)rotateToLandscape;

//! 秒转换成(时:)分:秒
+ (NSString *)timeFormatWithSeconds:(NSTimeInterval)seconds;

+ (BOOL)archiveObject:(id)object toTempWithFilename:(NSString *)filename;
+ (id)unarchiveObjectFromTempWithFilename:(NSString *)filename;
+ (BOOL)removeArchiveobjectWithFilename:(NSString *)filename;

+ (NSString *)versionCode;

//判断身份证号是否合法
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

//获取当前的页面
+ (UIViewController *)getCurrentVC;
+ (CGFloat)getTextHeightWithFontSize:(CGFloat)fonsize string:(NSString *)text width:(CGFloat)width;
+(CGFloat)getTextWidthWithFontSize:(CGFloat)size string:(NSString *)text height:(CGFloat)height;
+ (void) addClickEvent:(id)target action:(SEL)action owner:(UIView *)view;//添加单击手势
+ (BOOL)isMobileNumber:(NSString *)mobileNum;//是否是电话号码
//更新本地数据
+ (void)UpdateData:(NSString *)dataStr Key:(NSString * )key;
+(NSMutableAttributedString *)setLabelSubtextColor:(UIColor *)color subString:(NSString *)subString string:(NSString *)string;
+(NSMutableAttributedString *)setLabelTextColor:(UIColor *)color textFont:(UIFont*)font subString:(NSString *)subString string:(NSString *)string;
//获取本地数据
+ (id)getData:(NSString *)key;
//设置动态行高
+(CGFloat)calculateCellHeight:(NSString *)text;
+(NSString *)getStringEmptyOrNot:(NSString *)string; //判断字符串是否为空

//判断密码格式是否是字母和数字组合
+ (BOOL)checkPassword:(NSString *) password;
//字符串转日期格式
+(NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;
//时间戳转时间
+(NSString *)getDateStringWithTimeStr:(NSString *)str;

+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format;

+(NSString *)getStringNullNumberOrNot:(id)string;
/**
 设置字间距
 
 @param text 文本内容
 @param color 文本字体颜色
 @param space 字间距大小
 @return 返回文本
 */
+(NSAttributedString *)getAttributedText:(NSString *)text color:(UIColor *)color spacing:(CGFloat)space;

+(BOOL)checkIdentityCard:(NSString *)cardId; //判断身份证格式


/**
 对tableview进行版本处理
 
 @param tableView 要处理的对象
 */
+(void)tableViewWithSystemVersion:(UITableView *)tableView;

//json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 从字符串中截取出图片数组
 
 @param string 字符串
 @return 图片数组
 */
+(NSArray *)getArrayFromString:(NSString *)string;
+(NSString *)convertToJsonData:(NSDictionary *)dict;//字典转json

+ (void)callPhone:(NSString *)phonenumber;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;//16进制颜色

@end

