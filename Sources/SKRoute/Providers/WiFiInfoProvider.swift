//
//  WiFiInfoProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation
import NetworkExtension

actor WiFiInfoProvider {

    static let shared = WiFiInfoProvider()

    private var cache: WiFiInfo?

    // MARK: - Public

    func wifiInfo() async -> WiFiInfo? {

        if let cache {
            return cache
        }

        return await refresh()
    }

    func refresh() async -> WiFiInfo? {

        let info = await fetchCurrent()

        cache = info

        return info
    }

    // MARK: - Private

    private func fetchCurrent() async -> WiFiInfo? {

        await withCheckedContinuation { continuation in

            NEHotspotNetwork.fetchCurrent { network in

                guard let network else {
                    continuation.resume(returning: nil)
                    return
                }

                continuation.resume(
                    returning: WiFiInfo(
                        ssid: network.ssid,
                        bssid: network.bssid,
                        ssidData: network.ssid.data(using: .utf8)
                    )
                )
            }
        }
    }
}
