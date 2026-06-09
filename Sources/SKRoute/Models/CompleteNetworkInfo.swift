//
//  CompleteNetworkInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents complete device network information.
public struct CompleteNetworkInfo: Sendable {

    /// WiFi information.
    public let wifi: WiFiInfo?

    /// Cellular information.
    public let cellular: CellularInfo?

    /// Network interface information.
    public let interface: NetworkInterfaceInfo?

    /// Active network information.
    public let activeNetwork: ActiveNetworkInfo

    public init(
        wifi: WiFiInfo?,
        cellular: CellularInfo?,
        interface: NetworkInterfaceInfo?,
        activeNetwork: ActiveNetworkInfo
    ) {
        self.wifi = wifi
        self.cellular = cellular
        self.interface = interface
        self.activeNetwork = activeNetwork
    }
}