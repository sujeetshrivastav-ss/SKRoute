//
//  CellularInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents cellular network information.
public struct CellularInfo: Sendable {

    /// Cellular network generation.
    public let generation: NetworkGeneration

    /// Raw radio technology value.
    public let radioTechnology: String?

    /// Active data service identifier.
    public let serviceIdentifier: String?

    /// Cellular IP address.
    public let ipAddress: String?

    /// Cellular subnet mask.
    public let subnetMask: String?

    public init(
        generation: NetworkGeneration,
        radioTechnology: String?,
        serviceIdentifier: String?,
        ipAddress: String?,
        subnetMask: String?
    ) {
        self.generation = generation
        self.radioTechnology = radioTechnology
        self.serviceIdentifier = serviceIdentifier
        self.ipAddress = ipAddress
        self.subnetMask = subnetMask
    }
}
