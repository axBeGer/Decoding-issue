//
//  ToEncode.m


#import "ToEncode.h"

@implementation ToEncode

- (instancetype)init

{
    self = [super init];

    if (self) {

        NSFont *schrift2 = [NSFont fontWithName:@"Helvetica" size:12];

        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        
        NSMutableArray *tabs = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            [tabs addObject:[[NSTextTab alloc] initWithType:NSDecimalTabStopType location:(i + 1) * 54]];
        }
        
        [style setTabStops:[[NSArray alloc] initWithArray:tabs]];

        NSDictionary *attrsDictNormal = [NSDictionary dictionaryWithObjectsAndKeys:schrift2, NSFontAttributeName, style, NSParagraphStyleAttributeName, nil];
        
        NSMutableAttributedString *hilfsOutput = [[NSMutableAttributedString alloc] initWithString:@""];
        NSAttributedString *testString = [[NSAttributedString alloc] initWithString:@"Test String" attributes:attrsDictNormal];
        [hilfsOutput appendAttributedString:testString];

        _outputText = hilfsOutput;
        
    }

    return self;
}

+ (BOOL)supportsSecureCoding {

    return true;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {

    [coder encodeObject:self.outputText forKey:@"outputText"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {

    self = [super init];

    self.outputText = [coder decodeObjectOfClass:[NSAttributedString class] forKey:@"outputText"];

    return self;
}


@end
