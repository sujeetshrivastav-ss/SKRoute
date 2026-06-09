//
//  Changelog.md
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//

# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2026-06-09

### Added

#### Cellular Information

* CellularInfo model
* CellularInterfaceInfo model
* Cellular availability detection
* Active cellular data detection
* Cellular IP address retrieval
* Cellular subnet mask retrieval
* Cellular network generation support

#### Active Network Detection

* ActiveNetworkInfo model
* NetworkType model
* Active network transport detection
* WiFi detection
* Cellular detection
* Ethernet detection

#### Complete Network Information

* CompleteNetworkInfo model
* Unified network information API

```swift
await SKRoute.completeNetworkInfo()
```

### Improved

* Modernized architecture
* Expanded test coverage
* Additional documentation
* Additional examples

### Removed

* Deprecated CoreTelephony APIs
* Legacy string conversion APIs
* Unused IPAddressProvider

### Technical Improvements

* Swift 6 concurrency compliance
* Sendable model support
* Actor isolation
* Async/Await APIs
* Modern string decoding APIs

---

## [1.3.0] - 2026-06-09

### Added

#### Cellular Information

* Cellular access technology retrieval
* Cellular service identifier retrieval
* Cellular IP address retrieval
* Cellular subnet mask retrieval
* CellularInfo model
* CellularInterfaceInfo model

#### Supported Technologies

* LTE
* 5G NSA
* 5G SA
* Dual SIM devices
* eSIM devices

#### New APIs

```swift
SKRoute.cellularInfo()

SKRoute.cellularAccessTechnology()

SKRoute.cellularServiceIdentifier()

SKRoute.cellularIPAddress()

SKRoute.cellularSubnetMask()
```

### Improvements

* Enhanced network information coverage
* Additional examples and documentation
* Expanded test coverage

---

## [1.2.0] - 2026-06-02

### Added

#### Network Interface Information

* Local IP address retrieval
* Netmask retrieval
* Destination address retrieval
* WiFi connectivity detection

#### Network Monitoring

* NWPathMonitor integration
* AsyncStream support
* Real-time network status updates

#### New Models

* NetworkInterfaceInfo

#### New APIs

```swift
SKRoute.ipAddress()

SKRoute.netmask()

SKRoute.destination()

SKRoute.isWiFiConnected()
```

### Improvements

* Improved package structure
* Additional documentation
* Additional usage examples
* Expanded test coverage

---

## [1.0.0] - 2026-06-02

### Added

#### Swift Package Manager

* Swift Package Manager support
* Modular package structure

#### Swift Concurrency

* Async/Await APIs
* Actor-based thread safety
* Swift 6 compatibility

#### WiFi Information

* SSID retrieval
* BSSID retrieval
* SSID Data retrieval
* NetworkInfo model
* Cached WiFi information

#### New APIs

```swift
await SKRoute.ssid()

await SKRoute.bssid()

await SKRoute.ssidData()

await SKRoute.networkInfo()

await SKRoute.refresh()
```

### Changed

* Migrated from Objective-C to Swift
* Replaced CNCopyCurrentNetworkInfo with NEHotspotNetwork.fetchCurrent
* Replaced synchronous APIs with async/await APIs
* Modernized project structure
