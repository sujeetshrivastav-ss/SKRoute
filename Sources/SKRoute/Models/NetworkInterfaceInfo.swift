//
//  NetworkInterfaceInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation

public struct NetworkInterfaceInfo: Sendable {

    public let ipAddress: String?
    public let netmask: String?
    public let destination: String?

    public init(
        ipAddress: String?,
        netmask: String?,
        destination: String?
    ) {
        self.ipAddress = ipAddress
        self.netmask = netmask
        self.destination = destination
    }
}