//
//  ViewModelled.swift
//  SFFluShotLocations
//
//  Created by Kunwar, Hari on 4/26/21.
//

import UIKit

protocol ViewModelled {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
}

extension ViewModelled where Self: Storyboarded & UIViewController {
    static func instantiate(viewModel: ViewModel) -> Self {
        var vc = Self.instantiate()
        vc.viewModel = viewModel
        return vc
    }
}
