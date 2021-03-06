//
//  HomeRouter.swift
//  Crypto_Currency_Wallet
//
//  Created Tien Dinh on 11/06/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class HomeRouter: HomeWireframeProtocol {

    weak var viewController: UIViewController?
    
    func showNotInternetVC() {
        let vc = LostInternetViewController()
        viewController?.present(vc)
    }

    static func createModule() -> HomeViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewController(nibName: nil, bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view,
                                      interactor: interactor,
                                      router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
