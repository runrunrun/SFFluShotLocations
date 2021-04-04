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
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "FluShotLocationsViewController")
        self.navigationController.pushViewController(vc, animated: false)
    }
}
