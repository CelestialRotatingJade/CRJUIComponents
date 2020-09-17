//
//  easing.h
//
//  Copyright (c) 2011, Auerhaus Development, LLC
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What The Fuck You Want
//  To Public License, Version 2, as published by Sam Hocevar. See
//  http://sam.zoy.org/wtfpl/COPYING for more details.
//  

#ifndef AH_EASING_H
#define AH_EASING_H

#if defined(__LP64__) && !defined(AH_EASING_USE_DBL_PRECIS)
#define AH_EASING_USE_DBL_PRECIS
#endif

#ifdef AH_EASING_USE_DBL_PRECIS
#define CRJAHFloat double
#else
#define CRJAHFloat float
#endif

typedef CRJAHFloat (*CRJAHEasingFunction)(CRJAHFloat);

// Linear interpolation (no easing)
CRJAHFloat CRJLinearInterpolation(CRJAHFloat p);

// Quadratic easing; p^2
CRJAHFloat CRJQuadraticEaseIn(CRJAHFloat p);
CRJAHFloat CRJQuadraticEaseOut(CRJAHFloat p);
CRJAHFloat CRJQuadraticEaseInOut(CRJAHFloat p);

// Cubic easing; p^3
CRJAHFloat CRJCubicEaseIn(CRJAHFloat p);
CRJAHFloat CRJCubicEaseOut(CRJAHFloat p);
CRJAHFloat CRJCubicEaseInOut(CRJAHFloat p);

// Quartic easing; p^4
CRJAHFloat CRJQuarticEaseIn(CRJAHFloat p);
CRJAHFloat CRJQuarticEaseOut(CRJAHFloat p);
CRJAHFloat CRJQuarticEaseInOut(CRJAHFloat p);

// Quintic easing; p^5
CRJAHFloat CRJQuinticEaseIn(CRJAHFloat p);
CRJAHFloat CRJQuinticEaseOut(CRJAHFloat p);
CRJAHFloat CRJQuinticEaseInOut(CRJAHFloat p);

// Sine wave easing; sin(p * PI/2)
CRJAHFloat CRJSineEaseIn(CRJAHFloat p);
CRJAHFloat CRJSineEaseOut(CRJAHFloat p);
CRJAHFloat CRJSineEaseInOut(CRJAHFloat p);

// Circular easing; sqrt(1 - p^2)
CRJAHFloat CRJCircularEaseIn(CRJAHFloat p);
CRJAHFloat CRJCircularEaseOut(CRJAHFloat p);
CRJAHFloat CRJCircularEaseInOut(CRJAHFloat p);

// Exponential easing, base 2
CRJAHFloat CRJExponentialEaseIn(CRJAHFloat p);
CRJAHFloat CRJExponentialEaseOut(CRJAHFloat p);
CRJAHFloat CRJExponentialEaseInOut(CRJAHFloat p);

// Exponentially-damped sine wave easing
CRJAHFloat CRJElasticEaseIn(CRJAHFloat p);
CRJAHFloat CRJElasticEaseOut(CRJAHFloat p);
CRJAHFloat CRJElasticEaseInOut(CRJAHFloat p);

// Overshooting cubic easing; 
CRJAHFloat CRJBackEaseIn(CRJAHFloat p);
CRJAHFloat CRJBackEaseOut(CRJAHFloat p);
CRJAHFloat CRJBackEaseInOut(CRJAHFloat p);

// Exponentially-decaying bounce easing
CRJAHFloat CRJBounceEaseIn(CRJAHFloat p);
CRJAHFloat CRJBounceEaseOut(CRJAHFloat p);
CRJAHFloat CRJBounceEaseInOut(CRJAHFloat p);

#endif
