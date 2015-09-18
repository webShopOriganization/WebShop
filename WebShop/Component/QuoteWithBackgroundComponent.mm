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

#import "QuoteWithBackgroundComponent.h"

@implementation QuoteWithBackgroundComponent

+ (instancetype)newWithBackgroundColor:(UIColor *)color
                        quoteComponent:(CKComponent *)quoteComponent

{
    return [super newWithComponent:
            [CKBackgroundLayoutComponent
             newWithComponent:quoteComponent
             
             
             background:
             [CKComponent
              newWithView:{
                  
                  [UIView class],
                  {
                      {@selector(setBackgroundColor:),color},
                      {@selector(setContentMode:), @(UIViewContentModeScaleToFill)},
                      {@selector(setClipsToBounds:), @YES},
                      {@selector(setAutoresizesSubviews:),@(UIViewAutoresizingFlexibleTopMargin)},
                      //{CKComponentTapGestureAttribute(@selector(didTap:))}
                      
                      
                  }
                  
                  
              }
              size:{90,90}
              
              
              ]]];
}

-(void)didTap:(CKComponent*)sender
{
    NSLog(@"错误");
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"componentInfo" object:@""];
}



@end
