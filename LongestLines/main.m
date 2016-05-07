//
//  main.m
//  LongestLines


#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray *testArray = @[@"2", @"quijibo", @"Anything Is possible", @"oyoyotogojojrorjojrojrojrojrojrojrojrojrojroj", @"What is that smell?", @"Hello World"];
        
        NSInteger numberOfLinesToReturn = [(NSString *)testArray[0] integerValue];
        
        NSMutableArray *mutArrayOfLines = [[NSMutableArray alloc]init];
        NSMutableArray *mutArrayOfLengths = [[NSMutableArray alloc]init];
        BOOL mutLengthsAreDescending = NO;
        
        // build array of strings
        NSInteger i = 1;
        for (i =1; i < testArray.count; i++) {
            
            NSString *lineString = [testArray objectAtIndex:i];
            [mutArrayOfLines addObject:lineString];
            
            NSNumber *lineLength = [NSNumber numberWithUnsignedInteger:lineString.length];
            [mutArrayOfLengths addObject:lineLength];
        }
        
//        NSLog(@"mutArrayOfLines: %@", mutArrayOfLines);
//        NSLog(@"mutArrayOfLengths: %@", mutArrayOfLengths);
        
        while (!mutLengthsAreDescending) {
            
            for (i = 0; i < mutArrayOfLengths.count - 1; i++) {
                NSInteger num1 = [[mutArrayOfLengths objectAtIndex:i] integerValue];
                NSInteger num2 = [[mutArrayOfLengths objectAtIndex:i + 1] integerValue];
            
                if (num1 < num2) {
                    mutLengthsAreDescending = NO;
                    [mutArrayOfLengths removeObject:@(num1)];
                    [mutArrayOfLengths insertObject:@(num1) atIndex:i + 1];
//                    NSLog(@"num1: %ld num2: %ld", num1, num2);
                }
                else {
//                    NSLog(@"in descending order");
                }
            }
            // check for sort success
            for (i = 0; i < mutArrayOfLengths.count - 1; i++) {
                NSInteger num1 = [[mutArrayOfLengths objectAtIndex:i] integerValue];
                NSInteger num2 = [[mutArrayOfLengths objectAtIndex:i + 1] integerValue];
                
                if (num1 < num2) {
                    mutLengthsAreDescending = NO;
//                    NSLog(@"NO");
                    break;
                }
                else {
//                    NSLog(@"in descending order");
                    mutLengthsAreDescending = YES;
//                    NSLog(@"YES");
                }
            }
        }
//        NSLog(@"post sort mutArrayOfLengths: %@", mutArrayOfLengths);
        
        NSMutableArray *lengthsToReturn = [[NSMutableArray alloc]init];
        for (i = 0; i < numberOfLinesToReturn; i++) {
            [lengthsToReturn addObject:[mutArrayOfLengths objectAtIndex:i]];
        }
        NSLog(@"lengthsToReturn: %@", lengthsToReturn);
        
        for (NSNumber *lengths in lengthsToReturn) {
            for (NSString *line in mutArrayOfLines) {
                if ([lengths integerValue] == line.length) {
                    NSLog(@"%@", line);
                }
            }
        }
    }
    return 0;
}


