//
//  CoffeeShopProductDetailViewController.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import UIKit

protocol CoffeeShopProductDetailViewControllerProtocol: AnyObject {
    func displayViewModel(_ viewModel: CoffeeShopDetailViewModel, productTypeViewModel: [CoffeeShopProductTypeViewModel])
}

class CoffeeShopProductDetailViewController: UIViewController {
    
    private let customView = CoffeeShopProductDetailView()
    private let interactor: CoffeeShopProductDetailInteractorProtocol
    private var viewModel: CoffeeShopDetailViewModel?
    private var productTypeViewModel: [CoffeeShopProductTypeViewModel] = []
   
    init(interactor: CoffeeShopProductDetailInteractorProtocol) {
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
        
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        configureNavigationBar()
        
        customView.readMoreButton.addTarget(self, action: #selector(didTapReadMoreButton), for: .touchUpInside)
        customView.buyNowButton.addTarget(self, action: #selector(didTapBuyNowButton), for: .touchUpInside)
        
        interactor.viewDidLoad()
    }
    
    @objc private func didTapBuyNowButton() {
        interactor.didTapBuyNowButton()
    }
    
    @objc private func didTapReadMoreButton() {
        customView.descriptionLabel.numberOfLines = customView.descriptionLabel.numberOfLines == 3 ? 0 : 3
    }
    
    private func configureNavigationBar() {
        navigationItem.backButtonDisplayMode = .minimal
        
        let heartButton = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: self, action: nil)
            navigationItem.rightBarButtonItem = heartButton
        heartButton.tintColor = UIColor.black
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            .foregroundColor: UIColor.init(rgb: 0x2F2D2C)
        ]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
}

extension CoffeeShopProductDetailViewController: CoffeeShopProductDetailViewControllerProtocol {
    
    func displayViewModel(_ viewModel: CoffeeShopDetailViewModel, productTypeViewModel: [CoffeeShopProductTypeViewModel]) {
        self.viewModel = viewModel
        customView.reloadWith(viewModel)
        self.title = viewModel.navigationTitle
        self.productTypeViewModel = productTypeViewModel
        customView.collectionView.reloadData()
    }
}

extension CoffeeShopProductDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productTypeViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! ProductTypeCollectionViewCell
        let productType = viewModel?.productType[indexPath.row]
        cell.configureWith(productType ?? "", isSelected: productTypeViewModel[indexPath.row].isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 96.0, height: 43.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.didSelectProductType(at: indexPath.row)
        collectionView.reloadItems(at: [indexPath])
    }
}
