//
//  FacilitiesViewController.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import UIKit

final class FacilitiesViewController: UIViewController, Storyboarded, ViewModelled {
    typealias ViewModel = FacilitiesViewModel
    @IBOutlet weak var tableView: UITableView!
    var viewModel: FacilitiesViewModel!
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("FluLocationsTitle", comment: "Flu Locations Title")

        // Start spinner
        viewModel.loadLocations { [weak self] success in
            // Stop spinner
            guard success else {
                // Show error message
                return
            }

            self?.tableView.reloadData()
        }
    }
}

extension FacilitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "facilityCell", for: indexPath) as! FacilityCell
        let cellVM = viewModel.cellViewModel(at: indexPath)
        cell.facilityNameLabel.text = cellVM.facilityName
        cell.addressLabel.text = cellVM.address
        cell.eligibilityLabel.text = cellVM.eligibility
        return cell
    }
}

extension FacilitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let facilityVM = viewModel.cellViewModel(at: indexPath)
        coordinator?.showFacility(facilityVM)
    }
}
