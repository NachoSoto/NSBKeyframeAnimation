NSKeyframeAnimation
---------------

I started implementing this class as part of one of the demos in the CoreAnimation class I gave in Madrid on July 2012 (http://www.youtube.com/watch?v=54ESi6snSfI). I decided to finish it and create a sample project with it.

NSKeyframeAnimation allows you to create jQuery-like animations with a high level interface in a similar way as you would do with ```-[UIView animateWithDuration:delay:options:animations:completion:]```, but with any kind of function. You can animate any keypath between two values (for now they have to be scalar but I'll add support for any ```NSValue```).

<img src="http://cl.ly/image/171Y2J302H2K/iOS%20Simulator%20Screen%20shot%20Aug%2012,%202012%2011.05.22%20PM.png" alt="NSKeyframeAnimation" title="NSKeyframeAnimation" style="display:block; margin: 10px auto 30px auto;" class="center">

## Example:
```objc
NSKeyframeAnimation *animation = [NSKeyframeAnimation animationWithKeyPath:@"position.x"
                                                                  duration:5
                                                                startValue:0
                                                                  endValue:1000
                                                                  function:NSKeyframeAnimationFunctionEaseInOutCubic];

[view.layer setValue:animation.values.lastObject forKeyPath:@"position.x"];
[view.layer addAnimation:animation forKey:@"position.x"];
```

## How To Use
- Run ```git submodule add https://github.com/NachoSoto/NSKeyframeAnimation Dependencies/NSKeyframeAnimation```
- Add ```Dependencies/NSKeyframeAnimation/Classes/NSKeyframeAnimation``` files to your project.
- You're all set!

## Licence
NSKeyframeAnimation is available under the MIT license. See the LICENSE file for more info.