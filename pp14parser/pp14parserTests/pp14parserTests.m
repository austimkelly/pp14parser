//
//  pp14parserTests.m
//  pp14parserTests
//
//  Created by Tim Kelly on 7/11/14.
//  Copyright (c) 2014 Tim Kelly. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "TKParseUtils.h"

@interface pp14parserTests : XCTestCase

@end

@implementation pp14parserTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParser
{
    
    NSArray *testCases = [NSArray arrayWithObjects:@"Smooth",
                          @"Smooth Smooth  Smooth",
                          @"Zzzzzzzzz", @"Whole Lotta Love",
                          @"Cow11Jumped233Over3444The4555Moon",
                          @"Unicode!@#$%^&*(Test",
                          @"AaAa_Bbbb",
                          nil];
    
    NSArray *expectedResults = [NSArray arrayWithObjects:@"S3h",
                                @"S3h S3h  S3h",
                                @"Z1z",
                                @"W3e L2a L2e",
                                @"C1w11J4d233O2r3444T1e4555M1n",
                                @"U5e!@#$%^&*(T2t",
                                @"A1a_B1b",
                                nil];
    
    int i = 0;
    for (NSString *testCase in testCases){
        
        NSString *result = [TKParseUtils funnySentenceParser:testCase];
        
        NSString *expectedResult = [expectedResults objectAtIndex:i];
        
        NSLog(@"Input: %@ Output: %@", testCase, result);
        
        XCTAssert([result isEqualToString:expectedResult], @"Failed test for %@. Expected %@ but got %@", testCase, expectedResult, result);
        
        ++i;
    }
        
}

@end
