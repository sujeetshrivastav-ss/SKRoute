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

       // MARK: Interface
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
}
