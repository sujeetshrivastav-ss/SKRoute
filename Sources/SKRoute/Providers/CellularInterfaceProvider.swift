//
//  CellularInterfaceProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//

import Foundation

enum CellularInterfaceProvider {

    // MARK: - Public

    static func currentInterface() -> CellularInterfaceInfo {

        var ipAddress: String?
        var subnetMask: String?

        var interfaces: UnsafeMutablePointer<ifaddrs>?

        guard getifaddrs(&interfaces) == 0 else {
            return CellularInterfaceInfo(
                ipAddress: nil,
                subnetMask: nil,
                isAvailable: false
            )
        }

        defer {
            freeifaddrs(interfaces)
        }

        var pointer = interfaces

        while let interface = pointer?.pointee {

            guard let address = interface.ifa_addr else {
                pointer = interface.ifa_next
                continue
            }

            let family = address.pointee.sa_family

            if family == UInt8(AF_INET) {

                let interfaceName = String(
                        validatingCString: interface.ifa_name
                    ) ?? ""

                if interfaceName.hasPrefix("pdp_ip") {

                    ipAddress = stringValue(
                        from: interface.ifa_addr
                    )

                    subnetMask = stringValue(
                        from: interface.ifa_netmask
                    )

                    return CellularInterfaceInfo(
                        ipAddress: ipAddress,
                        subnetMask: subnetMask,
                        isAvailable: true
                    )
                }
            }

            pointer = interface.ifa_next
        }

        return CellularInterfaceInfo(
            ipAddress: nil,
            subnetMask: nil,
            isAvailable: false
        )
    }

    static func isCellularAvailable() -> Bool {
        currentInterface().isAvailable
    }

    // MARK: - Private

    private static func stringValue(
        from address: UnsafeMutablePointer<sockaddr>?
    ) -> String? {

        guard let address else {
            return nil
        }

        var host = [CChar](
            repeating: 0,
            count: Int(NI_MAXHOST)
        )

        getnameinfo(
            address,
            socklen_t(address.pointee.sa_len),
            &host,
            socklen_t(host.count),
            nil,
            0,
            NI_NUMERICHOST
        )

        let length = host.firstIndex(of: 0) ?? host.count

        let bytes = host
            .prefix(length)
            .map { UInt8(bitPattern: $0) }

        return String(
            decoding: bytes,
            as: UTF8.self
        )
    }
}
