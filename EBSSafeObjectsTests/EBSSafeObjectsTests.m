//
//  EBSSafeObjectsTests.m
//  EBSSafeObjectsTests
//
//  Created by John Woolsey on 1/18/15.
//  Copyright (c) 2014 ExtremeBytes Software. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EBSSafeObjects.h"


@interface EBSSafeObjectsTests : XCTestCase

// Objects
@property (strong, nonatomic) NSObject *nilObject;
@property (strong, nonatomic) NSObject *nullObject;
@property (strong, nonatomic) NSObject *emptyObject;
@property (strong, nonatomic) NSObject *realObject;
@property (strong, nonatomic) NSObject *anotherRealDifferentObject;
@property (strong, nonatomic) NSObject *anotherRealEqualObject;

// Arrays
@property (strong, nonatomic) NSArray *nilArray;
@property (strong, nonatomic) NSArray *nullArray;
@property (strong, nonatomic) NSArray *emptyArray;
@property (strong, nonatomic) NSArray *realArray;
@property (strong, nonatomic) NSArray *anotherRealDifferentArray;
@property (strong, nonatomic) NSArray *anotherRealEqualArray;

// Dictionaries
@property (strong, nonatomic) NSDictionary *nilDictionary;
@property (strong, nonatomic) NSDictionary *nullDictionary;
@property (strong, nonatomic) NSDictionary *emptyDictionary;
@property (strong, nonatomic) NSDictionary *realDictionary;
@property (strong, nonatomic) NSDictionary *anotherRealDifferentDictionary;
@property (strong, nonatomic) NSDictionary *anotherRealEqualDictionary;

// Numbers
@property (strong, nonatomic) NSNumber *nilNumber;
@property (strong, nonatomic) NSNumber *nullNumber;
@property (strong, nonatomic) NSNumber *emptyNumber;
@property (strong, nonatomic) NSNumber *realNumber;
@property (strong, nonatomic) NSNumber *anotherRealDifferentNumber;
@property (strong, nonatomic) NSNumber *anotherRealEqualNumber;

// Strings
@property (strong, nonatomic) NSString *nilString;
@property (strong, nonatomic) NSString *nullString;
@property (strong, nonatomic) NSString *emptyString;
@property (strong, nonatomic) NSString *realString;
@property (strong, nonatomic) NSString *anotherRealDifferentString;
@property (strong, nonatomic) NSString *anotherRealEqualString;

@end


@implementation EBSSafeObjectsTests

- (void)setUp {
   [super setUp];
   // Put setup code here. This method is called before the invocation of each test method in the class.
   
   // Objects
   self.nilObject = nil;
   self.nullObject = [NSNull null];
   self.emptyObject = [[NSObject alloc] init];
   self.realObject = @"object";  // this is effectively a string
   self.anotherRealDifferentObject = @10;  // this is effectively a number
   self.anotherRealEqualObject = @"object";  // this is effectively a string
   
   // Arrays
   self.nilArray = nil;
   self.nullArray = [NSNull null];
   self.emptyArray = [NSArray array];
   self.realArray = @[@"array"];
   self.anotherRealDifferentArray = @[@"another array"];
   self.anotherRealEqualArray = @[@"array"];
   
   // Dictionaries
   self.nilDictionary = nil;
   self.nullDictionary = [NSNull null];
   self.emptyDictionary = [NSDictionary dictionary];
   self.realDictionary = @{@"dictionary":@"dictionary"};
   self.anotherRealDifferentDictionary = @{@"another dictionary":@"another dictionary"};
   self.anotherRealEqualDictionary = @{@"dictionary":@"dictionary"};
   
   // Numbers
   self.nilNumber = nil;
   self.nullNumber = [NSNull null];
   self.emptyNumber = [[NSNumber alloc] init];  // considered a nil value
   self.realNumber = @5;
   self.anotherRealDifferentNumber = @10;
   self.anotherRealEqualNumber = @5;
   
   // Strings
   self.nilString = nil;
   self.nullString = [NSNull null];
   self.emptyString = @"";
   self.realString = @"string";
   self.anotherRealDifferentString = @"another string";
   self.anotherRealEqualString = @"string";
}


/**
 *  Unit tests for EBSSafeObjects isSafeObject: class method.
 */
- (void)testIsSafeObject
{
   // Objects
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nilObject], @"Safe object test with nil object failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nullObject], @"Safe object test with null object failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.emptyObject], @"Safe object test with empty object failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.realObject], @"Safe object test with real object failed.");
   
   // Arrays
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nilArray], @"Safe object test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nullArray], @"Safe object test with null array failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.emptyArray], @"Safe object test with empty array failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.realArray], @"Safe object test with real array failed.");
   
   // Dictionaries
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nilDictionary], @"Safe object test with nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nullDictionary], @"Safe object test with null dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.emptyDictionary], @"Safe object test with empty dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.realDictionary], @"Safe object test with real dictionary failed.");
   
   // Numbers
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nilNumber], @"Safe object test with nil number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nullNumber], @"Safe object test with null number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.emptyNumber], @"Safe object test with empty number failed.");  // empty numbers are considered to be nil
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.realNumber], @"Safe object test with real number failed.");
   
   // Strings
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nilString], @"Safe object test with nil string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeObject:self.nullString], @"Safe object test with null string failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.emptyString], @"Safe object test with empty string failed.");
   XCTAssertTrue([EBSSafeObjects isSafeObject:self.realString], @"Safe object test with real string failed.");
}


/**
 *  Unit tests for EBSSafeObjects isObject:safeKindOfClass: class method.
 */
- (void)testIsObjectSafeKindOfClass
{
   // Objects
   XCTAssertFalse([EBSSafeObjects isObject:self.nilObject safeKindOfClass:[NSObject class]], @"Safe kind of object class test with nil object failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullObject safeKindOfClass:[NSObject class]], @"Safe kind of object class test with null object failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.emptyObject safeKindOfClass:[NSObject class]], @"Safe kind of object class test with empty object failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.realObject safeKindOfClass:[NSObject class]], @"Safe kind of object class test with real object failed.");
   
   // Arrays
   XCTAssertFalse([EBSSafeObjects isObject:self.nilArray safeKindOfClass:[NSArray class]], @"Safe kind of array class test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullArray safeKindOfClass:[NSArray class]], @"Safe kind of array class test with null array failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.emptyArray safeKindOfClass:[NSArray class]], @"Safe kind of array class test with empty array failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.realArray safeKindOfClass:[NSArray class]], @"Safe kind of array class test with real array failed.");
   
   // Dictionaries
   XCTAssertFalse([EBSSafeObjects isObject:self.nilDictionary safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullDictionary safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with null dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.emptyDictionary safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with empty dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.realDictionary safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with real dictionary failed.");
   
   // Numbers
   XCTAssertFalse([EBSSafeObjects isObject:self.nilNumber safeKindOfClass:[NSNumber class]], @"Safe kind of number class test with nil number failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullNumber safeKindOfClass:[NSNumber class]], @"Safe kind of number class test with null number failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.emptyNumber safeKindOfClass:[NSNumber class]], @"Safe kind of number class test with empty number failed.");  // empty numbers are considered to be nil
   XCTAssertTrue([EBSSafeObjects isObject:self.realNumber safeKindOfClass:[NSNumber class]], @"Safe kind of number class test with real number failed.");
   
   // Strings
   XCTAssertFalse([EBSSafeObjects isObject:self.nilString safeKindOfClass:[NSString class]], @"Safe kind of string class test with nil string failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullString safeKindOfClass:[NSString class]], @"Safe kind of string class test with null string failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.emptyString safeKindOfClass:[NSString class]], @"Safe kind of string class test with empty string failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.realString safeKindOfClass:[NSString class]], @"Safe kind of string class test with real string failed.");
   
   // Inheritance
   XCTAssertFalse([EBSSafeObjects isObject:self.nilArray safeKindOfClass:[NSObject class]], @"Safe kind of object class test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullArray safeKindOfClass:[NSObject class]], @"Safe kind of object class test with null array failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.emptyArray safeKindOfClass:[NSObject class]], @"Safe kind of object class test with empty array failed.");
   XCTAssertTrue([EBSSafeObjects isObject:self.realArray safeKindOfClass:[NSObject class]], @"Safe kind of object class test with real array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nilObject safeKindOfClass:[NSArray class]], @"Safe kind of array class test with nil object failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullObject safeKindOfClass:[NSArray class]], @"Safe kind of array class test with null object failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.emptyObject safeKindOfClass:[NSArray class]], @"Safe kind of array class test with empty object failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.realObject safeKindOfClass:[NSArray class]], @"Safe kind of array class test with real object failed.");
   
   // Different class
   XCTAssertFalse([EBSSafeObjects isObject:self.nilArray safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.nullArray safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with null array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.emptyArray safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with empty array failed.");
   XCTAssertFalse([EBSSafeObjects isObject:self.realArray safeKindOfClass:[NSDictionary class]], @"Safe kind of dictionary class test with real array failed.");
}


/**
 *  Unit tests for EBSSafeObjects isSafeNonEmptyArray: class method.
 */
- (void)testIsSafeNonEmptyArray
{
   // Arrays
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.nilArray], @"Safe non empty array test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.nullArray], @"Safe non empty array test with null array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.emptyArray], @"Safe non empty array test with empty array failed.");
   XCTAssertTrue([EBSSafeObjects isSafeNonEmptyArray:self.realArray], @"Safe non empty array test with real array failed.");
   
   // Different class
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.nilDictionary], @"Safe non empty array test with nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.nullDictionary], @"Safe non empty array test with null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.emptyDictionary], @"Safe non empty array test with empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyArray:self.realDictionary], @"Safe non empty array test with real dictionary failed.");
}


/**
 *  Unit tests for EBSSafeObjects isSafeNonEmptyDictionary: class method.
 */
- (void)testIsSafeNonEmptyDictionary
{
   // Dictionaries
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.nilDictionary], @"Safe non empty dictionary test with nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.nullDictionary], @"Safe non empty dictionary test with null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.emptyDictionary], @"Safe non empty dictionary test with empty dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isSafeNonEmptyDictionary:self.realDictionary], @"Safe non empty dictionary test with real dictionary failed.");
   
   // Different class
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.nilArray], @"Safe non empty dictionary test with nil array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.nullArray], @"Safe non empty dictionary test with null array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.emptyArray], @"Safe non empty dictionary test with empty array failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyDictionary:self.realArray], @"Safe non empty dictionary test with real array failed.");
}


/**
 *  Unit tests for EBSSafeObjects isSafeNonEmptyNumber: class method.
 */
- (void)testIsSafeNonEmptyNumber
{
   // Numbers
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.nilNumber], @"Safe non empty number test with nil number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.nullNumber], @"Safe non empty number test with null number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.emptyNumber], @"Safe non empty number test with empty number failed.");
   XCTAssertTrue([EBSSafeObjects isSafeNonEmptyNumber:self.realNumber], @"Safe non empty number test with real number failed.");
   
   // Different class
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.nilString], @"Safe non empty number test with nil string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.nullString], @"Safe non empty number test with null string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.emptyString], @"Safe non empty number test with empty string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyNumber:self.realString], @"Safe non empty number test with real string failed.");
}


/**
 *  Unit tests for EBSSafeObjects isSafeNonEmptyString: class method.
 */
- (void)testIsSafeNonEmptyString
{
   // Strings
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.nilString], @"Safe non empty string test with nil string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.nullString], @"Safe non empty string test with null string failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.emptyString], @"Safe non empty string test with empty string failed.");
   XCTAssertTrue([EBSSafeObjects isSafeNonEmptyString:self.realString], @"Safe non empty string test with real string failed.");
   
   // Different class
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.nilNumber], @"Safe non empty string test with nil number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.nullNumber], @"Safe non empty string test with null number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.emptyNumber], @"Safe non empty string test with empty number failed.");
   XCTAssertFalse([EBSSafeObjects isSafeNonEmptyString:self.realNumber], @"Safe non empty string test with real number failed.");
}


/**
 *  Unit tests for EBSSafeObjects isArray:safeEqualToArray: class method.
 */
- (void)testIsArraySafeEqualToArray
{
   // Arrays
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.nilArray], @"Safe equal arrays test with nil array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.nullArray], @"Safe equal arrays test with nil array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.emptyArray], @"Safe equal arrays test with nil array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.realArray], @"Safe equal arrays test with nil array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.nilArray], @"Safe equal arrays test with null array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.nullArray], @"Safe equal arrays test with null array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.emptyArray], @"Safe equal arrays test with null array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.realArray], @"Safe equal arrays test with null array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.nilArray], @"Safe equal arrays test with empty array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.nullArray], @"Safe equal arrays test with empty array and null array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.emptyArray], @"Safe equal arrays test with empty array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.realArray], @"Safe equal arrays test with empty array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.nilArray], @"Safe equal arrays test with real array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.nullArray], @"Safe equal arrays test with real array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.emptyArray], @"Safe equal arrays test with real array and empty array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.realArray], @"Safe equal arrays test with real array and real array failed.");
   
   // Other real arrays
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.anotherRealDifferentArray], @"Safe equal arrays test with real array and another real different array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.anotherRealEqualArray], @"Safe equal arrays test with real array and another real equal array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.anotherRealDifferentArray safeEqualToArray:self.realArray], @"Safe equal arrays test with another real different array and real array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.anotherRealEqualArray safeEqualToArray:self.realArray], @"Safe equal arrays test with another real equal array and real array failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.nilDictionary], @"Safe equal arrays test with nil array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.nullDictionary], @"Safe equal arrays test with nil array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.emptyDictionary], @"Safe equal arrays test with nil array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeEqualToArray:self.realDictionary], @"Safe equal arrays test with nil array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.nilDictionary], @"Safe equal arrays test with null array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.nullDictionary], @"Safe equal arrays test with null array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.emptyDictionary], @"Safe equal arrays test with null array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeEqualToArray:self.realDictionary], @"Safe equal arrays test with null array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.nilDictionary], @"Safe equal arrays test with empty array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.nullDictionary], @"Safe equal arrays test with empty array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.emptyDictionary], @"Safe equal arrays test with empty array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeEqualToArray:self.realDictionary], @"Safe equal arrays test with empty array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.nilDictionary], @"Safe equal arrays test with real array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.nullDictionary], @"Safe equal arrays test with real array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.emptyDictionary], @"Safe equal arrays test with real array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeEqualToArray:self.realDictionary], @"Safe equal arrays test with real array and real dictionary failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeEqualToArray:self.nilArray], @"Safe equal arrays test with nil dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeEqualToArray:self.nullArray], @"Safe equal arrays test with nil dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeEqualToArray:self.emptyArray], @"Safe equal arrays test with nil dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeEqualToArray:self.realArray], @"Safe equal arrays test with nil dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeEqualToArray:self.nilArray], @"Safe equal arrays test with null dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeEqualToArray:self.nullArray], @"Safe equal arrays test with null dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeEqualToArray:self.emptyArray], @"Safe equal arrays test with null dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeEqualToArray:self.realArray], @"Safe equal arrays test with null dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeEqualToArray:self.nilArray], @"Safe equal arrays test with empty dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeEqualToArray:self.nullArray], @"Safe equal arrays test with empty dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeEqualToArray:self.emptyArray], @"Safe equal arrays test with empty dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeEqualToArray:self.realArray], @"Safe equal arrays test with empty dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeEqualToArray:self.nilArray], @"Safe equal arrays test with real dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeEqualToArray:self.nullArray], @"Safe equal arrays test with real dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeEqualToArray:self.emptyArray], @"Safe equal arrays test with real dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeEqualToArray:self.realArray], @"Safe equal arrays test with real dictionary and real array failed.");
}


/**
 *  Unit tests for EBSSafeObjects isDictionary:safeEqualToDictionary: class method.
 */
- (void)testIsDictionarySafeEqualToDictionary
{
   // Dictionaries
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with nil dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with nil dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with nil dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with nil dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with null dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with null dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with null dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with null dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with empty dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with empty dictionary and null dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with empty dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with empty dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with real dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with real dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with real dictionary and empty dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with real dictionary and real dictionary failed.");
   
   // Other real dictionaries
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.anotherRealDifferentDictionary], @"Safe equal dictionaries test with real dictionary and another real different dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.anotherRealEqualDictionary], @"Safe equal dictionaries test with real dictionary and another real equal dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.anotherRealDifferentDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with another real different dictionary and real dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.anotherRealEqualDictionary safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with another real equal dictionary and real dictionary failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.nilArray], @"Safe equal dictionaries test with nil dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.nullArray], @"Safe equal dictionaries test with nil dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.emptyArray], @"Safe equal dictionaries test with nil dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeEqualToDictionary:self.realArray], @"Safe equal dictionaries test with nil dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.nilArray], @"Safe equal dictionaries test with null dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.nullArray], @"Safe equal dictionaries test with null dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.emptyArray], @"Safe equal dictionaries test with null dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeEqualToDictionary:self.realArray], @"Safe equal dictionaries test with null dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.nilArray], @"Safe equal dictionaries test with empty dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.nullArray], @"Safe equal dictionaries test with empty dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.emptyArray], @"Safe equal dictionaries test with empty dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeEqualToDictionary:self.realArray], @"Safe equal dictionaries test with empty dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.nilArray], @"Safe equal dictionaries test with real dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.nullArray], @"Safe equal dictionaries test with real dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.emptyArray], @"Safe equal dictionaries test with real dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeEqualToDictionary:self.realArray], @"Safe equal dictionaries test with real dictionary and real array failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with nil array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with nil array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with nil array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with nil array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with null array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with null array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with null array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with null array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with empty array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with empty array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with empty array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with empty array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeEqualToDictionary:self.nilDictionary], @"Safe equal dictionaries test with real array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeEqualToDictionary:self.nullDictionary], @"Safe equal dictionaries test with real array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeEqualToDictionary:self.emptyDictionary], @"Safe equal dictionaries test with real array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeEqualToDictionary:self.realDictionary], @"Safe equal dictionaries test with real array and real dictionary failed.");
}


/**
 *  Unit tests for EBSSafeObjects isNumber:safeEqualToNumber: class method.
 */
- (void)testIsNumberSafeEqualToNumber
{
   // Numbers
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with nil number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with nil number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with nil number and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with nil number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with null number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with null number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with null number and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with null number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with empty number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with empty number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with empty number and empty number failed.");  // empty numbers are considered to be nil
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with empty number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with real number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with real number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with real number and empty number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with real number and real number failed.");
   
   // Other real numbers
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.anotherRealDifferentNumber], @"Safe equal numbers test with real number and another real different number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.anotherRealEqualNumber], @"Safe equal numbers test with real number and another real equal number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.anotherRealDifferentNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with another real different number and real number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.anotherRealEqualNumber safeEqualToNumber:self.realNumber], @"Safe equal numbers test with another real equal number and real number failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.nilString], @"Safe equal numbers test with nil number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.nullString], @"Safe equal numbers test with nil number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.emptyString], @"Safe equal numbers test with nil number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeEqualToNumber:self.realString], @"Safe equal numbers test with nil number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.nilString], @"Safe equal numbers test with null number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.nullString], @"Safe equal numbers test with null number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.emptyString], @"Safe equal numbers test with null number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeEqualToNumber:self.realString], @"Safe equal numbers test with null number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.nilString], @"Safe equal numbers test with empty number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.nullString], @"Safe equal numbers test with empty number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.emptyString], @"Safe equal numbers test with empty number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeEqualToNumber:self.realString], @"Safe equal numbers test with empty number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.nilString], @"Safe equal numbers test with real number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.nullString], @"Safe equal numbers test with real number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.emptyString], @"Safe equal numbers test with real number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeEqualToNumber:self.realString], @"Safe equal numbers test with real number and real string failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with nil string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with nil string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with nil string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeEqualToNumber:self.realNumber], @"Safe equal numbers test with nil string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with null string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with null string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with null string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeEqualToNumber:self.realNumber], @"Safe equal numbers test with null string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with empty string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with empty string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with empty string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeEqualToNumber:self.realNumber], @"Safe equal numbers test with empty string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeEqualToNumber:self.nilNumber], @"Safe equal numbers test with real string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeEqualToNumber:self.nullNumber], @"Safe equal numbers test with real string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeEqualToNumber:self.emptyNumber], @"Safe equal numbers test with real string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeEqualToNumber:self.realNumber], @"Safe equal numbers test with real string and real number failed.");
}


/**
 *  Unit tests for EBSSafeObjects isString:safeEqualToString: class method.
 */
- (void)testIsStringSafeEqualToString
{
   // Strings
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.nilString], @"Safe equal strings test with nil string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.nullString], @"Safe equal strings test with nil string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.emptyString], @"Safe equal strings test with nil string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.realString], @"Safe equal strings test with nil string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.nilString], @"Safe equal strings test with null string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.nullString], @"Safe equal strings test with null string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.emptyString], @"Safe equal strings test with null string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.realString], @"Safe equal strings test with null string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.nilString], @"Safe equal strings test with empty string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.nullString], @"Safe equal strings test with empty string and null string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.emptyString safeEqualToString:self.emptyString], @"Safe equal strings test with empty string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.realString], @"Safe equal strings test with empty string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.nilString], @"Safe equal strings test with real string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.nullString], @"Safe equal strings test with real string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.emptyString], @"Safe equal strings test with real string and empty string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.realString safeEqualToString:self.realString], @"Safe equal strings test with real string and real string failed.");
   
   // Other real strings
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.anotherRealDifferentString], @"Safe equal strings test with real string and another real different string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.realString safeEqualToString:self.anotherRealEqualString], @"Safe equal strings test with real string and another real equal string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.anotherRealDifferentString safeEqualToString:self.realString], @"Safe equal strings test with another real different string and real string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.anotherRealEqualString safeEqualToString:self.realString], @"Safe equal strings test with another real equal string and real string failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.nilNumber], @"Safe equal strings test with nil string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.nullNumber], @"Safe equal strings test with nil string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.emptyNumber], @"Safe equal strings test with nil string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeEqualToString:self.realNumber], @"Safe equal strings test with nil string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.nilNumber], @"Safe equal strings test with null string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.nullNumber], @"Safe equal strings test with null string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.emptyNumber], @"Safe equal strings test with null string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeEqualToString:self.realNumber], @"Safe equal strings test with null string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.nilNumber], @"Safe equal strings test with empty string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.nullNumber], @"Safe equal strings test with empty string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.emptyNumber], @"Safe equal strings test with empty string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeEqualToString:self.realNumber], @"Safe equal strings test with empty string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.nilNumber], @"Safe equal strings test with real string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.nullNumber], @"Safe equal strings test with real string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.emptyNumber], @"Safe equal strings test with real string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeEqualToString:self.realNumber], @"Safe equal strings test with real string and real number failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeEqualToString:self.nilString], @"Safe equal strings test with nil number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeEqualToString:self.nullString], @"Safe equal strings test with nil number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeEqualToString:self.emptyString], @"Safe equal strings test with nil number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeEqualToString:self.realString], @"Safe equal strings test with nil number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeEqualToString:self.nilString], @"Safe equal strings test with null number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeEqualToString:self.nullString], @"Safe equal strings test with null number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeEqualToString:self.emptyString], @"Safe equal strings test with null number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeEqualToString:self.realString], @"Safe equal strings test with null number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeEqualToString:self.nilString], @"Safe equal strings test with empty number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeEqualToString:self.nullString], @"Safe equal strings test with empty number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeEqualToString:self.emptyString], @"Safe equal strings test with empty number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeEqualToString:self.realString], @"Safe equal strings test with empty number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeEqualToString:self.nilString], @"Safe equal strings test with real number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeEqualToString:self.nullString], @"Safe equal strings test with real number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeEqualToString:self.emptyString], @"Safe equal strings test with real number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeEqualToString:self.realString], @"Safe equal strings test with real number and real string failed.");
}


/**
 *  Unit tests for EBSSafeObjects isArray:safeNonEmptyEqualToArray: class method.
 */
- (void)testIsArraySafeNonEmptyEqualToArray
{
   // Arrays
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with nil array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with nil array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with nil array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with nil array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with null array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with null array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with null array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with null array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with empty array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with empty array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with empty array and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with empty array and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with real array and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with real array and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with real array and empty array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with real array and real array failed.");
   
   // Other real arrays
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.anotherRealDifferentArray], @"Safe non empty equal arrays test with real array and another real different array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.anotherRealEqualArray], @"Safe non empty equal arrays test with real array and another real equal array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.anotherRealDifferentArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with another real different array and real array failed.");
   XCTAssertTrue([EBSSafeObjects isArray:self.anotherRealEqualArray safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with another real equal array and real array failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.nilDictionary], @"Safe non empty equal arrays test with nil array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.nullDictionary], @"Safe non empty equal arrays test with nil array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.emptyDictionary], @"Safe non empty equal arrays test with nil array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilArray safeNonEmptyEqualToArray:self.realDictionary], @"Safe non empty equal arrays test with nil array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.nilDictionary], @"Safe non empty equal arrays test with null array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.nullDictionary], @"Safe non empty equal arrays test with null array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.emptyDictionary], @"Safe non empty equal arrays test with null array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullArray safeNonEmptyEqualToArray:self.realDictionary], @"Safe non empty equal arrays test with null array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.nilDictionary], @"Safe non empty equal arrays test with empty array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.nullDictionary], @"Safe non empty equal arrays test with empty array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.emptyDictionary], @"Safe non empty equal arrays test with empty array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyArray safeNonEmptyEqualToArray:self.realDictionary], @"Safe non empty equal arrays test with empty array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.nilDictionary], @"Safe non empty equal arrays test with real array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.nullDictionary], @"Safe non empty equal arrays test with real array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.emptyDictionary], @"Safe non empty equal arrays test with real array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realArray safeNonEmptyEqualToArray:self.realDictionary], @"Safe non empty equal arrays test with real array and real dictionary failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with nil dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with nil dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with nil dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nilDictionary safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with nil dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with null dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with null dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with null dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.nullDictionary safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with null dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with empty dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with empty dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with empty dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.emptyDictionary safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with empty dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeNonEmptyEqualToArray:self.nilArray], @"Safe non empty equal arrays test with real dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeNonEmptyEqualToArray:self.nullArray], @"Safe non empty equal arrays test with real dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeNonEmptyEqualToArray:self.emptyArray], @"Safe non empty equal arrays test with real dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isArray:self.realDictionary safeNonEmptyEqualToArray:self.realArray], @"Safe non empty equal arrays test with real dictionary and real array failed.");
}


/**
 *  Unit tests for EBSSafeObjects isDictionary:safeNonEmptyEqualToDictionary: class method.
 */
- (void)testIsDictionarySafeNonEmptyEqualToDictionary
{
   // Dictionaries
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with nil dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with nil dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with nil dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with nil dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with null dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with null dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with null dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with null dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with empty dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with empty dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with empty dictionary and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with empty dictionary and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with real dictionary and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with real dictionary and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with real dictionary and empty dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with real dictionary and real dictionary failed.");
   
   // Other real dictionaries
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.anotherRealDifferentDictionary], @"Safe non empty equal dictionaries test with real dictionary and another real different dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.anotherRealEqualDictionary], @"Safe non empty equal dictionaries test with real dictionary and another real equal dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.anotherRealDifferentDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with another real different dictionary and real dictionary failed.");
   XCTAssertTrue([EBSSafeObjects isDictionary:self.anotherRealEqualDictionary safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with another real equal dictionary and real dictionary failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.nilArray], @"Safe non empty equal dictionaries test with nil dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.nullArray], @"Safe non empty equal dictionaries test with nil dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.emptyArray], @"Safe non empty equal dictionaries test with nil dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilDictionary safeNonEmptyEqualToDictionary:self.realArray], @"Safe non empty equal dictionaries test with nil dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.nilArray], @"Safe non empty equal dictionaries test with null dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.nullArray], @"Safe non empty equal dictionaries test with null dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.emptyArray], @"Safe non empty equal dictionaries test with null dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullDictionary safeNonEmptyEqualToDictionary:self.realArray], @"Safe non empty equal dictionaries test with null dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.nilArray], @"Safe non empty equal dictionaries test with empty dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.nullArray], @"Safe non empty equal dictionaries test with empty dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.emptyArray], @"Safe non empty equal dictionaries test with empty dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyDictionary safeNonEmptyEqualToDictionary:self.realArray], @"Safe non empty equal dictionaries test with empty dictionary and real array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.nilArray], @"Safe non empty equal dictionaries test with real dictionary and nil array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.nullArray], @"Safe non empty equal dictionaries test with real dictionary and null array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.emptyArray], @"Safe non empty equal dictionaries test with real dictionary and empty array failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realDictionary safeNonEmptyEqualToDictionary:self.realArray], @"Safe non empty equal dictionaries test with real dictionary and real array failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with nil array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with nil array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with nil array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nilArray safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with nil array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with null array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with null array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with null array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.nullArray safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with null array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with empty array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with empty array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with empty array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.emptyArray safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with empty array and real dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeNonEmptyEqualToDictionary:self.nilDictionary], @"Safe non empty equal dictionaries test with real array and nil dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeNonEmptyEqualToDictionary:self.nullDictionary], @"Safe non empty equal dictionaries test with real array and null dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeNonEmptyEqualToDictionary:self.emptyDictionary], @"Safe non empty equal dictionaries test with real array and empty dictionary failed.");
   XCTAssertFalse([EBSSafeObjects isDictionary:self.realArray safeNonEmptyEqualToDictionary:self.realDictionary], @"Safe non empty equal dictionaries test with real array and real dictionary failed.");
}


/**
 *  Unit tests for EBSSafeObjects isNumber:safeNonEmptyEqualToNumber: class method.
 */
- (void)testIsNumberSafeNonEmptyEqualToNumber
{
   // Numbers
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with nil number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with nil number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with nil number and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with nil number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with null number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with null number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with null number and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with null number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with empty number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with empty number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with empty number and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with empty number and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with real number and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with real number and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with real number and empty number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with real number and real number failed.");
   
   // Other real numbers
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.anotherRealDifferentNumber], @"Safe non empty equal numbers test with real number and another real different number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.anotherRealEqualNumber], @"Safe non empty equal numbers test with real number and another real equal number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.anotherRealDifferentNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with another real different number and real number failed.");
   XCTAssertTrue([EBSSafeObjects isNumber:self.anotherRealEqualNumber safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with another real equal number and real number failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.nilString], @"Safe non empty equal numbers test with nil number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.nullString], @"Safe non empty equal numbers test with nil number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.emptyString], @"Safe non empty equal numbers test with nil number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilNumber safeNonEmptyEqualToNumber:self.realString], @"Safe non empty equal numbers test with nil number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.nilString], @"Safe non empty equal numbers test with null number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.nullString], @"Safe non empty equal numbers test with null number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.emptyString], @"Safe non empty equal numbers test with null number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullNumber safeNonEmptyEqualToNumber:self.realString], @"Safe non empty equal numbers test with null number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.nilString], @"Safe non empty equal numbers test with empty number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.nullString], @"Safe non empty equal numbers test with empty number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.emptyString], @"Safe non empty equal numbers test with empty number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyNumber safeNonEmptyEqualToNumber:self.realString], @"Safe non empty equal numbers test with empty number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.nilString], @"Safe non empty equal numbers test with real number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.nullString], @"Safe non empty equal numbers test with real number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.emptyString], @"Safe non empty equal numbers test with real number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realNumber safeNonEmptyEqualToNumber:self.realString], @"Safe non empty equal numbers test with real number and real string failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with nil string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with nil string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with nil string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nilString safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with nil string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with null string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with null string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with null string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.nullString safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with null string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with empty string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with empty string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with empty string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.emptyString safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with empty string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeNonEmptyEqualToNumber:self.nilNumber], @"Safe non empty equal numbers test with real string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeNonEmptyEqualToNumber:self.nullNumber], @"Safe non empty equal numbers test with real string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeNonEmptyEqualToNumber:self.emptyNumber], @"Safe non empty equal numbers test with real string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isNumber:self.realString safeNonEmptyEqualToNumber:self.realNumber], @"Safe non empty equal numbers test with real string and real number failed.");
}


/**
 *  Unit tests for EBSSafeObjects isString:safeNonEmptyEqualToString: class method.
 */
- (void)testIsStringSafeNonEmptyEqualToString
{
   // Strings
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with nil string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with nil string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with nil string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with nil string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with null string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with null string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with null string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with null string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with empty string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with empty string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with empty string and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with empty string and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with real string and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with real string and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with real string and empty string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with real string and real string failed.");
   
   // Other real strings
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.anotherRealDifferentString], @"Safe non empty equal strings test with real string and another real different string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.anotherRealEqualString], @"Safe non empty equal strings test with real string and another real equal string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.anotherRealDifferentString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with another real different string and real string failed.");
   XCTAssertTrue([EBSSafeObjects isString:self.anotherRealEqualString safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with another real equal string and real string failed.");
   
   // Different classes
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.nilNumber], @"Safe non empty equal strings test with nil string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.nullNumber], @"Safe non empty equal strings test with nil string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.emptyNumber], @"Safe non empty equal strings test with nil string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilString safeNonEmptyEqualToString:self.realNumber], @"Safe non empty equal strings test with nil string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.nilNumber], @"Safe non empty equal strings test with null string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.nullNumber], @"Safe non empty equal strings test with null string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.emptyNumber], @"Safe non empty equal strings test with null string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullString safeNonEmptyEqualToString:self.realNumber], @"Safe non empty equal strings test with null string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.nilNumber], @"Safe non empty equal strings test with empty string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.nullNumber], @"Safe non empty equal strings test with empty string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.emptyNumber], @"Safe non empty equal strings test with empty string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyString safeNonEmptyEqualToString:self.realNumber], @"Safe non empty equal strings test with empty string and real number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.nilNumber], @"Safe non empty equal strings test with real string and nil number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.nullNumber], @"Safe non empty equal strings test with real string and null number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.emptyNumber], @"Safe non empty equal strings test with real string and empty number failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realString safeNonEmptyEqualToString:self.realNumber], @"Safe non empty equal strings test with real string and real number failed.");
   
   // Different classes swapped
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with nil number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with nil number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with nil number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nilNumber safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with nil number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with null number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with null number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with null number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.nullNumber safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with null number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with empty number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with empty number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with empty number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.emptyNumber safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with empty number and real string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeNonEmptyEqualToString:self.nilString], @"Safe non empty equal strings test with real number and nil string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeNonEmptyEqualToString:self.nullString], @"Safe non empty equal strings test with real number and null string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeNonEmptyEqualToString:self.emptyString], @"Safe non empty equal strings test with real number and empty string failed.");
   XCTAssertFalse([EBSSafeObjects isString:self.realNumber safeNonEmptyEqualToString:self.realString], @"Safe non empty equal strings test with real number and real string failed.");
}

@end
