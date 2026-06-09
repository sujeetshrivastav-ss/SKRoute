//
//  CellularInterfaceInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents cellular network interface information.
public struct CellularInterfaceInfo: Sendable {

    /// Cellular interface IP address.
    public let ipAddress: String?

    /// Cellular interface subnet mask.
    public let subnetMask: String?

    public init(
        ipAddress: String?,
        subnetMask: String?
    ) {
        self.ipAddress = ipAddress
        self.subnetMask = subnetMask
    }
}

