// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum SKRoute {

    /// Returns cached network info if available
    public static func networkInfo() async -> NetworkInfo? {
        await WiFiInfoProvider.shared.currentNetwork()
    }

    /// Forces refresh from system APIs
    public static func refresh() async -> NetworkInfo? {
        await WiFiInfoProvider.shared.refresh()
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
}
