//
//  ActiveNetworkProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//

import Foundation
import Network

enum ActiveNetworkProvider {

    // MARK: - Public

    static func activeNetworkInfo()
    async -> ActiveNetworkInfo {

        let monitor = NWPathMonitor()

        return await withCheckedContinuation {
            continuation in

            monitor.pathUpdateHandler = { path in

                let networkType: NetworkType

                if path.usesInterfaceType(.wifi) {
                    networkType = .wifi
                } else if path.usesInterfaceType(.cellular) {
                    networkType = .cellular
                } else if path.usesInterfaceType(.wiredEthernet) {
                    networkType = .ethernet
                } else if path.status == .satisfied {
                    networkType = .unknown
                } else {
                    networkType = .none
                }

                monitor.cancel()

                continuation.resume(
                    returning: ActiveNetworkInfo(
                        networkType: networkType,
                        isConnected: path.status == .satisfied
                    )
                )
            }

            monitor.start(
                queue: DispatchQueue.global()
            )
        }
    }
}

