//
//  MainCoordinator.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator]  = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = FacilitiesViewController.instantiate(viewModel: FacilitiesViewModel())
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: false)
    }

    func showFacility(_ viewModel: FacilityViewModel) {
        let vc = FacilityViewController.instantiate(viewModel: viewModel)
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
}
