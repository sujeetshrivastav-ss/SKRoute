//
//  CellularInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents the current cellular network information.
public struct CellularInfo: Sendable {

    /// Cellular radio technology.
    /// Examples:
    /// - CTRadioAccessTechnologyLTE
    /// - CTRadioAccessTechnologyNRNSA
    /// - CTRadioAccessTechnologyNR
    public let accessTechnology: String?

    /// Active cellular service identifier.
    public let serviceIdentifier: String?

    /// Cellular interface IP address.
    public let ipAddress: String?

    /// Cellular interface subnet mask.
    public let subnetMask: String?

    public init(
        accessTechnology: String?,
        serviceIdentifier: String?,
        ipAddress: String?,
        subnetMask: String?
    ) {
        self.accessTechnology = accessTechnology
        self.serviceIdentifier = serviceIdentifier
        self.ipAddress = ipAddress
        self.subnetMask = subnetMask
    }
}

