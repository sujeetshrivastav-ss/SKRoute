//
//  NetworkType.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Network

/// Represents the active network transport type.
public enum NetworkType: String, Sendable {

    /// WiFi transport.
    case wifi

    /// Cellular transport.
    case cellular

    /// Ethernet transport.
    case ethernet

    /// No active network.
    case none

    /// Unknown transport.
    case unknown
}
