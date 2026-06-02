//
//  NetworkInfo.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//

import Foundation

public struct NetworkInfo: Sendable {

    public let ssid: String?
    public let bssid: String?
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
