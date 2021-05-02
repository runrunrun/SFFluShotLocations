//
//  FacilityViewController.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import UIKit

final class FacilityViewController: UIViewController, Storyboarded, ViewModelled {
    @IBOutlet weak var tableView: UITableView!
    typealias ViewModel = FacilityViewModel
    weak var coordinator: MainCoordinator?
    var viewModel: ViewModel!
}

extension FacilityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! AppointmentCell
        let vm = viewModel.cellViewModel(indexPath)
        cell.dateLabel.text = vm.date
        cell.eligibilityLabel.text = vm.eligibility
        return cell
    }
}
