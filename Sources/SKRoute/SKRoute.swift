// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum SKRoute {
    
    // MARK: WiFi
    
    public static func networkInfo() async -> NetworkInfo? {
        await WiFiInfoProvider.shared
            .networkInfo()
    }
    
    public static func refresh() async -> NetworkInfo? {
        await WiFiInfoProvider.shared
            .refresh()
    }
    
    public static func ssid() async -> String? {
        await networkInfo()?.ssid
    }
    
    public static func bssid() async -> String? {
        await networkInfo()?.bssid
    }
    
    public static func ssidData() async -> Data? {
        await networkInfo()?.ssidData
    }
    
    // MARK: - Wifi
    public static func ipAddress() -> String? {
        InterfaceProvider
            .currentInterface()
            .ipAddress
    }
    
    public static func netmask() -> String? {
        InterfaceProvider
            .currentInterface()
            .netmask
    }
    
    public static func destination() -> String? {
        InterfaceProvider
            .currentInterface()
            .destination
    }
    
    public static func isWiFiConnected() -> Bool {
        ipAddress() != nil
    }
    
    // MARK: - Cellular
    /// Returns current cellular network information.
    public static func cellularInfo() -> CellularInfo {
        CellularInfoProvider.cellularInfo()
    }
    
    /// Returns current cellular access technology.
    public static func cellularAccessTechnology() -> String? {
        cellularInfo().accessTechnology
    }
    
    /// Returns current cellular service identifier.
    public static func cellularServiceIdentifier() -> String? {
        cellularInfo().serviceIdentifier
    }
    
    /// Returns current cellular IP address.
    public static func cellularIPAddress() -> String? {
        cellularInfo().ipAddress
    }
    
    /// Returns current cellular subnet mask.
    public static func cellularSubnetMask() -> String? {
        cellularInfo().subnetMask
    }
}
