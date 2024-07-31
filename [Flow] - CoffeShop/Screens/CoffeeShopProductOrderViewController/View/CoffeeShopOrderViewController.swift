//
//  CoffeeShopOrderViewController.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import UIKit

protocol CoffeeShopOrderViewControllerProtocol: AnyObject {
    func displayViewModel(_ viewModel: CoffeeShopOrderViewModel)
}

class CoffeeShopOrderViewController: UIViewController {
    
    private let customView = CoffeeShopOrderView()
    private let interactor: CoffeeShopOrderInteractorProtocol
    
    init(interactor: CoffeeShopOrderInteractorProtocol) {
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
        
        customView.minusButton.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        customView.plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        customView.orderButton.addTarget(self, action: #selector(didTapOrderButton), for: .touchUpInside)
        
        interactor.viewDidLoad()
    }
    
    @objc private func didTapOrderButton() {
        interactor.didTapOrderButton()
    }
    
    @objc private func didTapMinusButton() {
        interactor.deleteProduct()
    }
    
    @objc private func didTapPlusButton() {
        interactor.addProduct()
    }
}

extension CoffeeShopOrderViewController: CoffeeShopOrderViewControllerProtocol {
    
    func displayViewModel(_ viewModel: CoffeeShopOrderViewModel) {
        
        customView.reloadWith(viewModel)
        self.title = viewModel.navigationTitle
    }
}
