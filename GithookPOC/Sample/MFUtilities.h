#import <Foundation/Foundation.h>

@interface MFFraction : NSObject {
    @public double denominator;
    @public double numerator;
}
@end

@interface MFUtilities : NSObject
{
  int count;
}
//main intro
-(double)getValueOfFraction:(MFFraction *)fraction;
-(BOOL)isEqual:(MFFraction *)fractionOne and:(MFFraction *)object;
-(NSComparisonResult)compare:(MFFraction *)fractionOne and:(MFFraction *)otherObject;



@end
