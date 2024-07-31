//
//  CoffeShopHomePageViewController.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

protocol CoffeShopHomePageViewControllerProtocol: AnyObject {
    func displayViewModel(_ viewModel: CoffeeShopHomePageViewModel)
}

class CoffeShopHomePageViewController: UIViewController {
    
    private let customView = CoffeShopHomePageView()
    private let interactor: CoffeShopHomePageInteractorProtocol
    private var collectionData: CoffeeShopHomePageViewModel?
    
    init(interactor: CoffeShopHomePageInteractorProtocol) {
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
        
        customView.productTitleCollectionView.delegate = self
        customView.productTitleCollectionView.dataSource = self
        
        customView.productCollectionView.delegate = self
        customView.productCollectionView.dataSource = self
        
        customView.clearButton.addTarget(self, action: #selector(didTapAddressButton), for: .touchUpInside)
        
        
        interactor.viewDidLoad()
    }
    
    @objc private func didTapAddressButton() {
        displayAlert(title: "Location butonuna tıkladınız.", message: "Lütfen Kapatınız.", actionTitle: "OK")
        
    }
    
    private func displayAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: actionTitle, style: .cancel))
        present(alert, animated: true)
    }
}

extension CoffeShopHomePageViewController: CoffeShopHomePageViewControllerProtocol {
    
    func displayViewModel(_ viewModel: CoffeeShopHomePageViewModel) {
        self.collectionData = viewModel
        customView.reloadWith(viewModel)
        customView.collectionView.reloadData()
        customView.productTitleCollectionView.reloadData()
        customView.productCollectionView.reloadData()
    }
}

extension CoffeShopHomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.customView.collectionView {
            return collectionData?.promoImages.count ?? 0
        } else if collectionView == self.customView.productTitleCollectionView {
            return collectionData?.sectionTitles.count ?? 0
        } else if collectionView == self.customView.productCollectionView {
            return collectionData?.products.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.customView.collectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PromoCollectionViewCell
            let promoImagesString = collectionData?.promoImages[indexPath.row]
            cell.loadImage(named: promoImagesString ?? "")
            return cell
        } else if collectionView == self.customView.productTitleCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductTitleCollectionViewCell
            let productTitle = collectionData?.sectionTitles[indexPath.row]
            cell.reloadWith(productName: productTitle ?? "", isSelectedProduct: collectionData?.isSelected ?? false)
            return cell
        } else if collectionView == self.customView.productCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as! ProductCollectionViewCell
            let productImage = collectionData?.productsImageUrl[indexPath.row]
            let productTitle = collectionData?.productTitleLabel[indexPath.row]
            let productSubtitle = collectionData?.productSubtitleLabel[indexPath.row]
            let currency = collectionData?.currency[indexPath.row]
            let priceLabel = collectionData?.price[indexPath.row]
            let rating = collectionData?.rating[indexPath.row]
            cell.reloadWith(productImageName: productImage ?? "", productTitle: productTitle ?? "", productSubtitle: productSubtitle ?? "", currency: currency ?? "", priceLabel: priceLabel ?? "", score: "\(rating ?? 0.0)")
            cell.plusButtonTapped = {
                self.interactor.didTapPlusButton(at: indexPath.row)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.customView.collectionView {
            
        } else if collectionView == self.customView.productTitleCollectionView {
            interactor.didTapProductTitle(at: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.customView.collectionView {
            let screenWidth = UIScreen.main.bounds.width * 0.8
            //let cellWidth = screenWidth - (30 * 2)
            let cellHeight: CGFloat = 150
            return CGSize(width: screenWidth, height: cellHeight)
        } else if collectionView == self.customView.productTitleCollectionView {
            let padding: CGFloat = 20
            let text = collectionData?.sectionTitles[indexPath.row]
            let cellWidth = calculateCellWidth(text: text!, padding: padding)
            let cellHeight: CGFloat = collectionView.frame.height
            return CGSize(width: cellWidth, height: cellHeight)
        } else if collectionView == self.customView.productCollectionView {
            return CGSize(width: (view.frame.width - 80) / 2, height: 240)
        }
        return CGSize.zero
    }
    
    private func calculateCellWidth(text: String, padding: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect.zero)
        label.text = text
        label.sizeToFit()
        return label.frame.width + padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.customView.collectionView {
            return 10
        } else if collectionView == self.customView.productTitleCollectionView {
            return 10
        } else if collectionView == self.customView.productCollectionView {
            return 16
        }
        return 0
    }
}

extension CoffeShopHomePageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 1 {
            let width = scrollView.frame.width
            let currentPage = Int((scrollView.contentOffset.x + (0.5 * width)) / width)
            customView.pageControl.currentPage = currentPage
        }
    }
}

