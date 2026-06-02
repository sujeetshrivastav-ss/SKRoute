//
//  IPAddressProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 02/06/26.
//


import Foundation

enum IPAddressProvider {

    static func ipAddress() -> String? {

        var address: String?

        var ifaddr: UnsafeMutablePointer<ifaddrs>?

        guard getifaddrs(&ifaddr) == 0 else {
            return nil
        }

        defer {
            freeifaddrs(ifaddr)
        }

        var ptr = ifaddr

        while ptr != nil {

            let interface = ptr!.pointee

            let family = interface
                .ifa_addr
                .pointee
                .sa_family

            if family == UInt8(AF_INET) {

                let name = String(
                    cString: interface.ifa_name
                )

                if name == "en0" {

                    var host = [CChar](
                        repeating: 0,
                        count: Int(NI_MAXHOST)
                    )

                    getnameinfo(
                        interface.ifa_addr,
                        socklen_t(
                            interface.ifa_addr.pointee.sa_len
                        ),
                        &host,
                        socklen_t(host.count),
                        nil,
                        0,
                        NI_NUMERICHOST
                    )

                    address = String(cString: host)
                }
            }

            ptr = interface.ifa_next
        }

        return address
    }
}