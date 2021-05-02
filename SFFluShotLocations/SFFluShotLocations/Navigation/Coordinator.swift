//
//  Coordinator.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/4/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
