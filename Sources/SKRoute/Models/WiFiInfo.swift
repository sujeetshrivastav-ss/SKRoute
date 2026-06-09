//
//  WiFiInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents WiFi network information.
public struct WiFiInfo: Sendable {

    /// WiFi network name.
    public let ssid: String?

    /// WiFi access point identifier.
    public let bssid: String?

    /// Raw SSID data.
    public let ssidData: Data?

    public init(
        ssid: String?,
        bssid: String?,
        ssidData: Data?
    ) {
        self.ssid = ssid
        self.bssid = bssid
        self.ssidData = ssidData
    }
}