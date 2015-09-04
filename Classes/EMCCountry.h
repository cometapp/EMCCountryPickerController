//
//  EMCCountry.h
//  EMCCountryPickerController
//
//  Created by Enrico Maria Crisostomo on 18/05/14.
//  Copyright (c) 2014 Enrico M. Crisostomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMCCountry : NSObject

@property (readonly) NSString *countryCode;
@property (readonly) NSString *phoneZone;

+ (instancetype)countryWithCountryCode:(NSString *)code andPhoneZone:(NSString *)zone;
- (instancetype)initWithCountryCode:(NSString *)code andPhoneZone:(NSString *)zone;
- (NSString *)countryName;
- (NSString *)countryNameWithLocale:(NSLocale *)locale;
- (NSString *)countryNameWithLocaleIdentifier:(NSString *)localeIdentifier;
- (UIImage *) getFlag;
@end
