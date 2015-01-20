//
//  EBSSafeObjects.h
//  EBSSafeObjects
//
//  Created by John Woolsey on 1/18/15.
//  Copyright (c) 2014 ExtremeBytes Software. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface EBSSafeObjects : NSObject

// Safe Object Checks
+ (BOOL)isSafeObject:(id)object;
+ (BOOL)isObject:(id)object safeKindOfClass:(Class)class;

// Non Empty Checks
+ (BOOL)isSafeNonEmptyArray:(id)object;
+ (BOOL)isSafeNonEmptyDate:(id)object;
+ (BOOL)isSafeNonEmptyDictionary:(id)object;
+ (BOOL)isSafeNonEmptyNumber:(id)object;
+ (BOOL)isSafeNonEmptyString:(id)object;

// Equality Checks
+ (BOOL)isArray:(id)firstObject safeEqualToArray:(id)secondObject;
+ (BOOL)isDate:(id)firstObject safeEqualToDate:(id)secondObject;
+ (BOOL)isDictionary:(id)firstObject safeEqualToDictionary:(id)secondObject;
+ (BOOL)isNumber:(id)firstObject safeEqualToNumber:(id)secondObject;
+ (BOOL)isString:(id)firstObject safeEqualToString:(id)secondObject;

// Non Empty Equality Checks
+ (BOOL)isArray:(id)firstObject safeNonEmptyEqualToArray:(id)secondObject;
+ (BOOL)isDate:(id)firstObject safeNonEmptyEqualToDate:(id)secondObject;
+ (BOOL)isDictionary:(id)firstObject safeNonEmptyEqualToDictionary:(id)secondObject;
+ (BOOL)isNumber:(id)firstObject safeNonEmptyEqualToNumber:(id)secondObject;
+ (BOOL)isString:(id)firstObject safeNonEmptyEqualToString:(id)secondObject;

@end
