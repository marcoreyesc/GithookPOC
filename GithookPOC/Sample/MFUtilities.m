//  MFUtilities.m
/*
 Author: Janusz Chudzynski
*/
#import "MFUtilities.h"

//MFUtilities Extension
@interface MFUtilities()
//private methods and objects

@end

@implementation MFFraction
double denominator = 0;
double numerator = 0;
@end

@implementation MFUtilities

-(double)getValueOfFraction:(MFFraction *)fraction;{
//    return fraction->numerator.intValue*1.0/fraction->denominator.intValue*1.0;
    return 0;
}

- (NSComparisonResult)compare:(MFFraction *)fractionOne and:
(MFFraction *)otherObject
{
//    float b = otherObject.numerator.intValue/otherObject.denominator.intValue;
//    if(a==b)
//    {
//        return NSOrderedSame;
//    }
//    if(a<b){
//        return NSOrderedAscending;
//    }
//    return NSOrderedDescending;
    NSLog(@"ss");
    
    
    
    NSLog(@"ss");
    
    
    
    
    
    return 0;
}

- (BOOL)isEqual:(MFFraction *)fractionOne and:(MFFraction *)object
{
   MFFraction * other = (MFFraction *)object;
    fractionOne = [self simplify:fractionOne];
    other = [self simplify:other];
    
    return 0;
  
}

-(MFFraction *)simplify:(MFFraction *)_fraction{
  
    return 0;
}

int GCD(int a, int b){
    return 0;
}

@end
