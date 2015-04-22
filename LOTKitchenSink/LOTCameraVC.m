//
//  LOTCameraVC.m
//  LOTKitchenSink
//
//  Created by Levan on 4/22/15.
//  Copyright (c) 2015 Levan. All rights reserved.
//
// ******* Turn off autolayout in the nib

#import "LOTCameraVC.h"

@interface LOTCameraVC ()
@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;
- (IBAction)takeButton:(id)sender;
- (IBAction)viewButton:(id)sender;
- (IBAction)screenshotButton:(id)sender;

@end

@implementation LOTCameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)takeButton:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    
    
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)viewButton:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}


//This is just one way of taking a screenshot. We are using UIWIndow
- (IBAction)screenshotButton:(id)sender {
    
    // create graphics context with screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(screenRect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    // grab reference to our window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // transfer content into our context
    [window.layer renderInContext:ctx];
    UIImage *screengrab = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(screengrab, nil, nil, nil);
    
}

//Used to save image to camera roll
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.cameraImageView.image = chosenImage;
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//In case user hits cancel, it seems to work fine without this method but everyone seems to include this.
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}









/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
