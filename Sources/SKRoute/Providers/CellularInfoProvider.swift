//
//  CellularInfoProvider.swift
//  SKRoute
//
//  Created by Sujeet Shrivastav on 09/06/26.
//


import Foundation
import CoreTelephony

enum CellularInfoProvider {

    // MARK: - Public

    /// Returns current cellular network information.
    static func cellularInfo() -> CellularInfo {

        let networkInfo = CTTelephonyNetworkInfo()

        let accessTechnology: String?
        let serviceIdentifier: String?

        if #available(iOS 12.0, *) {
            accessTechnology = networkInfo
                .serviceCurrentRadioAccessTechnology?
                .values
                .first

            serviceIdentifier = networkInfo
                .dataServiceIdentifier
        } else {
            accessTechnology = networkInfo
                .currentRadioAccessTechnology

            serviceIdentifier = nil
        }

        let interfaceInfo = CellularInterfaceProvider
            .currentInterface()

        return CellularInfo(
            accessTechnology: accessTechnology,
            serviceIdentifier: serviceIdentifier,
            ipAddress: interfaceInfo.ipAddress,
            subnetMask: interfaceInfo.subnetMask
        )
    }
}

