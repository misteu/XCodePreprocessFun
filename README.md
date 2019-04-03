Active Compilation Conditions:

--> easiest to use, just put ALPHA, DEBUG etc. there (no -D stuff needed, XCode handles that)

from XCode 8 release notes:
Active Compilation Conditions is a new build setting for passing conditional compilation flags to the Swift compiler. Each element of the value of this setting passes to swiftc prefixed with -D, in the same way that elements of Preprocessor Macros pass to clang with the same prefix. (22457329)

Preprocessor macros:

--> only relevant for ObjC compiler, tags will be prefixed with -D (same as Active Compilation Conditions)
https://stackoverflow.com/questions/38813906/swift-how-to-use-preprocessor-flags-like-if-debug-to-implement-api-keys/47395485

Other C/Swift Flags:

--> Sent directly to compiler, has to have -D in front of it, error-prone if used incorrectly, do not use if not absolutely necessaryq

Quelle: https://fdp.io/blog/2018/03/18/active-compilation-conditions-for-xcode/

Preprocessor plist: has to have -D prefixed or won't compile.

info.plist preprocessor definitions: must not have -D prefixed (like preprocessor macros or active compilation cond.)

in plist #elseif is not allowed!