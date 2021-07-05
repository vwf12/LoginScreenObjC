//
//  LoginViewController.m
//  LoginScreenObjC
//
//  Created by FARIT GATIATULLIN on 02.07.2021.
//

#import "LoginViewController.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface LoginViewController ()

- (void)createLoginView;

@property(nonatomic) UIView  *loginView;
@property(nonatomic) UIView  *firstView;
@property (weak, nonatomic) IBOutlet UILabel *rssschoolLabel;
@property (nonatomic) BOOL correctUsernameInput;
@property (nonatomic) BOOL correctPasswordInput;

@end

@implementation LoginViewController {
    
    UITextField *usernameField;
    UITextField *passwordField;
    UIButton *authorizeButton;
    UIView *secureView;
    UIButton *buttonOne;
    UIButton *buttonTwo;
    UIButton *buttonThree;
    UILabel *secureInput;
    NSMutableArray *secureInputArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.correctUsernameInput = true;
    self.correctPasswordInput = true;
    [self createLoginView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    secureInputArray = [NSMutableArray new];
    [self.view addGestureRecognizer:tap];
    
}

- (void)createLoginView {
    self.loginView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y, self.view.bounds.size.width,self.view.bounds.size.height)];
    [self.loginView setBackgroundColor:[UIColor whiteColor]];
    //    MARK: Setup username field
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(36, CGRectGetMaxY(self.rssschoolLabel.frame) + 80, 303, 40)];
    usernameField.placeholder=@"Login";
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameField.returnKeyType = UIReturnKeyNext;
    usernameField.keyboardType = UIKeyboardTypeDefault;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, usernameField.frame.size.height)];
    usernameField.leftView = paddingView;
    usernameField.leftViewMode = UITextFieldViewModeAlways;
    usernameField.layer.cornerRadius = 5;
    [usernameField.layer setBorderColor:Rgb2UIColor(76, 92, 104).CGColor];
    [usernameField.layer setBorderWidth:1.5];
    usernameField.clearsOnBeginEditing = false;
    //    MARK: Setup password field
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(36, CGRectGetMaxY(usernameField.frame) + 30, 303, 40)];
    passwordField.placeholder=@"Password";
    passwordField.returnKeyType = UIReturnKeyDone;
    passwordField.keyboardType = UIKeyboardTypeDefault;
    passwordField.secureTextEntry = YES;
    passwordField.layer.cornerRadius = 5;
    [passwordField setBackgroundColor:[UIColor whiteColor]];
    [passwordField.layer setBorderColor:Rgb2UIColor(76, 92, 104).CGColor];
    [passwordField.layer setBorderWidth:1.5];
    UIView *paddingPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, usernameField.frame.size.height)];
    passwordField.leftView = paddingPasswordView;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.clearsOnBeginEditing = false;
    //    MARK: Setup authorize button
    authorizeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    authorizeButton.frame = CGRectMake(110, CGRectGetMaxY(passwordField.frame) + 60, 156, 42);
    UIImage *image = [[UIImage imageNamed:@"person_100.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [authorizeButton setImage:image forState:UIControlStateNormal];
    [authorizeButton setImage:[UIImage imageNamed:@"person_fill_100.png"] forState:UIControlStateHighlighted];
    [authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    authorizeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 10);
    authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(10, -20, 10, 0);
    authorizeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    authorizeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    authorizeButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    authorizeButton.layer.cornerRadius = 10;
    [authorizeButton.layer setBorderWidth:2];
    [authorizeButton.layer setBorderColor:Rgb2UIColor(128, 164, 237).CGColor];
    authorizeButton.tintColor = Rgb2UIColor(128, 164, 237);
    [authorizeButton setTitleColor:Rgb2UIColor(128, 164, 237) forState:UIControlStateDisabled];
    authorizeButton.titleLabel.font = [UIFont systemFontOfSize:20 weight: UIFontWeightSemibold];
    [authorizeButton addTarget:self action:@selector(checkAuthorize) forControlEvents:UIControlEventTouchUpInside];
    [authorizeButton addTarget:self action:@selector(buttonHighlight) forControlEvents:UIControlEventTouchDown];
    // MARK: Setup main view
    [self.view addSubview:usernameField];
    [self.view addSubview:passwordField];
    [self.view addSubview:authorizeButton];
    //  MARK: TextField delegate
    usernameField.delegate=self;
    passwordField.delegate=self;
}

- (void) buttonHighlight {
    [authorizeButton setBackgroundColor:[Rgb2UIColor(128, 164, 237) colorWithAlphaComponent:0.2]];
    authorizeButton.titleLabel.alpha = 0.4;
    authorizeButton.imageView.alpha = 1.0;
}

- (void)checkAuthorize {
    [authorizeButton setBackgroundColor:[UIColor.whiteColor colorWithAlphaComponent:1.0]];
    authorizeButton.titleLabel.alpha = 1.0;
    NSString * user = usernameField.text;
    NSString * password = passwordField.text;
    
    if ([user  isEqual: @"username"] && [password  isEqual: @"password"]) {
        NSLog(@"b");
        [self successfullAuthorization];
    } else {
        if (![user isEqual: @"username"]) {
            [usernameField.layer setBorderColor:Rgb2UIColor(194, 1, 20).CGColor];
            _correctUsernameInput = false;
        } else {
            _correctUsernameInput = true;
            [usernameField.layer setBorderColor:Rgb2UIColor(145, 199, 177).CGColor];
            
        }
        
        if (![password isEqual: @"password"]) {
            [passwordField.layer setBorderColor:Rgb2UIColor(194, 1, 20).CGColor];
            _correctPasswordInput = false;
        } else {
            _correctPasswordInput = true;
            [passwordField.layer setBorderColor:Rgb2UIColor(145, 199, 177).CGColor];
        }
        [self failedAuthhorization];
    }
}

-(void) successfullAuthorization {
    usernameField.layer.opacity = 0.5;
    [usernameField.layer setBorderColor:Rgb2UIColor(145, 199, 177).CGColor];
    passwordField.layer.opacity = 0.5;
    [passwordField.layer setBorderColor:Rgb2UIColor(145, 199, 177).CGColor];
    usernameField.enabled = false;
    passwordField.enabled = false;
    authorizeButton.enabled = false;
    authorizeButton.layer.opacity = 0.5;
    [self setupSecureView];
}

-(void) setupSecureView {
    CGRect viewRect = CGRectMake(self.view.frame.size.width / 2 - 118, CGRectGetMaxY(authorizeButton.frame) + 67, 236, 110);
    secureView = [[UIView alloc] initWithFrame:viewRect];
    secureView.layer.borderColor = UIColor.whiteColor.CGColor;
    secureView.layer.borderWidth = 2.0;
    secureView.layer.cornerRadius = 10;
    //    Secure buttons
    buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonOne setTitle: @"1" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(roundButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonOne addTarget:self action:@selector(roundButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    NSNumber *buttonOneNum = @1;
    [buttonOne.layer setValue:buttonOneNum forKey:@"buttonNum"];
    buttonOne.frame = CGRectMake(23, 45, 50, 50);
    buttonOne.layer.cornerRadius = 25;
    buttonOne.layer.borderColor = Rgb2UIColor(128, 164, 237).CGColor;
    buttonOne.layer.borderWidth = 1.5;
    buttonOne.titleLabel.font = [UIFont systemFontOfSize:24 weight: UIFontWeightSemibold];
    [buttonOne setTitleColor:Rgb2UIColor(128, 164, 237) forState:UIControlStateNormal];
    //    MARK: Button two
    buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonTwo setTitle: @"2" forState:UIControlStateNormal];
    [buttonTwo addTarget:self action:@selector(roundButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonTwo addTarget:self action:@selector(roundButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    NSNumber *buttonTwoNum = @2;
    [buttonTwo.layer setValue:buttonTwoNum forKey:@"buttonNum"];
    buttonTwo.frame = CGRectMake(93, 45, 50, 50);
    buttonTwo.layer.cornerRadius = 25;
    buttonTwo.layer.borderColor = Rgb2UIColor(128, 164, 237).CGColor;
    buttonTwo.layer.borderWidth = 1.5;
    buttonTwo.titleLabel.font = [UIFont systemFontOfSize:24 weight: UIFontWeightSemibold];
    [buttonTwo setTitleColor:Rgb2UIColor(128, 164, 237) forState:UIControlStateNormal];
    //    MARK: Button three
    buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonThree setTitle: @"3" forState:UIControlStateNormal];
    [buttonThree addTarget:self action:@selector(roundButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [buttonThree addTarget:self action:@selector(roundButtonHighlight:) forControlEvents:UIControlEventTouchDown];
    NSNumber *buttonThreeNum = @3;
    [buttonThree.layer setValue:buttonThreeNum forKey:@"buttonNum"];
    buttonThree.frame = CGRectMake(163, 45, 50, 50);
    buttonThree.layer.cornerRadius = 25;
    buttonThree.layer.borderColor = Rgb2UIColor(128, 164, 237).CGColor;
    buttonThree.layer.borderWidth = 1.5;
    buttonThree.titleLabel.font = [UIFont systemFontOfSize:24 weight: UIFontWeightSemibold];
    [buttonThree setTitleColor:Rgb2UIColor(128, 164, 237) forState:UIControlStateNormal];
    //    MARK: Secure input text view
    NSString *text = @"1 2 3";
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18 weight: UIFontWeightSemibold]}];
    secureInput = [UILabel new];
    secureInput.frame = CGRectMake(secureView.frame.size.width / 2 - size.width / 2,  15, size.width, size.height);
    NSLog(@"%f", secureInput.bounds.origin.x);
    NSLog(@"%f", secureInput.bounds.origin.y);
    secureInput.textColor = [UIColor blackColor];
    secureInput.text = @"_";
    secureInput.font = [UIFont systemFontOfSize:18 weight: UIFontWeightSemibold];
    secureInput.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:secureView];
    [secureView addSubview:buttonOne];
    [secureView addSubview:buttonTwo];
    [secureView addSubview:buttonThree];
    [secureView addSubview:secureInput];
    
}

-(void) roundButtonDidTap:(UIButton*)sender {
    NSNumber *buttonNum = (NSNumber *)[sender.layer valueForKey:@"buttonNum"];
    secureView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    switch([buttonNum intValue]){
        case 1:
            [buttonOne setBackgroundColor:[UIColor whiteColor]];
            [secureInputArray addObject:@1];
            break;
        case 2:
            [buttonTwo setBackgroundColor:[UIColor whiteColor]];
            [secureInputArray addObject:@2];
            break;
        case 3:
            [buttonThree setBackgroundColor:[UIColor whiteColor]];
            [secureInputArray addObject:@3];
            break;
        default :
            break;
    }
    NSLog(@"Secure array: %@", secureInputArray);
    NSString * input = [[secureInputArray valueForKey:@"description"] componentsJoinedByString:@" "];
    secureInput.text = input;
    if ([secureInputArray count] == 3) {
        NSArray *correctSecureInput = [[NSArray alloc]initWithObjects:@1, @3, @2, nil];
        if ([secureInputArray isEqual:correctSecureInput]) {
            [self correctSecureInput];
        } else {
            [self wrongSecureInput];
        }
    }
}

-(void) correctSecureInput {
    secureView.layer.borderColor = Rgb2UIColor(145, 199, 177).CGColor;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                   message:@"You are successfuly authorized!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
        [self reloadView];
    }];
    alert.view.tintColor = [UIColor redColor];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) reloadView {
    usernameField.layer.opacity = 1.0;
    passwordField.layer.opacity = 1.0;
    authorizeButton.layer.opacity = 1.0;
    _correctPasswordInput = true;
    _correctUsernameInput = true;
    [usernameField.layer setBorderColor:Rgb2UIColor(76, 92, 104).CGColor];
    [passwordField.layer setBorderColor:Rgb2UIColor(76, 92, 104).CGColor];
    usernameField.text = @"";
    passwordField.text = @"";
    usernameField.enabled = true;
    passwordField.enabled = true;
    authorizeButton.enabled = true;
    secureView.layer.borderColor = [UIColor whiteColor].CGColor;
    [secureInputArray removeAllObjects];
    secureInput.text = @"_";
    [secureView removeFromSuperview];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==usernameField || textField == passwordField)
    {
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c])
            {
                return NO;
            }
        }
        return YES;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == usernameField)
    {
        if (self.correctUsernameInput == false)
        {
            usernameField.text = @"";
        }
    }
    
    if (textField == passwordField)
    {
        if (self.correctPasswordInput == false)
        {
            passwordField.text = @"";
        }
    }
}

-(void) wrongSecureInput {
    secureView.layer.borderColor = Rgb2UIColor(194, 1, 20).CGColor;
    secureInput.text = @"_";
    [secureInputArray removeAllObjects];
}

-(void) roundButtonHighlight:(UIButton*)sender {
    NSNumber *buttonNum = (NSNumber *)[sender.layer valueForKey:@"buttonNum"];
    
    switch([buttonNum intValue]){
        case 1:
            [buttonOne setBackgroundColor:[Rgb2UIColor(128, 164, 237) colorWithAlphaComponent:0.2]];
            break;
        case 2:
            [buttonTwo setBackgroundColor:[Rgb2UIColor(128, 164, 237) colorWithAlphaComponent:0.2]];
            break;
        case 3:
            [buttonThree setBackgroundColor:[Rgb2UIColor(128, 164, 237) colorWithAlphaComponent:0.2]];
            break;
        default :
            break;
    }
}

-(void) failedAuthhorization {
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [textField.layer setBorderColor:Rgb2UIColor(76, 92, 104).CGColor];
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == usernameField) {
        [usernameField resignFirstResponder];
        //        [passwordField becomeFirstResponder];
    }
    if(textField == passwordField) {
        [passwordField resignFirstResponder];
    }
    return YES;
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{

    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -30;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}

@end
