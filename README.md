NSBKeyframeAnimation
---------------

I started implementing this class as part of one of the demos in the CoreAnimation class I gave in Madrid on July 2012 (http://www.youtube.com/watch?v=54ESi6snSfI). I decided to finish it and create a sample project with it.

NSBKeyframeAnimation allows you to create jQuery-like animations with a high level interface in a similar way as you would do with ```-[UIView animateWithDuration:delay:options:animations:completion:]```, but with any kind of function. You can animate any keypath between two values (for now they have to be scalar but I'll add support for any ```NSValue```).

<img src="http://cl.ly/image/171Y2J302H2K/iOS%20Simulator%20Screen%20shot%20Aug%2012,%202012%2011.05.22%20PM.png" alt="NSBKeyframeAnimation" title="NSBKeyframeAnimation" style="display:block; margin: 10px auto 30px auto;" class="center">

## Example:
```objc
NSBKeyframeAnimation *animation = [NSBKeyframeAnimation animationWithKeyPath:@"position.x"
                                                                    duration:5
                                                                  startValue:0
                                                                    endValue:1000
                                                                    function:NSBKeyframeAnimationFunctionEaseInOutCubic];

[view.layer setValue:animation.values.lastObject forKeyPath:@"position.x"];
[view.layer addAnimation:animation forKey:@"position.x"];
```
## Future improvements
- I'm working on a category to UIView to make using this class a much easier task. Coming soon!
- I will add helper methods so that you can easily generate animations on the ```transform``` keypath and create really cool effects.

## How To Use
- Run ```git submodule add https://github.com/NachoSoto/NSBKeyframeAnimation Dependencies/NSBKeyframeAnimation```
- Add ```Dependencies/NSBKeyframeAnimation/Classes/NSBKeyframeAnimation``` files to your project.
- You're all set!

## Licence
NSBKeyframeAnimation is available under the MIT license. See the LICENSE file for more info.