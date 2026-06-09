# SKRoute

A modern Swift Package for retrieving WiFi, Cellular and Network Interface information using Swift Concurrency.

## Features

### WiFi Information

* SSID
* BSSID
* SSID Data
* Cached WiFi Information

### Network Interface Information

* IP Address
* Subnet Mask
* Destination Address
* WiFi Connectivity Detection

### Cellular Information

* Cellular Availability Detection
* Active Cellular Data Detection
* Cellular IP Address
* Cellular Subnet Mask
* Network Generation (2G / 3G / 4G / 5G)
* Service Identifier

### Active Network Detection

* WiFi
* Cellular
* Ethernet
* Unknown
* None

### Network Monitoring

* NWPathMonitor Integration
* AsyncStream Support
* Real-Time Status Updates

### Modern Architecture

* Swift Package Manager
* Swift Concurrency
* Actor-Based WiFi Provider
* Sendable Models
* Swift 6 Compatible
* No Deprecated APIs

## Requirements

| Requirement | Version |
| ----------- | ------- |
| iOS         | 14.0+   |
| Swift       | 6.0+    |
| Xcode       | 16.0+   |

## Installation

```swift
dependencies: [
    .package(
        url: "https://github.com/sujeetshrivastav-ss/SKRoute.git",
        from: "2.0.0"
    )
]
```

## Usage

### WiFi Information

```swift
let wifi = await SKRoute.wifiInfo()

print(wifi?.ssid ?? "")
print(wifi?.bssid ?? "")
```

### Network Interface Information

```swift
let interface = SKRoute.networkInterfaceInfo()

print(interface.ipAddress ?? "")
print(interface.subnetMask ?? "")
print(interface.destination ?? "")
```

### Cellular Information

```swift
let cellular = SKRoute.cellularInfo()

print(cellular.generation.rawValue)
print(cellular.ipAddress ?? "")
print(cellular.subnetMask ?? "")
```

### Cellular Availability

```swift
let available =
    SKRoute.isCellularAvailable()

let active =
    SKRoute.hasActiveCellularData()
```

### Active Network

```swift
let network =
    await SKRoute.activeNetworkInfo()

print(network.networkType)
```

### Complete Network Information

```swift
let networkInfo =
    await SKRoute.completeNetworkInfo()

print(networkInfo.activeNetwork.networkType)

print(networkInfo.wifi?.ssid ?? "")

print(networkInfo.interface?.ipAddress ?? "")
```

### Network Monitoring

```swift
let monitor = NetworkMonitor()

for await status in await monitor.statuses() {

    print(status)
}
```

## Architecture

```text
SKRoute
│
├── WiFiInfoProvider (Actor)
│   └── NEHotspotNetwork
│
├── InterfaceProvider
│   └── getifaddrs()
│
├── CellularInfoProvider
│   ├── CoreTelephony
│   └── CellularInterfaceProvider
│
├── ActiveNetworkProvider
│   └── NWPathMonitor
│
└── NetworkMonitor
    └── AsyncStream<NWPath.Status>
```

## Models

### WiFiInfo

```swift
WiFiInfo
```

### CellularInfo

```swift
CellularInfo
```

### NetworkInterfaceInfo

```swift
NetworkInterfaceInfo
```

### ActiveNetworkInfo

```swift
ActiveNetworkInfo
```

### CompleteNetworkInfo

```swift
CompleteNetworkInfo
```

## Notes

### WiFi APIs

May return nil when:

* Running on Simulator
* Not connected to WiFi
* Location permission denied
* Access WiFi Information capability not enabled

### Cellular APIs

Availability depends on:

* Device hardware
* SIM/eSIM availability
* Active cellular service

## License

MIT License
