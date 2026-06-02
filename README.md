# SKRoute
Modern WiFi Network Information Framework for iOS using Swift Concurrency

## Features

- Async/Await
- Swift Concurrency
- Actor-based caching
- Swift Package Manager
- iOS 14+

## Installation

```swift
dependencies: [
    .package(
        url: "https://github.com/sujeetshrivastav-ss/SKRoute.git",
        from: "1.0.0"
    )
]
```

## Usage

```swift
import SKRoute

Task {

    let ssid = await SKRoute.ssid()

    print(ssid ?? "No WiFi")
}
```

### Full Network Info

```swift
if let info = await SKRoute.networkInfo() {

    print(info.ssid)
    print(info.bssid)
}
```

## Requirements

### Capabilities

Enable:

- Access WiFi Information

### Entitlements

```xml
com.apple.developer.networking.wifi-info
```

## License

MIT
