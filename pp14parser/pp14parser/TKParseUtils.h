//
//  TKParseUtils.h
//  pp14parser
//
//  Created by Tim Kelly on 7/11/14.
//  Copyright (c) 2014 Tim Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 Parser utility class to solve the following programming challenge:
 
 PP 1.4: In the programming language of your choice, write a program that parses a sentence and replaces each word with the following: first letter, number of distinct characters between first and last character, and last letter.  For example, Smooth would become S3h.  Words are separated by spaces or non-alphabetic characters and these separators should be maintained in their original form and location in the answer.
 
 We are looking for accuracy, efficiency and solution completeness. Please include this problem description in the comment at the top of your solution.  The problem is designed to take approximately 1-2 hours.
 */
@interface TKParseUtils : NSObject

/** Given a sentence and parse the sentence into funnyWord format.
 
 TODO: This could be improved by using NSError as a parameter to be filled out in case of error.
 
 @param sentence: The sentence to parse
 
 @return The parsed sentence in funnyWord format. Returns nil if an error occurred.
 */
+ (NSString *)funnySentenceParser:(NSString *)sentence;

/** Take an input string, presumed to be a single word and return the number of distinct characters between the first and last letter while keeping the first and last letter in place. The count is case insenstivie. White space is removed from all input.
 
   TODO: This could be improved by using NSError as a parameter to be filled out in case of error.
 
 @param sentence: Input string, must be non-nil and >= 3 characters
 
 @return The result as an NSString object, or nil of the parsing failed.
 */
+ (NSString *)funnyWordParser:(NSString *)word;

@end
