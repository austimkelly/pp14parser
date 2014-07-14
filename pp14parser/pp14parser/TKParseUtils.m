//
//  TKParseUtils.m
//  pp14parser
//
//  Created by Tim Kelly on 7/11/14.
//  Copyright (c) 2014 Tim Kelly. All rights reserved.
//

#import "TKParseUtils.h"

@implementation TKParseUtils


+ (NSString *)funnySentenceParser:(NSString *)sentence{
    
    NSString *result = @"";
    
    if (sentence != nil){
    
        // We need to tokenize on the numbers, but also replace them after the funny conversion
        //NSCharacterSet *numericSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        NSCharacterSet *nonLetterSet = [[NSCharacterSet letterCharacterSet] invertedSet]; // All non-alpha characters
        
        NSArray *wordBoundaries = [TKParseUtils getSentenceWordBoundaries:sentence];
        
        NSString *newString =
        [[sentence componentsSeparatedByCharactersInSet:nonLetterSet]
         componentsJoinedByString:@" "]; // Removes the numbers/non-alpha chars and replaces with spaces.
        
        NSArray *words = [newString componentsSeparatedByString:@" "];
        
        int boundaryCount = 0;
        if (words != nil && [words count] > 0){
            
            for (NSString *word in words){
                
                NSString *parsedWord = [self funnyWordParser:word];
                
                if (parsedWord.length == 0) continue;
                
                result = [result stringByAppendingFormat:@"%@", parsedWord];
                
                if (result != nil && result.length > 0){
                
                    if ([wordBoundaries count] > boundaryCount){
                        result = [result stringByAppendingFormat:@"%@", [wordBoundaries objectAtIndex:boundaryCount]];
                        boundaryCount++;
                    }
                    
                }
            }
            
        }
    
    }
    
    return result;
    
}


+ (NSString *)funnyWordParser:(NSString *)word{
    
    NSString *result = nil;
    int charCount[26] = {0};
    
    if (word != nil){
        
        word = [word stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([word length] > 2){
            
            result = [NSString stringWithFormat:@"%c", [word characterAtIndex:0]];
            
            NSString *subString = [[word substringWithRange:NSMakeRange(1, word.length - 2)] lowercaseString];
            
            // iterate all the chars and count them up
            for (int i = 0; i < subString.length; i++){
                char c = [subString characterAtIndex:i];
                
                charCount[c - 'a']++;
                
            }
            
            // Not iterate all the characters that occur and add up the occurrences, once per character.
            int letterCount = 0;
            for (int i = 0; i < 26; i++){
                if (charCount[i] > 0){
                    letterCount++;
                }
            }
            
            result = [result stringByAppendingFormat:@"%d%c", letterCount, [word characterAtIndex:word.length-1]];
            
        } else {
            result = word;
        }
        
    }
    
    
    return result;
    
}


/**
 Takes a sentence and breaks up the word boundaries on non-alpha characters.
 For example, "My&^dog   has___fleas" will tokenize {"&^", "   ", "___}.
 
 TODO: Consider for prefix/suffix delimiters, currently presumes they are stripped.
 
 @param sentence: The input sentence you want to tokenize.
 
 @result An array of NSString objects that are alpha only.
 
 */
+ (NSArray *)getSentenceWordBoundaries:(NSString *)sentence{
    
    NSMutableArray *boundaries = [NSMutableArray array];
    
    if (sentence != nil){
    
        NSString *currString = @"";
        for (int i = 0; i < sentence.length; i++){
            
            char c = [sentence characterAtIndex:i];
            
            if (!isalpha(c)){
                currString = [currString stringByAppendingFormat:@"%c", c];
            } else {
                if (currString.length > 0){
                    [boundaries addObject:currString];
                    currString = @"";
                }
            }
            
        }
    }
    
    return boundaries;
    
    
}


@end
