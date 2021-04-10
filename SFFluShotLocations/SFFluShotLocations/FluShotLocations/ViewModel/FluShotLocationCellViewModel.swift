//
//  FluShotLocationCellViewModel.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/10/21.
//

import Foundation

struct FluShotLocationCellViewModel {
    private let location: FluShotLocation

    init(location: FluShotLocation) {
        self.location = location
    }

    var facilityName: String? { location.facilityName }
    var address: String? {
        "\(location.street1 ?? ""), \(location.city ?? ""), \(location.postalCode ?? "")"
    }
    var eligibility: String? { location.eligibility }

}
