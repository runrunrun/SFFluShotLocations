//
//  FluShotLocationsViewModel.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import Foundation

final class FacilitiesViewModel {
    private lazy var dataService = FluShotLocationDataService()
    private var cellViewModels = [FacilityViewModel]()

    func numberOfRows(inSection section: Int) -> Int {
        return cellViewModels.count
    }

    func cellViewModel(at indexPath: IndexPath) -> FacilityViewModel {
        return cellViewModels[indexPath.row]
    }

    func loadLocations(_ completion: @escaping (Bool) -> Void) {
        dataService.fetchLocations { [weak self] (locations, error) in
            guard let locations = locations else {
                completion(false)
                return
            }

            // Group by facilityId
            var dict = [String: [FluAppointment]]()
            var facilityIds = [String]()
            for location in locations {
                let facilityId = location.facilityId
                if let _ = dict[facilityId] {
                    dict[location.facilityId]?.append(location)
                } else {
                    facilityIds.append(facilityId)
                    dict[location.facilityId] = [location]
                }
            }

            self?.cellViewModels = facilityIds.compactMap { FacilityViewModel(appointments: dict[$0] ?? []) }

            completion(true)
        }
    }
}
