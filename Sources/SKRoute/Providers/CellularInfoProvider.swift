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

    static func cellularInfo() -> CellularInfo {

        let networkInfo = CTTelephonyNetworkInfo()

        let technology =
            networkInfo
                .serviceCurrentRadioAccessTechnology?
                .values
                .first

        let serviceIdentifier =
            networkInfo
                .dataServiceIdentifier

        let interfaceInfo =
            CellularInterfaceProvider
                .currentInterface()

        return CellularInfo(
            generation: generation(
                from: technology
            ),
            radioTechnology: technology,
            serviceIdentifier: serviceIdentifier,
            ipAddress: interfaceInfo.ipAddress,
            subnetMask: interfaceInfo.subnetMask
        )
    }

    static func hasActiveDataService() -> Bool {
        
        guard CellularInterfaceProvider
            .isCellularAvailable()
        else {
            return false
        }
        
        let networkInfo = CTTelephonyNetworkInfo()
        
        return networkInfo
            .dataServiceIdentifier != nil
    }

    // MARK: - Private

    private static func generation(
        from technology: String?
    ) -> NetworkGeneration {

        guard let technology else {
            return .unknown
        }

        switch technology {

        case CTRadioAccessTechnologyGPRS,
             CTRadioAccessTechnologyEdge:
            return .secondGeneration

        case CTRadioAccessTechnologyWCDMA,
             CTRadioAccessTechnologyHSDPA,
             CTRadioAccessTechnologyHSUPA,
             CTRadioAccessTechnologyCDMA1x,
             CTRadioAccessTechnologyCDMAEVDORev0,
             CTRadioAccessTechnologyCDMAEVDORevA,
             CTRadioAccessTechnologyCDMAEVDORevB,
             CTRadioAccessTechnologyeHRPD:
            return .thirdGeneration

        case CTRadioAccessTechnologyLTE:
            return .fourthGeneration

        default:

            if #available(iOS 14.1, *) {

                if technology == CTRadioAccessTechnologyNR ||
                   technology == CTRadioAccessTechnologyNRNSA {
                    return .fifthGeneration
                }
            }

            return .unknown
        }
    }
}
