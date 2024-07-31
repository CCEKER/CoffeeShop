//
//  CoffeShopWelcomeViewController.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import UIKit

protocol CoffeShopWelcomeViewControllerProtocol: AnyObject {
    func displayViewState(_ viewState: CoffeShopWelcomeViewState)
}

class CoffeShopWelcomeViewController: UIViewController {
    
    private let customView = CoffeShopWelcomeView()
    private let interactor: CoffeShopWelcomeInteractorProtocol
    
    init(interactor: CoffeShopWelcomeInteractorProtocol) {
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
        
        customView.getStartedButton.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        
        interactor.viewDidLoad()
    }
    
    @objc private func didTapGetStartedButton() {
        interactor.didTapGetStartedButton()
    }
}

extension CoffeShopWelcomeViewController: CoffeShopWelcomeViewControllerProtocol {
    
    func displayViewState(_ viewState: CoffeShopWelcomeViewState) {
        switch viewState {
        case .initial(let viewModel):
            customView.reloadWith(viewModel)
        case .error:
            break
        }
    }
}
