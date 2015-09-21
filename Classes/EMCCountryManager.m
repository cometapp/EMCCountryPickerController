//
//  PMMCountryManager.m
//  Push Money Mobile
//
//  Created by Enrico Maria Crisostomo on 18/05/14.
//  Copyright (c) 2014 Enrico M. Crisostomo. All rights reserved.
//

#import "EMCCountryManager.h"
#import "EMCCountry.h"

@implementation EMCCountryManager
{
    NSArray *countriesArray;
    NSDictionary * countriesDictionnary;
}

static EMCCountryManager *_countryManager;

+ (void)initialize
{
    static BOOL initialized = NO;
    
    if (!initialized)
    {
        initialized = YES;
        _countryManager = [[EMCCountryManager alloc] init];
    }
}

+ (instancetype)countryManager
{
    return _countryManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self loadCountries];
    }
    
    return self;
}

- (void)loadCountries
{
    NSString *countriesPath = [[NSBundle mainBundle] pathForResource:@"countries"
                                                              ofType:@"plist"];
    
    countriesDictionnary = [NSDictionary dictionaryWithContentsOfFile:countriesPath];
    
    if (!countriesDictionnary)
    {
        [NSException raise:@"Countries could not be loaded"
                    format:@"Country array is null: [%@]", countriesDictionnary];
    }
}

- (NSUInteger)numberOfCountries
{
    return [countriesArray count];
}

- (EMCCountry *)countryWithCode:(NSString *)code andPhoneZone:(NSString*) zone
{
    return [EMCCountry countryWithCountryCode:code andPhoneZone:zone];
}

- (EMCCountry *) countryWithCode:(NSString *)code{

    if ([self existsCountryWithCode:code]) {
        return [EMCCountry countryWithCountryCode:code andPhoneZone:[countriesDictionnary objectForKey:code]];
    }
    
    return nil;
}

- (BOOL)existsCountryWithCode:(NSString *)code
{
    return [countriesDictionnary objectForKey:code] != nil;
}

- (NSArray *)countryCodes
{
    return [countriesDictionnary allKeys];
}

- (NSArray *)allCountries
{
    NSMutableArray *countries = [[NSMutableArray alloc] init];
    
    for (NSString *key in countriesDictionnary)
    {
        [countries addObject:[self countryWithCode:key andPhoneZone:[countriesDictionnary objectForKey:key]]];
    }
    
    return countries;
}

@end
