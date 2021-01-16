//
//  NSString+MILO.m
//  MiloFoundation
//
//  Created by candylee on 2017/7/31.
//  Copyright © 2017年 lenk. All rights reserved.
//

#import "NSString+MILO.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString  (MILO)


+(NSString *)convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSInteger)yh_getAPPVersionNumber
{
    NSString *versionString = [kBundleVersionString stringByReplacingOccurrencesOfString:@"." withString:@""];
    return [versionString integerValue];
}


- (NSString *)yh_md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(NSString *)yh_checkQiniuImageUrlAppendWebp
{
    if ([self rangeOfString:@"?imageView"].location == NSNotFound
        && [self rangeOfString:@"?imageMogr"].location == NSNotFound) {
        return self;
    }
        return self;
}

- (CGFloat)yh_priceValue
{
    return [[self stringByReplacingOccurrencesOfString:@"," withString:@""] floatValue];
}


- (BOOL)yh_isEmptyAfterTrimmingWhitespaceAndNewlineCharacters
{
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0;
}


- (NSString *)yh_stringByTrimmingWhitespaceAndNewlineCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (NSString *)URLEncodedStringWithCFStringEncoding:(CFStringEncoding)encoding
{
    return  CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, CFSTR("￼=,!$&'()*+;@?\n\"<>#\t :/"), encoding));
}


- (NSString *)yh_URLEncodedString
{
    return [self URLEncodedStringWithCFStringEncoding:kCFStringEncodingUTF8];
}


+ (NSString *)stringWithDate:(NSDate *)date dateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = nil;
    if (format == nil) {
        dateFormat = @"yyyy-MM-dd HH: mm: ss";
    } else {
        dateFormat = format;
    }
    formatter.dateFormat = dateFormat;
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)yh_CheckStringFormatter:(id)string
{
    if (IsNilOrNull(string)) {
        return @"";
    }
    
    if ([string isKindOfClass:[NSString class]]) {
        return string;
    }
    
    if ([string isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)string stringValue];
    }
    
    return @"";
}
// 是否是邮箱
- (BOOL)yh_conformsToEmailFormat
{
    return [self isMatchedByRegex:@".+@.+\\..+"];
}

- (BOOL)yh_conformsToMobileFormat
{
    return [self isMatchedByRegex:@"^1[3|4|5|6|7|8|9][0-9]\\d{8}$"];
}
#pragma mark--邮政编码校验
- (BOOL)validateZipCode{
    NSString *regex = @"[0-9]\\d{5}(?!\\d)";
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (([pred evaluateWithObject:self] == YES)){
        return YES;
    }else{
        return NO;
    }
}
// 长度是否在一个范围之内
- (BOOL)yh_isLenghGreaterThanOrEqual:(NSInteger)minimum lessThanOrEqual:(NSInteger)maximum
{
    return ([self length] >= minimum) && ([self length] <= maximum);
}


- (NSRange)yh_firstRangeOfURLSubstringi
{
    static NSDataDetector *dataDetector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataDetector = [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypeLink | NSTextCheckingTypeLink)
                                                       error:nil];
    });
    
    NSRange range = [dataDetector rangeOfFirstMatchInString:self
                                                    options:0
                                                      range:NSMakeRange(0, [self length])];
    return range;
}


- (NSString *)yh_firstURLSubstring
{
    NSRange range = [self yh_firstRangeOfURLSubstringi];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    return [self substringWithRange:range];
}


- (NSArray *)yh_URLSubstrings
{
    static NSDataDetector *dataDetector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataDetector = [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypeLink | NSTextCheckingTypeLink)
                                                       error:nil];
    });
    
    NSArray *matches = [dataDetector matchesInString:self
                                             options:0
                                               range:NSMakeRange(0, [self length])];
    NSMutableArray *substrings = [NSMutableArray arrayWithCapacity:[matches count]];
    for (NSTextCheckingResult *result in matches) {
        [substrings addObject:[result.URL absoluteString]];
    }
    return [NSArray arrayWithArray:substrings];
}


- (NSString *)yh_firstMatchUsingRegularExpression:(NSRegularExpression *)regularExpression
{
    NSRange range = [regularExpression rangeOfFirstMatchInString:self
                                                         options:0
                                                           range:NSMakeRange(0, [self length])];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    return [self substringWithRange:range];
}


- (NSString *)yh_firstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern
{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionPattern
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:nil];
    return [self yh_firstMatchUsingRegularExpression:regularExpression];
}


- (BOOL)yh_matchesRegularExpressionPattern:(NSString *)regularExpressionPattern
{
    NSRange fullRange = NSMakeRange(0, [self length]);
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionPattern
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:nil];
    NSRange range = [regularExpression rangeOfFirstMatchInString:self
                                                         options:0
                                                           range:fullRange];
    if (NSEqualRanges(fullRange, range)) {
        return YES;
    }
    return NO;
}


- (NSRange)yh_rangeOfFirstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern
{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionPattern
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:nil];
    NSRange range = [regularExpression rangeOfFirstMatchInString:self
                                                         options:0
                                                           range:NSMakeRange(0, [self length])];
    return range;
}


- (NSString *)yh_stringByReplacingMatchesUsingRegularExpressionPattern:(NSString *)regularExpressionPattern withTemplate:(NSString *)templ
{
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regularExpressionPattern
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:nil];
    NSString *string = [regularExpression stringByReplacingMatchesInString:self
                                                                   options:0
                                                                     range:NSMakeRange(0, [self length])
                                                              withTemplate:templ];
    return string;
}


- (NSDictionary *)yh_URLParameters
{
    NSString *urlString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSRange rangeOfQuestionMark = [urlString rangeOfString:@"?" options:NSBackwardsSearch];
    if (rangeOfQuestionMark.location == NSNotFound) {
        return nil;
    }
    
    NSString *parametersString = [urlString substringFromIndex:(rangeOfQuestionMark.location + 1)];
    NSArray *pairs = [parametersString componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:[pairs count]];
    for (NSString *aPair in pairs) {
        NSArray *keyAndValue = [aPair componentsSeparatedByString:@"="];
        if ([keyAndValue count] == 2) {
            [parameters setObject:keyAndValue[1] forKey:keyAndValue[0]];
        }
    }
    return parameters;
}

- (BOOL)yh_isPureDigital
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    long long val;
    return [scan scanLongLong:&val] && [scan isAtEnd];
}

- (NSString *)yh_splitUrlWithWidth:(NSString *)width height:(NSString *)height mode:(NSString *)mode
{
    CGSize size = CGSizeMake([width integerValue], [height integerValue]);
    //七牛切图规则限制条件
    // !!!处理后的图片w和h参数不能超过9999像素，总像素不得超过24999999（2500w-1）像素。
    // !!!处理前的图片w和h参数不能超过3万像素，总像素不能超过2亿像素。
    CGFloat kMaxSliceWidth = 9999;
    CGFloat kMaxSliceImageSize = 24999999;
    
    //总像素超出限制
    if (size.width * size.height > kMaxSliceImageSize) {
        CGFloat sizeScale = sqrtf(size.width *size.height / kMaxSliceImageSize);
        size.width = floorf(size.width/sizeScale);
        size.height = floorf(size.height/sizeScale);
        
        if (size.width * size.height > kMaxSliceImageSize) {
            size.width = MAX(size.width-1,1);
            size.height = MAX(size.height-1,1);
        }
    }
    
    //长宽超出限制
    if (size.width > kMaxSliceWidth) {
        if (size.height > 0) {
            size.height = floorf(size.height / size.width * kMaxSliceWidth);
        }
        size.width = kMaxSliceWidth;
    }
    if (size.height > kMaxSliceWidth) {
        if (size.width > 0) {
            size.width = floorf(size.width / size.height * kMaxSliceWidth);
        }
        size.height = kMaxSliceWidth;
    }
    
    NSString *newUrlString = [self stringByReplacingOccurrencesOfString:@"{width}" withString:[NSString stringWithFormat:@"%ld", (long)size.width]];
    newUrlString = [newUrlString stringByReplacingOccurrencesOfString:@"{height}" withString:[NSString stringWithFormat:@"%ld", (long)size.height]];
    newUrlString = [newUrlString stringByReplacingOccurrencesOfString:@"{mode}" withString:mode];
    newUrlString = [newUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return newUrlString;
    
    //    return [[[[self stringByReplacingOccurrencesOfString:@"{width}" withString:[NSString stringWithFormat:@"%zd", size.width]] stringByReplacingOccurrencesOfString:@"{height}" withString:[NSString stringWithFormat:@"%zd", size.height]] stringByReplacingOccurrencesOfString:@"{mode}" withString:mode] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSMutableAttributedString *)getColorTime:(NSString *)color font:(CGFloat)font
{
    NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc]initWithString:MakeStringNotNil(self)];
    for (int i = 0; i < self.length; i ++) {
        //这里的小技巧，每次只截取一个字符的范围
        NSString *a = [self substringWithRange:NSMakeRange(i, 1)];
        //判断装有0-9的字符串的数字数组是否包含截取字符串出来的单个字符，从而筛选出符合要求的数字字符的范围NSMakeRange
        if ([number containsObject:a]) {
            [attributeString setAttributes:@{NSForegroundColorAttributeName:[UIColor tr_colorwithHexString:color],NSFontAttributeName:[UIFont systemFontOfSize:font],NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleNone]} range:NSMakeRange(i, 1)];
        }
        
    }
    //完成查找数字，最后将带有字体下划线的字符串显示在UILabel上
    return  attributeString;
    
}
- (NSString *)yh_splitUrlWithWidth:(NSString *)width height:(NSString *)height
{
    return [self yh_splitUrlWithWidth:width height:height mode:@"2"];
}

- (NSMutableAttributedString *)yh_attributedStringWithLineSpacing:(CGFloat)lineSpacing lineBreakMode:(NSLineBreakMode)breakMode textAlignment:(NSTextAlignment)alignment
{
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:breakMode];
    [paragraphStyle setAlignment:alignment];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];
    return attributedStr;
}

-(NSMutableAttributedString *)yh_attributedStringFromStingWithFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing withLineBreakMode:(NSLineBreakMode)breakMode
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:breakMode];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];
    return attributedStr;
}

-(NSMutableAttributedString *)yh_attributedStringFromStingWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing lineBreakMode:(NSLineBreakMode)breakMode alignment:(NSTextAlignment)alignment
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:breakMode];
    [paragraphStyle setAlignment:alignment];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];
    return attributedStr;
}

-(CGSize)yh_boundingRectWithSize:(CGSize)size withTextFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing withLineBreakMode:(NSLineBreakMode)breakMode
{
    NSMutableAttributedString *attributedText = [self yh_attributedStringFromStingWithFont:font
                                                                           withLineSpacing:lineSpacing withLineBreakMode:breakMode];
    CGSize textSize = CGSizeZero;
    if (attributedText.length > 0) {
        textSize = [attributedText boundingRectWithSize:size
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                context:nil].size;
    }
    return textSize;
}

- (CGFloat)yh_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    return ceilf([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.height);
}


- (CGFloat)yh_singleLineWidthWithFont:(UIFont *)font
{
    return ceilf([self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MIN) options:0 attributes:@{NSFontAttributeName:font} context:nil].size.width);
}

- (CGFloat)yh_singleLineHeightWithFont:(UIFont *)font
{
    return ceilf([self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MIN) options:0 attributes:@{NSFontAttributeName:font} context:nil].size.height);
}
- (NSString *)yh_floatString
{
    if ([self isKindOfClass:[NSString class]]) {
        CGFloat tmp = [self floatValue];
        NSString *str = [NSString stringWithFormat:@"%0.2f",tmp];
        return str;
    } else {
        return @"";
    }
}

- (NSString *)yh_anonymousName
{
    if(self.length == 0) {
        return self;
    }
    
    NSString *username = self;
    if ([username length] == 1||[username length] == 2) {
        NSRange range = NSMakeRange([username length]-1, 1);
        username = [username stringByReplacingCharactersInRange:range withString:@"*"];
        return username;
    } else {
        NSRange range = NSMakeRange(1, username.length-2);
        username = [username stringByReplacingCharactersInRange:range withString:@"***"];
    }
    return username;
}

- (NSString *)yh_stringByRemoveRMBSymbol
{
    return [[self stringByReplacingOccurrencesOfString:@"¥" withString:@""] stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    
}

- (NSString *)yh_anonymousMoblie
{
    if(self.length == 0) {
        return self;
    }
    NSString *anonymousStr = self;
    for (int i = 0; i < anonymousStr.length; i ++) {
        if (anonymousStr.length < 3) {
            break;
        }else{
            if (i >=3 && i < 7) {
                NSRange range = NSMakeRange(i, 1);
                anonymousStr = [anonymousStr stringByReplacingCharactersInRange:range withString:@"*"];
            }
        }
    }
    return anonymousStr;
}

- (NSString *)yh_lastPeople
{
    if (MakeStringNotNil(self).length > 0) {
        NSString *lastPeople = @"";
        CGFloat people = [MakeStringNotNil(self) doubleValue];
        if (people >0 && people <=9999) {
            lastPeople = [NSString stringWithFormat:@"%.0f",people];
        } else if (people >=10000 && people <=99999999) {
            lastPeople = [NSString stringWithFormat:@"%.1f万",people/10000];
        } else if (people >=100000000) {
            lastPeople = [NSString stringWithFormat:@"%.1f亿",people/10000000];
        }
        return lastPeople;
    }
    return @"0";
}

- (NSString *)yh_lastMoney
{
    if (self.length > 0) {
    NSString *lastMoney = @"";
    CGFloat money = [MakeStringNotNil(self) doubleValue];
    if (money >0 && money <=9999) {
        lastMoney = [NSString stringWithFormat:@"%.0f元",money];
    } else if (money >=10000 && money <=99999999) {
        lastMoney = [NSString stringWithFormat:@"%.1f万",money/10000];
    } else if (money >=100000000) {
        lastMoney = [NSString stringWithFormat:@"%.1f亿",money/10000000];
    }
    return lastMoney;
    }
    return @"0元";
}

- (NSString *)yh_lastSum
{
    if (self.length > 0) {
        NSString *lastMoney = @"";
        CGFloat money = [MakeStringNotNil(self) doubleValue];
        if (money >0 && money <=9999) {
            lastMoney = [NSString stringWithFormat:@"%.0f",money];
        } else if (money >=10000 && money <=99999999) {
            lastMoney = [NSString stringWithFormat:@"%.1f",money/10000];
        } else if (money >=100000000) {
            lastMoney = [NSString stringWithFormat:@"%.1f",money/10000000];
        }
        return lastMoney;
    }
    return @"0";
}

-(NSString *)yh_replaceString{
    NSString *str = [self stringByReplacingCharactersInRange:NSMakeRange(1, self.length-1) withString:@"**"];
    return str;
}

-(id)SHA256{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
