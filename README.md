# SKRoute

Modern WiFi Information Framework for iOS built with Swift Concurrency and Swift Package Manager.

## Features

* Async/Await API
* Swift 6 Compatible
* Actor-based thread safety
* WiFi SSID retrieval
* WiFi BSSID retrieval
* Cached network information
* Swift Package Manager support
* iOS 14+

## Requirements

| Requirement | Version |
| ----------- | ------- |
| iOS         | 14.0+   |
| Swift       | 6.0+    |
| Xcode       | 16.0+   |

## Installation

### Swift Package Manager

In Xcode:

1. File → Add Package Dependencies
2. Enter the repository URL:

```text
https://github.com/sujeetshrivastav-ss/SKRoute.git
```

3. Select the latest version.

Or add directly in Package.swift:

```swift
dependencies: [
    .package(
        url: "https://github.com/sujeetshrivastav-ss/SKRoute.git",
        from: "1.2.0"
    )
]
```

## Required Capabilities

Apple requires access permissions before WiFi information can be retrieved.

### Info.plist

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Location access is required to retrieve WiFi information.</string>
```

### Capabilities

Enable:

* Access WiFi Information

### Notes

NEHotspotNetwork.fetchCurrent() may return nil when:

* Location permission has not been granted
* WiFi Information capability is not enabled
* Device is not connected to WiFi
* Running on Simulator

## Usage

### Get Current SSID

```swift
import SKRoute

Task {
    let ssid = await SKRoute.ssid()
    print(ssid ?? "No WiFi")
}
```

### Get Current BSSID

```swift
import SKRoute

Task {
    let bssid = await SKRoute.bssid()
    print(bssid ?? "No BSSID")
}
```

### Get Complete Network Information

```swift
import SKRoute

Task {
    if let network = await SKRoute.networkInfo() {
        print("SSID:", network.ssid ?? "")
        print("BSSID:", network.bssid ?? "")
    }
}
```

### Force Refresh

```swift
import SKRoute

Task {
    let refreshedNetwork = await SKRoute.refresh()

    print(refreshedNetwork?.ssid ?? "")
}
```

## Cellular Information

Retrieve information about the active cellular connection.

### Usage

```swift
import SKRoute

let cellularInfo = SKRoute.cellularInfo()

print(cellularInfo.accessTechnology ?? "")
print(cellularInfo.serviceIdentifier ?? "")
print(cellularInfo.ipAddress ?? "")
print(cellularInfo.subnetMask ?? "")
```

### Individual APIs

```swift
SKRoute.cellularAccessTechnology()

SKRoute.cellularServiceIdentifier()

SKRoute.cellularIPAddress()

SKRoute.cellularSubnetMask()
```

### Supported Technologies

* LTE
* 5G NSA
* 5G SA
* Dual SIM
* eSIM

## Example

```swift
import SwiftUI
import SKRoute

struct ContentView: View {

    @State private var ssid: String = "Loading..."

    var body: some View {
        Text(ssid)
            .task {
                ssid = await SKRoute.ssid() ?? "Unknown Network"
            }
    }
}
```

## Architecture

```text
Application
      │
      ▼
   SKRoute
      │
      ▼
WiFiInfoProvider (Actor)
      │
      ▼
NEHotspotNetwork
      │
      ▼
NetworkInfo
```

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Open a Pull Request

## License

MIT License
