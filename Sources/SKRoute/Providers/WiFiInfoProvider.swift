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

    private var cachedInfo: NetworkInfo?
    private var lastRefresh: Date?

    private let cacheDuration: TimeInterval = 30

    func currentNetwork() async -> NetworkInfo? {

        if let cachedInfo,
           let lastRefresh,
           Date().timeIntervalSince(lastRefresh) < cacheDuration {
            return cachedInfo
        }

        return await refresh()
    }

    func refresh() async -> NetworkInfo? {

        let networkInfo = await fetchCurrentNetwork()

        cachedInfo = networkInfo
        lastRefresh = Date()

        return networkInfo
    }

    private func fetchCurrentNetwork() async -> NetworkInfo? {

        await withCheckedContinuation { continuation in

            NEHotspotNetwork.fetchCurrent { network in

                guard let network else {
                    continuation.resume(returning: nil)
                    return
                }

                let info = NetworkInfo(
                    ssid: network.ssid,
                    bssid: network.bssid,
                    ssidData: network.ssid.data(using: .utf8)
                )

                continuation.resume(returning: info)
            }
        }
    }
}