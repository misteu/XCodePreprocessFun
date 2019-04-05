## Active Compilation Conditions:

### Whats that?

from XCode 8 release notes:

>Active Compilation Conditions is a new build setting for passing conditional compilation flags to the Swift compiler. Each element of the value of this setting passes to swiftc prefixed with -D, in the same way that elements of Preprocessor Macros pass to clang with the same prefix. (22457329)

👍 Easiest to use, just put ALPHA, DEBUG etc. there (no -D stuff needed, XCode handles that for you)

### When to use?
Everytime you want to do build target dependent stuff inside your Swift code. Like switching API-keys and stuff.

## Preprocessor macros:

### Whats that?
tags will be prefixed with -D (same as Active Compilation Conditions)

source: https://stackoverflow.com/questions/38813906/swift-how-to-use-preprocessor-flags-like-if-debug-to-implement-api-keys/47395485

### When to use?
Like Active Compilation Conditions but only relevant for ObjC compiler.

## Other C/Swift Flags:

### Whats that?
Preprocessor flags sent directly to compiler, has to have -D in front of it. Otherwise the compiler handles your tag as a folder or does other crazy stuff.

### When to use?
Error-prone if used incorrectly, do not use if not absolutely necessary. Recommendation: Use Active Compilation Conditions (Swift) or Preprocessor macros (ObjC). In most cases that will be sufficient.

Source: https://fdp.io/blog/2018/03/18/active-compilation-conditions-for-xcode/

## info.plist Preprocessor Definitions:

### What for?
Doing cool stuff inside info.plist depending on build target (like changing bundle Id, App name etc)

### How to use?
Must not have -D prefixed (like preprocessor macros or active compilation cond.)

**Attention:** in plist #elseif is not allowed!

### When to use?
Everytime you want to do stuff in one single info.plist depending on your build target.


## info.plist Other Preprocessor Flags:

### What for?
Like info.plist Preprocessor Definitions but less handy and error prone (like other C/Swift Flags)

### How to use?
Must have -D prefixed or won't compile

### When to use?
Do not use unless you need to (like other C/Swift Flags)
