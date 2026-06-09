//
//  CellularInterfaceProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation

enum CellularInterfaceProvider {

    // MARK: - Public

    /// Returns current cellular interface information.
    static func currentInterface() -> CellularInterfaceInfo {

        var ipAddress: String?
        var subnetMask: String?

        var interfaces: UnsafeMutablePointer<ifaddrs>?

        guard getifaddrs(&interfaces) == 0 else {
            return CellularInterfaceInfo(
                ipAddress: nil,
                subnetMask: nil
            )
        }

        defer {
            freeifaddrs(interfaces)
        }

        var pointer = interfaces

        while let interface = pointer?.pointee {

            guard interface.ifa_addr != nil else {
                pointer = interface.ifa_next
                continue
            }

            let family = interface
                .ifa_addr
                .pointee
                .sa_family

            if family == UInt8(AF_INET) {

                let interfaceName = String(
                    cString: interface.ifa_name
                )

                if interfaceName.hasPrefix("pdp_ip") {

                    ipAddress = stringValue(
                        from: interface.ifa_addr
                    )

                    subnetMask = stringValue(
                        from: interface.ifa_netmask
                    )

                    break
                }
            }

            pointer = interface.ifa_next
        }

        return CellularInterfaceInfo(
            ipAddress: ipAddress,
            subnetMask: subnetMask
        )
    }

    // MARK: - Private

    /// Converts socket address to readable IP string.
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

        return String(cString: host)
    }
}

