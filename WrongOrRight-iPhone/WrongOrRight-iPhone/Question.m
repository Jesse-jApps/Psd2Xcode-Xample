//
//  Question.m
//  Psd2Xcode-WrongOrRight
//
//  Created by jesse on 09.11.14.
//  Copyright (c) 2014 j-apps. All rights reserved.
//

#import "Question.h"

@interface Question()

@end

@implementation Question

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
	self = [self init];
	if (self) {
		_question = [dict objectForKey:@"question"];
		_answer = [dict objectForKey:@"answer"];
		_wrong = [[dict objectForKey:@"wrong"] boolValue];
	}
	
	return self;
}


#pragma mark - statics

+ (NSArray *)loadQuestionsForLevel:(NSString *)level
{
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
	NSDictionary *levels = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
	
	NSMutableArray *dictionary = [NSMutableArray array];
	if ([levels objectForKey:level]) {
		for (NSDictionary *dict in [levels objectForKey:level]) {
			[dictionary addObject:[[Question alloc] initWithDictionary:dict]];
		}
		return dictionary;
	}
	return nil;
}


@end
