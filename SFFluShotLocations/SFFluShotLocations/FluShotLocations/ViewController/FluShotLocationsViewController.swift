//
//  FluShotLocationsViewController.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import UIKit

final class FluShotLocationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = FluShotLocationsViewModel()

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

extension FluShotLocationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! FluShotLocationCell
        viewModel.configure(cell: cell, atIndexPath: indexPath)
        return cell
    }
}
