// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

    /// Main entry point for retrieving network information.
public enum SKRoute {
    
    // MARK: - WiFi
    
    /// Returns current WiFi information.
    public static func wifiInfo() async -> WiFiInfo? {
        await WiFiInfoProvider.shared.wifiInfo()
    }
    
    /// Refreshes and returns current WiFi information.
    public static func refreshWiFiInfo() async -> WiFiInfo? {
        await WiFiInfoProvider.shared.refresh()
    }
    
    /// Returns current WiFi SSID.
    public static func ssid() async -> String? {
        await wifiInfo()?.ssid
    }
    
    /// Returns current WiFi BSSID.
    public static func bssid() async -> String? {
        await wifiInfo()?.bssid
    }
    
    /// Returns current WiFi SSID data.
    public static func ssidData() async -> Data? {
        await wifiInfo()?.ssidData
    }
    
    // MARK: - Network Interface
    
    /// Returns current network interface information.
    public static func networkInterfaceInfo() -> NetworkInterfaceInfo {
        InterfaceProvider.currentInterface()
    }
    
    /// Returns current IP address.
    public static func ipAddress() -> String? {
        networkInterfaceInfo().ipAddress
    }
    
    /// Returns current subnet mask.
    public static func subnetMask() -> String? {
        networkInterfaceInfo().subnetMask
    }
    
    /// Returns current destination address.
    public static func destination() -> String? {
        networkInterfaceInfo().destination
    }
    
    /// Returns true when WiFi interface is available.
    public static func isWiFiConnected() -> Bool {
        ipAddress() != nil
    }
    
    // MARK: - Cellular
    
    /// Returns current cellular information.
    public static func cellularInfo() -> CellularInfo {
        CellularInfoProvider.cellularInfo()
    }
    
    /// Returns true if a cellular interface exists.
    public static func isCellularAvailable() -> Bool {
        CellularInterfaceProvider.isCellularAvailable()
    }
    
    /// Returns true if cellular data service is active.
    public static func hasActiveCellularData() -> Bool {
        CellularInfoProvider.hasActiveDataService()
    }
    
    // MARK: - Active Network
    
    /// Returns currently active network information.
    public static func activeNetworkInfo() async -> ActiveNetworkInfo {
        await ActiveNetworkProvider.activeNetworkInfo()
    }
    
    /// Returns currently active network type.
    public static func activeNetworkType() async -> NetworkType {
        await activeNetworkInfo().networkType
    }
    
    // MARK: - Complete Network Information
    
    /// Returns complete network information.
    public static func completeNetworkInfo() async -> CompleteNetworkInfo {
        
        async let wifiInfo = wifiInfo()
        async let activeNetworkInfo = activeNetworkInfo()
        
        let cellularInfo: CellularInfo? =
        isCellularAvailable()
        ? CellularInfoProvider.cellularInfo()
        : nil
        
        let interfaceInfo = networkInterfaceInfo()
        
        return await CompleteNetworkInfo(
            wifi: wifiInfo,
            cellular: cellularInfo,
            interface: interfaceInfo,
            activeNetwork: activeNetworkInfo
        )
    }
}
