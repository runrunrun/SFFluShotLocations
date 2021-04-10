//
//  FluShotLocationsViewModel.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import Foundation

final class FluShotLocationsViewModel {
    private lazy var dataService = FluShotLocationDataService()
    private var locations = [FluShotLocation]()
    private var cellViewModels = [FluShotLocationCellViewModel]()

    func numberOfRows(inSection section: Int) -> Int {
        return cellViewModels.count
    }

    func configure(cell: FluShotLocationCell, atIndexPath indexPath: IndexPath) {
        let cellVM = cellViewModels[indexPath.row]
        cell.facilityNameLabel.text = cellVM.facilityName
        cell.addressLabel.text = cellVM.address
        cell.eligibilityLabel.text = cellVM.eligibility
    }

    func loadLocations(_ completion: @escaping (Bool) -> Void) {
        dataService.fetchLocations { [weak self] (locations, error) in
            guard let locations = locations else {
                completion(false)
                return
            }

            self?.cellViewModels = locations.map { FluShotLocationCellViewModel(location: $0) }
            completion(true)
        }
    }
}
