//
//  NetworkMonitor.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation
import Network

public final class NetworkMonitor {

    private let monitor = NWPathMonitor()

    public init() {}

    public func startMonitoring(
        handler: @escaping @Sendable (NWPath.Status) -> Void
    ) {
        monitor.pathUpdateHandler = { path in
            handler(path.status)
        }

        monitor.start(queue: .global())
    }
}
