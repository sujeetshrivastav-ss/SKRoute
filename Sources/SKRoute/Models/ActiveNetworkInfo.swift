//
//  ActiveNetworkInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

/// Represents the currently active network.
public struct ActiveNetworkInfo: Sendable {

    /// Active transport type.
    public let networkType: NetworkType

    /// Whether the network is reachable.
    public let isConnected: Bool

    public init(
        networkType: NetworkType,
        isConnected: Bool
    ) {
        self.networkType = networkType
        self.isConnected = isConnected
    }
}