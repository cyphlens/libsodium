# Libsodium

Please refer to the Libsodium official page for latest code, license and release notes.
[Official libsodium Github page](https://github.com/jedisct1/libsodium).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Make sure to have installed [CocoaPods](https://cocoapods.org).

## Installation

### Swift Package Manager

Add libsodium to your project in Xcode via **File → Add Package Dependencies…** and enter:

```
https://github.com/cyphlens/libsodium.git
```

Or add this to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/cyphlens/libsodium.git", from: "1.0.20"),
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["libsodium"]
    ),
]
```

**Using from C or Objective-C:** Add the `libsodium` library to your target’s **Frameworks, Libraries, and Embedded Content**. Then in C:

```c
#include <sodium.h>

// Optional: use module import in Objective-C
// #import <libsodium/sodium.h>
```

If you see **'sodium.h' file not found**, ensure your target actually links the `libsodium` product (Xcode: target → General → Frameworks, Libraries, and Embedded Content → + → libsodium). The header search path is set automatically when the dependency is linked.

### CocoaPods

We made Libsodium available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
  pod 'libsodium', :git => 'https://github.com/cyphlens/libsodium.git', :tag => '1.0.20'
```

## License

Libsodium is available under the ISC license as described on their [Github page](https://github.com/jedisct1/libsodium).
