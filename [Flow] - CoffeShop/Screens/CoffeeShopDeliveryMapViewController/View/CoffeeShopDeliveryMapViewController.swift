//
//  CoffeeShopDeliveryMapViewController.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import UIKit

protocol CoffeeShopDeliveryMapViewControllerProtocol: AnyObject {
    func displayViewModel(_ viewModel: CoffeeShopDeliveryMapViewModel)
}

class CoffeeShopDeliveryMapViewController: UIViewController {
    
    private let customView = CoffeeShopDeliveryMapView()
    private let interactor: CoffeeShopDeliveryMapInteractorProtocol
    
    init(interactor: CoffeeShopDeliveryMapInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        interactor.viewDidLoad()
    }
}

extension CoffeeShopDeliveryMapViewController: CoffeeShopDeliveryMapViewControllerProtocol {
    
    func displayViewModel(_ viewModel: CoffeeShopDeliveryMapViewModel) {
        customView.reloadWith(viewModel)
    }
}
