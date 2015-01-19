//
//  EBSSafeObjects.m
//  EBSSafeObjects
//
//  Created by John Woolsey on 1/18/15.
//  Copyright (c) 2014 ExtremeBytes Software. All rights reserved.
//


#import "EBSSafeObjects.h"


@implementation EBSSafeObjects

#pragma mark - Safe Object Checks

/**
 *  Tests if an object is safe, meaning not nil nor null.
 *
 *  @param object The object under test.
 *
 *  @return YES, if the object is neither nil nor null, otherwise NO.
 */
+ (BOOL)isSafeObject:(id)object
{
   return (object != nil && object != [NSNull null]) ? YES : NO;
}


/**
 *  Tests if an object is safe and a kind of the specified class.
 *
 *  @param object The object under test.
 *  @param class  The expected class kind of the object.
 *
 *  @return YES, if the is object is safe and of the class kind, otherwise NO.
 */
+ (BOOL)isObject:(id)object safeKindOfClass:(Class)class
{
   return ([self isSafeObject:object] && [object isKindOfClass:class]);
}


#pragma mark - Non Empty Class Checks

/**
 *  Tests if an object is a safe non empty array.
 *
 *  @param object The object under test.
 *
 *  @return YES, if the object is a safe non empty array, otherwise NO.
 */
+ (BOOL)isSafeNonEmptyArray:(id)object
{
   return ([self isObject:object safeKindOfClass:[NSArray class]] && [(NSArray *)object count]) ? YES : NO;
}


/**
 *  Tests if an object is a safe non empty dictionary.
 *
 *  @param object The object under test.
 *
 *  @return YES, if the object is a safe non empty dictionary, otherwise NO.
 */
+ (BOOL)isSafeNonEmptyDictionary:(id)object
{
   return ([self isObject:object safeKindOfClass:[NSDictionary class]] && [(NSDictionary *)object count]) ? YES : NO;
}


/**
 *  Tests if an object is a safe non empty number.
 *
 *  Note: Empty numbers are considered to be nil.
 *
 *  @param object The object under test.
 *
 *  @return YES, if the object is a safe non empty number, otherwise NO.
 */
+ (BOOL)isSafeNonEmptyNumber:(id)object
{
   return ([self isObject:object safeKindOfClass:[NSNumber class]]) ? YES : NO;
}


/**
 *  Tests if an object is a safe non empty string.
 *
 *  @param object The object under test.
 *
 *  @return YES, if the object is a safe non empty string, otherwise NO.
 */
+ (BOOL)isSafeNonEmptyString:(id)object
{
   return ([self isObject:object safeKindOfClass:[NSString class]] && [(NSString *)object length]) ? YES : NO;
}


#pragma mark - Equality Checks

/**
 *  Tests if two objects are safe and equal arrays.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe arrays that are equal to each other, otherwise NO.
 */
+ (BOOL)isArray:(id)firstObject safeEqualToArray:(id)secondObject
{
   if ([self isObject:firstObject safeKindOfClass:[NSArray class]] && [self isObject:secondObject safeKindOfClass:[NSArray class]]) {
      return [firstObject isEqualToArray:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe and equal dictionaries.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe dictionaries that are equal to each other, otherwise NO.
 */
+ (BOOL)isDictionary:(id)firstObject safeEqualToDictionary:(id)secondObject
{
   if ([self isObject:firstObject safeKindOfClass:[NSDictionary class]] && [self isObject:secondObject safeKindOfClass:[NSDictionary class]]) {
      return [firstObject isEqualToDictionary:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe and equal numbers.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe numbers that are equal to each other, otherwise NO.
 */
+ (BOOL)isNumber:(id)firstObject safeEqualToNumber:(id)secondObject
{
   if ([self isObject:firstObject safeKindOfClass:[NSNumber class]] && [self isObject:secondObject safeKindOfClass:[NSNumber class]]) {
      return [firstObject isEqualToNumber:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe and equal strings.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe strings that are equal to each other, otherwise NO.
 */
+ (BOOL)isString:(id)firstObject safeEqualToString:(id)secondObject
{
   if ([self isObject:firstObject safeKindOfClass:[NSString class]] && [self isObject:secondObject safeKindOfClass:[NSString class]]) {
      return [firstObject isEqualToString:secondObject];
   } else {
      return NO;
   }
}


#pragma mark - Non Empty Equality Checks

/**
 *  Tests if two objects are safe, non empty, and equal arrays.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe non empty arrays that are equal to each other, otherwise NO.
 */
+ (BOOL)isArray:(id)firstObject safeNonEmptyEqualToArray:(id)secondObject
{
   if ([self isSafeNonEmptyArray:firstObject] && [self isSafeNonEmptyArray:secondObject]) {
      return [firstObject isEqualToArray:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe, non empty, and equal dictionaries.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe non empty dictionaries that are equal to each other, otherwise NO.
 */
+ (BOOL)isDictionary:(id)firstObject safeNonEmptyEqualToDictionary:(id)secondObject
{
   if ([self isSafeNonEmptyDictionary:firstObject] && [self isSafeNonEmptyDictionary:secondObject]) {
      return [firstObject isEqualToDictionary:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe, non empty, and equal numbers.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe non empty numbers that are equal to each other, otherwise NO.
 */
+ (BOOL)isNumber:(id)firstObject safeNonEmptyEqualToNumber:(id)secondObject
{
   if ([self isSafeNonEmptyNumber:firstObject] && [self isSafeNonEmptyNumber:secondObject]) {
      return [firstObject isEqualToNumber:secondObject];
   } else {
      return NO;
   }
}


/**
 *  Tests if two objects are safe, non empty, and equal strings.
 *
 *  @param firstObject  The first object to compare.
 *  @param secondObject The second object to compare.
 *
 *  @return YES, if both objects are safe non empty strings that are equal to each other, otherwise NO.
 */
+ (BOOL)isString:(id)firstObject safeNonEmptyEqualToString:(id)secondObject
{
   if ([self isSafeNonEmptyString:firstObject] && [self isSafeNonEmptyString:secondObject]) {
      return [firstObject isEqualToString:secondObject];
   } else {
      return NO;
   }
}

@end
