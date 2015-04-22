//
//  LOTPdfViewController.m
//  LOTKitchenSink
//
//  Created by Levan on 4/20/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//
//MOST OF THIS CODE COMES FROM TUTS+ code.tutsplus.com/tutorials/generating-pdf-documents--mobile-11265
//Some methods were changed because that had be depricated


#import "LOTPdfViewController.h"
#define kPadding 20

@interface LOTPdfViewController ()
{
    CGSize _pageSize;
}
@property (strong, nonatomic) NSString *pdfPath;
@end

@implementation LOTPdfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *pdfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pdfButton setTitle:@"Create PDF" forState:UIControlStateNormal];
    pdfButton.frame = CGRectMake(10, 200, 170, 60);
    pdfButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:pdfButton];
    [pdfButton addTarget:self action:@selector(didClickMakePDF) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *showpdfButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showpdfButton setTitle:@"Show PDF" forState:UIControlStateNormal];
    showpdfButton.frame = CGRectMake(210, 200, 170, 60);
    showpdfButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:showpdfButton];
    [showpdfButton addTarget:self action:@selector(showPDF) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-----------------------------------------------------------------------------------------------------
//These methods create the pdf
-(void)didClickMakePDF{
    [self setupPDFDocumentNamed:@"NewPDF" Width:850 Height:1100];
    [self beginPDFPage];
    
    //here we place the text in the pdf
    CGRect textRect = [self addText:@"Yo Dude, What is happening man? I haven't seen you in a fortnight!"
                          withFrame:CGRectMake(kPadding, kPadding, 400, 200) fontSize:48.0f];
    
    //here we use the frame from "textRect" to place our blue line in the correct location
    CGRect blueLineRect =  [self addLineWithFrame:CGRectMake(kPadding, textRect.origin.y + textRect.size.height + kPadding, _pageSize.width - kPadding*2, 4)
                                       withColor:[UIColor redColor]];
    
//    //places image in proper location
//    UIImage *anImage = [UIImage imageNamed:@"someimage.jpg"];
//    CGRect imageRect = [self addImage:anImage
//                              atPoint:CGPointMake((_pageSize.width/2)-(anImage.size.width/2), blueLineRect.origin.y + blueLineRect.size.height + kPadding)];
    
    [self finishPDF];
    
}


-(void)beginPDFPage{
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, _pageSize.width, _pageSize.height), nil);
}

-(void)finishPDF{
    UIGraphicsEndPDFContext();
}

//method used to set name, path, and size of pdf document
-(void)setupPDFDocumentNamed:(NSString *)name Width:(float)width Height:(float)height{
    _pageSize = CGSizeMake(500, 500);
    NSString *newPDFName = [NSString stringWithFormat:@"%@.pdf", name];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.pdfPath = [documentsDirectory stringByAppendingPathComponent:newPDFName];
    UIGraphicsBeginPDFContextToFile(self.pdfPath, CGRectZero, nil);

}

//--------------------------------------------------------------------------------------------------------



//This method creates the attributes for the text in the document
- (CGRect)addText:(NSString*)text withFrame:(CGRect)frame fontSize:(float)fontSize {
    
    //Sets the fontsize
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    

    //Making sure the text doesn't spill off the page
    NSMutableParagraphStyle *stringStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    stringStyle.lineBreakMode = NSLineBreakByWordWrapping;
    CGRect stringSizeRect = [text boundingRectWithSize:CGSizeMake(_pageSize.width - 2*20-2*20, _pageSize.height - 2*20 - 2*20)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font,
                                                     NSParagraphStyleAttributeName:stringStyle}
                                           context:nil];
    CGSize stringSize = stringSizeRect.size;

    float textWidth = frame.size.width;
    
    if (textWidth < stringSize.width)
        textWidth = stringSize.width;
    if (textWidth > _pageSize.width)
        textWidth = _pageSize.width - frame.origin.x;
    
    
    //Create a frame for our text and actually draw it to our page
    CGRect renderingRect = CGRectMake(frame.origin.x, frame.origin.y, textWidth, stringSize.height);
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentLeft;
    [text drawInRect:renderingRect withAttributes:@{NSFontAttributeName:font,
                                                    NSParagraphStyleAttributeName:textStyle}];

    frame = CGRectMake(frame.origin.x, frame.origin.y, textWidth, stringSize.height);
    return frame;
    
}



//This method creates the attributes for the lines in our document
-  (CGRect)addLineWithFrame:(CGRect)frame withColor:(UIColor*)color {
    //set color
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentContext, color.CGColor);
    
    // this sets where our line starts, its lenght and thickness
    CGContextSetLineWidth(currentContext, frame.size.height);
    CGPoint startPoint = frame.origin;
    CGPoint endPoint = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
    
    //now we actually draw to our context
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(currentContext, endPoint.x, endPoint.y);
    CGContextClosePath(currentContext);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    return frame;
}

////This method "draws" our image in the appropriate place
//- (CGRect)addImage:(UIImage*)image atPoint:(CGPoint)point {
//    CGRect imageFrame = CGRectMake(point.x, point.y, image.size.width, image.size.height);
//    [image drawInRect:imageFrame];
//    return imageFrame;
//}


//----------------------------------------------------------------------------------------------
//Methods used to view pdf file

-(void) showPDF{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(60, 290, 200, 200)];
    
    NSURL *targetURL = [NSURL fileURLWithPath:self.pdfPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}


@end
