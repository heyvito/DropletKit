#import "Promise.h"

#import "Promise+When.h"
#import "Promise+Until.h"
#import "Promise+Pause.h"
#import "Promise+Join.h"


#ifndef PMK_NO_UNPREFIXATION
// I used a typedef but it broke the tests, turns out typedefs are new
// types that have consequences with isKindOfClass and that
// NOTE I will remove this at 1.1
typedef PMKPromise Promise PMK_DEPRECATED("Use PMKPromise. Use of Promise is deprecated. This is a typedef, and since it is a typedef, there may be unintended side-effects.");
#endif
