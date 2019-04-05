## In short
You can mix up and use everything together. 

For clarity, simplicity and faster debugging, it's recommended to prefer the simpler and safer tags.

With that in mind: **Do** use "Active Compilation" conditions (Swift), "Preprocessor Macros" (ObjC) and "info.plist Preprocessor Definition"

**Do not** use "Other Swift Flags", "Other C Flags" and "info.plist Other Preprocessor Flags" (unless not absoulutely necessary, maybe some SDKs need them)

![use easy tags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/useDoNotUse.png)

## Debugging at a glance

If everything is working correctly, your code should be highlighted depending on the selected build target. If not, check your code and your target settings.

![Debugging of compiler tags](https://raw.githubusercontent.com/misteu/XCodePreprocessingFun/master/imgs/BuildSettingsHighlighting.gif)

## 👍 Active Compilation Conditions:

### Whats that?

from XCode 8 release notes:

>Active Compilation Conditions is a new build setting for passing conditional compilation flags to the Swift compiler. Each element of the value of this setting passes to swiftc prefixed with -D, in the same way that elements of Preprocessor Macros pass to clang with the same prefix. (22457329)

Easiest to use, just put ALPHA, DEBUG etc. there. You must not use -D, XCode handles that for you.

![wrong tag](https://raw.githubusercontent.com/misteu/XCodePreprocessingFun/master/imgs/WrongActiveCompilCond.png)

### When to use?
Everytime you want to do build target dependent stuff inside your Swift code. Like switching API-keys and stuff.

## 👍 Preprocessor Macros:

### Whats that?
tags will be prefixed with -D (same as Active Compilation Conditions)

source: https://stackoverflow.com/questions/38813906/swift-how-to-use-preprocessor-flags-like-if-debug-to-implement-api-keys/47395485

### When to use?
Like Active Compilation Conditions but only relevant for ObjC compiler.

You must not use -D here. Trying to build will result in wild error messages.
![do not use -D parameter for Preprocessor Macros](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/WrongPreprocessorMacro.png)

## 🤔 Other C/Swift Flags:

### Whats that?
Preprocessor flags sent directly to compiler, has to have -D in front of it. Otherwise the compiler handles your tag as a folder or does other crazy stuff.

### When to use?
Error-prone if used incorrectly, do not use if not absolutely necessary. Recommendation: Use Active Compilation Conditions (Swift) or Preprocessor macros (ObjC). In most cases that will be sufficient.

Source: https://fdp.io/blog/2018/03/18/active-compilation-conditions-for-xcode/

Your code will not compile if you forget the prefixing -D. You can use "" but don't need to. So why should I use them?
![missing -D prefix](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/WrongOtherFlag.png)
![missing -D prefix for other swift](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/wrongOtherSwiftTag.png)

## 👍 info.plist Preprocessor Definitions:

### What for?
Doing cool stuff inside info.plist depending on build target (like changing bundle Id, App name etc)

### How to use?
Must not have -D prefixed (like preprocessor macros or active compilation cond.)

**Attention:** in plist #elseif is not allowed!

![elseif in plist crashes build](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/plistElseIfWontWork.png)

![use if endif only in plist](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/plistConditions.png)

Mixing for plist preprocessing does not work the same as for Swift/C preprocessing:
![attention when mixing plist tags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/plistMustBeSame.png)

You have to activate preprocessing for all of your targets or #if #endif inside your plist will crash the build. Default setting is no!
![Activate Preprocessing](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/changePreprocessPlist.png)

Preprocessor Defintions have higher priority than "info.plist Other Preprocessor Flags"

[priority of plist preprocessor flags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/plistPriority.png)

### When to use?
Everytime you want to do stuff in one single info.plist depending on your build target.


## 🤔 info.plist Other Preprocessor Flags:

### What for?
Like info.plist Preprocessor Definitions but less handy and error prone (like other C/Swift Flags)

### How to use?
Must have -D prefixed or won't compile

### When to use?
Do not use unless you need to (like other C/Swift Flags)

If you do not prefix the -D, its handled like a folder. This may cause strange errors. In best case it will crash the build.
![pay attention to the -D tag](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/preprocess_InfoPlist.png)

## 😕 Mixed Tags

Double set tags will build and behave as expected.

![mixup tags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/doubleTagsCompile.png)

Missing tags are interpreted as FALSE

![empty tags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/missingTagsCompileAndFalse.png)

Missing tags will be overwritten

![overwriting tags](https://github.com/misteu/XCodePreprocessingFun/blob/master/imgs/missingTagsOverwritten.png)
