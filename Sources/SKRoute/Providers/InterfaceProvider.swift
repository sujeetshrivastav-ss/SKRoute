//
//  InterfaceProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation

enum InterfaceProvider {

    // MARK: - Public

    static func currentInterface() -> NetworkInterfaceInfo {

        var ipAddress: String?
        var subnetMask: String?
        var destination: String?

        var interfaces: UnsafeMutablePointer<ifaddrs>?

        guard getifaddrs(&interfaces) == 0 else {
            return NetworkInterfaceInfo(
                ipAddress: nil,
                subnetMask: nil,
                destination: nil
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
                    cString: interface.ifa_name
                )

                if interfaceName == "en0" {

                    ipAddress = stringValue(
                        from: interface.ifa_addr
                    )

                    subnetMask = stringValue(
                        from: interface.ifa_netmask
                    )

                    destination = stringValue(
                        from: interface.ifa_dstaddr
                    )

                    break
                }
            }

            pointer = interface.ifa_next
        }

        return NetworkInterfaceInfo(
            ipAddress: ipAddress,
            subnetMask: subnetMask,
            destination: destination
        )
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
