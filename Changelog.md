//
//  Changelog.md
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//

# Changelog

## [1.1.0] - 2026-06-02

### Added

- Swift Package Manager support
- Swift 6 compatibility
- Async/Await APIs
- Actor-based thread-safe architecture
- SSID retrieval
- BSSID retrieval
- SSID Data retrieval
- NetworkInfo model
- Local IP address retrieval
- Netmask retrieval
- Destination address retrieval
- WiFi connection detection
- Network monitoring with AsyncStream support
- Unit tests

### Changed

- Replaced CNCopyCurrentNetworkInfo with NEHotspotNetwork.fetchCurrent
- Replaced synchronous APIs with async/await APIs
- Modernized package structure

### Not Yet Included

- Gateway IP retrieval
- IPv6 support
- Complete network model

### Requirements

* iOS 14+
* Swift 6+
* Xcode 16+
