//
//  InterfaceProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation

enum InterfaceProvider {

    static func currentInterface() -> NetworkInterfaceInfo {

        var ipAddress: String?
        var netmask: String?
        var destination: String?

        var ifaddr: UnsafeMutablePointer<ifaddrs>?

        guard getifaddrs(&ifaddr) == 0 else {
            return NetworkInterfaceInfo(
                ipAddress: nil,
                netmask: nil,
                destination: nil
            )
        }

        defer {
            freeifaddrs(ifaddr)
        }

        var ptr = ifaddr

        while ptr != nil {

            let interface = ptr!.pointee

            let family =
                interface.ifa_addr.pointee.sa_family

            if family == UInt8(AF_INET) {

                let name =
                    String(cString: interface.ifa_name)

                if name == "en0" {

                    ipAddress = stringValue(
                        interface.ifa_addr
                    )

                    netmask = stringValue(
                        interface.ifa_netmask
                    )

                    destination = stringValue(
                        interface.ifa_dstaddr
                    )
                }
            }

            ptr = interface.ifa_next
        }

        return NetworkInterfaceInfo(
            ipAddress: ipAddress,
            netmask: netmask,
            destination: destination
        )
    }

    private static func stringValue(
        _ address: UnsafeMutablePointer<sockaddr>?
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