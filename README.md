# EBSSafeObjects
Sample Objective-C library for using common Foundation objects that may not be safe, such as nil, null, or empty values obtained from a server API.

Although this library is useful on its own, the primary purpose for this project is to demonstrate unit testing techniques.

# Methods
### Safe Object Checks
```
+ (BOOL)isSafeObject:(id)object
+ (BOOL)isObject:(id)object safeKindOfClass:(Class)class
```
### Non Empty Checks
```
+ (BOOL)isSafeNonEmptyArray:(id)object
+ (BOOL)isSafeNonEmptyDictionary:(id)object
+ (BOOL)isSafeNonEmptyNumber:(id)object
+ (BOOL)isSafeNonEmptyString:(id)object
```
### Equality Checks
```
+ (BOOL)isArray:(id)firstObject safeEqualToArray:(id)secondObject
+ (BOOL)isDictionary:(id)firstObject safeEqualToDictionary:(id)secondObject
+ (BOOL)isNumber:(id)firstObject safeEqualToNumber:(id)secondObject
+ (BOOL)isString:(id)firstObject safeEqualToString:(id)secondObject
```
### Non Empty Equality Checks
```
+ (BOOL)isArray:(id)firstObject safeNonEmptyEqualToArray:(id)secondObject
+ (BOOL)isDictionary:(id)firstObject safeNonEmptyEqualToDictionary:(id)secondObject
+ (BOOL)isNumber:(id)firstObject safeNonEmptyEqualToNumber:(id)secondObject
+ (BOOL)isString:(id)firstObject safeNonEmptyEqualToString:(id)secondObject
```
