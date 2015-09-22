/* This file provided by Facebook is for non-commercial testing and evaluation
 * purposes only.  Facebook reserves all rights not expressly granted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "SombreQuoteComponent.h"

#import "QuoteWithBackgroundComponent.h"
#import "QuoteContext.h"

@implementation SombreQuoteComponent
{
    NSString *_string;
}

+ (instancetype)newWithText:(NSDictionary *)dict context:(QuoteContext *)context
{
    /*
    UIColor *color =[UIColor colorWithRed:0.1 green:0.4 blue:0.1 alpha:0.9];
    
    return [super
            newWithView:{[UIView class]} // Need a view so supercomponent can animate this component.
            component:
            [CKInsetComponent
             newWithInsets:{.left = 0, .right = 0}
             component:
             [CKCenterLayoutComponent
              newWithCenteringOptions:CKCenterLayoutComponentCenteringY
              sizingOptions:CKCenterLayoutComponentSizingOptionMinimumY
              child:
              [CKBackgroundLayoutComponent
               newWithComponent:
               [CKInsetComponent
                newWithInsets:{.top = 0, .left = 0, .bottom = 0, .right = 0}
                component:
                [CKStackLayoutComponent
                 newWithView:{}
                 size:{}
                 style:{
                     .alignItems = CKStackLayoutAlignItemsCenter
                 }
                 children:{
                     {
                         [CKComponent
                          newWithView:{
                              
                              [UIImageView class],
                              {
                                  {@selector(setImage:), [UIImage imageNamed:@"bg1"]},
                                  {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)},
                                  {@selector(setClipsToBounds:), @YES},
                              }
                          }
                          size:{[UIScreen mainScreen].bounds.size.width*0.25-10,[UIScreen mainScreen].bounds.size.width*0.25-10}]
                     },
                     
                     {[CKLabelComponent
                       newWithLabelAttributes:{
                           .string = [dict objectForKey:@"text"],
                           .color = [UIColor whiteColor],
                           .font = [UIFont fontWithName:@"Cochin-Bold" size:45.0],
                           .alignment = NSTextAlignmentCenter
                       }
                       viewAttributes:{
                           {@selector(setBackgroundColor:), [UIColor clearColor]},
                           {@selector(setUserInteractionEnabled:), @NO},
                       }]
                     },
                     {[CKLabelComponent
                       newWithLabelAttributes:{
                           .string = @"NO",
                           .color = [UIColor whiteColor],
                           .font = [UIFont fontWithName:@"Cochin" size:20.0],
                           .alignment = NSTextAlignmentCenter
                       }
                       viewAttributes:{
                           {@selector(setBackgroundColor:), [UIColor clearColor]},
                           {@selector(setUserInteractionEnabled:), @NO},
                       }],
                         .spacingBefore = 20
                     }
                 }]]
               background:
               [CKComponent
                newWithView:{
                    [UIView class],
                    {
                        {@selector(setBackgroundColor:), color},
                        {CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @10.0}
                    }
                }
                size:{}]]
              size:{}]]];
     */
    
     /*
    return [super newWithComponent:
            [CKStackLayoutComponent
             newWithView:{
             
                 [UIView class],
                 {
                     {@selector(setBackgroundColor:),[UIColor redColor]},
                     {@selector(setContentMode:), @(UIViewContentModeTop)},
                    // {@selector(setClipsToBounds:), @YES},
                     //{@selector(setAutoresizesSubviews:),@(UIViewAutoresizingFlexibleTopMargin)},
                     //{CKComponentTapGestureAttribute(@selector(didTap:))}
                     
                    // {@selector(setAutoresizingMask:),@(UIViewAutoresizingFlexibleTopMargin)},
                     //{@selector(set)}
                     
                 }
                 
             
             }
             size:{}
             style:{
                 //.justifyContent = CKStackLayoutJustifyContentStart,
                 //.direction = CKStackLayoutDirectionVertical,
                 //.alignItems = CKStackLayoutAlignItemsStretch
             }
             children:{
                 {[CKLabelComponent
                   newWithLabelAttributes:{
                       .string = [[dict objectForKey:@"text"] uppercaseString],
                       .color = [UIColor darkGrayColor],
                       .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                       .alignment = NSTextAlignmentCenter,
                       // .maximumNumberOfLines=1
                       
                       
                   }
                   
                   viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @YES},
                   }],
                     .flexShrink = NO,
                     .flexGrow=NO,
                     .spacingBefore = 3
                 },
                 {[CKLabelComponent
                   newWithLabelAttributes:{
                       .string = [[dict objectForKey:@"text"] uppercaseString],
                       .color = [UIColor darkGrayColor],
                       .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                       .alignment = NSTextAlignmentCenter,
                       // .maximumNumberOfLines=1
                       
                       
                   }
                   
                   viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @YES},
                   }],
                     .flexGrow=NO,
                     .flexShrink = NO ,
                     .spacingBefore = 3
                 }
             }]];
    */
  
   
  return [super newWithComponent:
          [QuoteWithBackgroundComponent
           newWithBackgroundColor:[UIColor lightGrayColor]
           quoteComponent:
           [CKInsetComponent
            newWithInsets:{.top = 0, .left = 0, .bottom = 0, .right = 0}
            component:
            [CKStackLayoutComponent
             newWithView:{
                 [UIView class],
                 //{CKComponentTapGestureAttribute(@selector(didTap:))}
             }
             size:{}
             style:{
                 .spacing = 7,
                 .alignItems = CKStackLayoutAlignItemsStretch,
                 .justifyContent = CKStackLayoutJustifyContentStart,
                 
                 .direction = CKStackLayoutDirectionVertical
             }
             children:{
               {
                   [CKComponent
                    newWithView:{
                        
                        [UIImageView class],
                        {
                            {@selector(setImage:), [UIImage imageNamed:[dict objectForKey:@"image"]]},
                            {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)},
                            {@selector(setClipsToBounds:), @YES},
                        }
                        
                    }
                    
                    size:{[UIScreen mainScreen].bounds.size.width*0.25-10,[UIScreen mainScreen].bounds.size.width*0.25-10}],
                   .flexGrow=YES,
               },
               {[CKLabelComponent
                 newWithLabelAttributes:{
                   .string = [[dict objectForKey:@"text"] uppercaseString],
                   .color = [UIColor darkGrayColor],
                   .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                    .alignment = NSTextAlignmentCenter,
                    // .maximumNumberOfLines=1
                     
                     
                 }
                 
                 viewAttributes:{
                   {@selector(setBackgroundColor:), [UIColor clearColor]},
                   {@selector(setUserInteractionEnabled:), @YES},
                 }],
                   .flexShrink = YES,
                   .spacingBefore = 3
               },
                 
                 {[CKLabelComponent
                   newWithLabelAttributes:{
                       .string = [[dict objectForKey:@"text"] uppercaseString],
                       .color = [UIColor redColor],
                       .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                       .alignment = NSTextAlignmentCenter,
                      // .maximumNumberOfLines=1
                   }
                   viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @YES},
                   }],
                     .flexShrink = YES,
                     .spacingBefore = -5
                 },
                 
             
             }]]]];;
     
  
}



-(void)didTap:(CKComponent*)sender
{
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"componentInfo" object:@""];
}

@end
