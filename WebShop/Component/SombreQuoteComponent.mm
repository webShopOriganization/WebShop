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
    
  return [super newWithComponent:
          [QuoteWithBackgroundComponent
           newWithBackgroundColor:[UIColor whiteColor]
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
             style:{.spacing = 7}
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
                    size:{[UIScreen mainScreen].bounds.size.width*0.25-10,[UIScreen mainScreen].bounds.size.width*0.25-10}]
               },
               {[CKLabelComponent
                 newWithLabelAttributes:{
                   .string = [[dict objectForKey:@"text"] uppercaseString],
                   .color = [UIColor darkGrayColor],
                   .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                    .alignment = NSTextAlignmentCenter,
                     .maximumNumberOfLines=1
                     
                 }
                 
                 viewAttributes:{
                   {@selector(setBackgroundColor:), [UIColor clearColor]},
                   {@selector(setUserInteractionEnabled:), @YES},
                 }],
                   .spacingBefore = 3
               },
                 
                 {[CKLabelComponent
                   newWithLabelAttributes:{
                       .string = [[dict objectForKey:@"text"] uppercaseString],
                       .color = [UIColor redColor],
                       .font = [UIFont fontWithName:@"Avenir-Black" size:15],
                       .alignment = NSTextAlignmentCenter,
                       .maximumNumberOfLines=1
                   }
                   viewAttributes:{
                       {@selector(setBackgroundColor:), [UIColor clearColor]},
                       {@selector(setUserInteractionEnabled:), @YES},
                   }],
                     .spacingBefore = -5
                 },
                 
             
             }]]]];;
}



-(void)didTap:(CKComponent*)sender
{
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"componentInfo" object:@""];
}

@end
