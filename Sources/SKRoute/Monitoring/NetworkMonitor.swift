//
//  NetworkMonitor.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation
import Network

public actor NetworkMonitor {

    private let monitor = NWPathMonitor()

    public init() {}

    public func statuses()
    -> AsyncStream<NWPath.Status> {

        AsyncStream { continuation in

            monitor.pathUpdateHandler = { path in
                continuation.yield(path.status)
            }

            monitor.start(queue: .global())
        }
    }

    public func stop() {
        monitor.cancel()
    }
}
