//
//  ColorMacros.h
//  DaPeiShi
//
//  Created by candylee on 2018/12/31.
//  Copyright © 2018年 candy.chen. All rights reserved.
//

#ifndef ColorMacros_h
#define ColorMacros_h

#define REDCOLOR     [UIColor tr_colorwithHexString:@"#FB363F"]
#define THREECOLOR     [UIColor tr_colorwithHexString:@"#333333"]
#define FOURCOLOR     [UIColor tr_colorwithHexString:@"#444444"]
#define SIXCOLOR     [UIColor tr_colorwithHexString:@"#666666"]
#define NICECOLOR     [UIColor tr_colorwithHexString:@"#999999"]
#define LINELOR     [UIColor tr_colorwithHexString:@"#DDDDDD"]
#define TABLECOLOR     [UIColor tr_colorwithHexString:@"#F9F9F9"]

#define UICOLOR_RGBA(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#define SELECT_COLOR UICOLOR_RGBA(251,54,63)

#define KSYS_BGCOLOR    [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1]

#define SW_PLACEHOLDERCOLOR [UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1/1.0]

#define FONT_TEXT(size) [UIFont systemFontOfSize:size];

#endif /* ColorMacros_h */
