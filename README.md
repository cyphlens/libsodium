# Libsodium

Please refer to the Libsodium official page for latest code, license and release notes.
[Official libsodium Github page](https://github.com/jedisct1/libsodium).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Make sure to have installed [CocoaPods](https://cocoapods.org).

## Installation

### Swift Package Manager

**1. Add the package**

In **Xcode:** **File → Add Package Dependencies…** and enter:

```
https://github.com/cyphlens/libsodium.git
```

Or in your own **Package.swift**:

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

**2. Link the library**

- **Xcode:** Select your app target → **General** → **Frameworks, Libraries, and Embedded Content** → **+** → choose **libsodium**.
- **Package.swift:** Add `"libsodium"` to that target’s `dependencies` (as above).

**3. Import and use**

**Swift** — use the C module (no direct Swift API; call C APIs via the module):

```swift
import libsodium

// Example: initialize and use C functions
sodium_init()
// Use crypto_* functions as needed (they are exposed from the C layer)
```

**C** — include the main header:

```c
#include <sodium.h>

int main(void) {
    if (sodium_init() < 0) return 1;
    // use crypto_* functions...
    return 0;
}
```

**Objective-C** — same as C:

```objc
#import <sodium.h>

// Then use sodium_init(), crypto_* functions, etc.
```

**Troubleshooting**

- **'sodium.h' file not found** — Your target must link the **libsodium** product. In Xcode: target → **Frameworks, Libraries, and Embedded Content** → **+** → **libsodium**. The header search path is set automatically when the library is linked.

### CocoaPods

We made Libsodium available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
  pod 'libsodium', :git => 'https://github.com/cyphlens/libsodium.git', :tag => '1.0.20'
```

## License

Libsodium is available under the ISC license as described on their [Github page](https://github.com/jedisct1/libsodium).
