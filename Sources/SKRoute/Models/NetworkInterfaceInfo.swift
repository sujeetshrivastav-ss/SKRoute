//
//  NetworkInterfaceInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//

import Foundation

/// Represents local network interface information.
public struct NetworkInterfaceInfo: Sendable {

    /// Local IP address.
    public let ipAddress: String?

    /// Subnet mask.
    public let subnetMask: String?

    /// Destination address.
    public let destination: String?

    public init(
        ipAddress: String?,
        subnetMask: String?,
        destination: String?
    ) {
        self.ipAddress = ipAddress
        self.subnetMask = subnetMask
        self.destination = destination
    }
}
