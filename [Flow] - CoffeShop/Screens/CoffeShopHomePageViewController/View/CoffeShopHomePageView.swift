//
//  CoffeShopHomePageView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class CoffeShopHomePageView: UIView {
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0x131313)
        return view
    }()
    
    private let locationLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0xB7B7B7)
        view.text = "Location"
        return view
    }()
    
    private lazy var addressLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0xDDDDDD)
        view.numberOfLines = 0
        return view
    }()
    
    private let arrowDownIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: "arrowDown")
        view.heightAnchor.constraint(equalToConstant: 14).isActive = true
        view.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [addressLabel, arrowDownIcon])
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [locationLabel, horizontalStackView])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let clearButton: UIButton = {
        let view = UIButton(type: .custom)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 14
        view.widthAnchor.constraint(equalToConstant: 44).isActive = true
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [verticalStackView, profileImageView])
        view.alignment = .center
        view.distribution = .equalCentering
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        view.borderStyle = .none
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.returnKeyType = .search
        view.textColor = .white
        view.placeholder = "Search coffee"
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftPaddingView.backgroundColor = .clear
        
        let leftView = UIView(frame: CGRect(x: 10, y: 10, width: 35 + 12, height: 20))
        leftView.backgroundColor = .clear
        
        let searchIcon = UIImageView(image: UIImage(named: "search"))
        searchIcon.tintColor = .gray
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.frame = CGRect(x: 12, y: 0, width: 20, height: 20)
        leftView.addSubview(searchIcon)
        leftView.addSubview(leftPaddingView)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 44 + 10, height: 44))
        rightView.backgroundColor = .clear
        
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(UIImage(named: "filter"), for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        rightView.addSubview(filterButton)
        
        view.leftView = leftView
        view.leftViewMode = .always
        view.rightView = rightView
        view.rightViewMode = .always
        
        view.attributedPlaceholder = NSAttributedString(
            string: "Search coffee",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0x989898), .font: UIFont(name: "Sora", size: 14) ?? UIFont.systemFont(ofSize: 14)]
        )
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10

        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.showsHorizontalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30 * 0.2)
        view.decelerationRate = .fast
        view.isPagingEnabled = true
        view.tag = 1
        return view
    }()
    
    let pageControl: CustomPageControl = {
        let view = CustomPageControl()
        view.currentPage = 0
        view.numberOfPages = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let productTitleCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 8
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 2
        view.register(ProductTitleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 239)
        layout.minimumInteritemSpacing = 10

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cCell")
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.tag = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .init(rgb: 0xF5F5F5)
        addSubview(topView)
        topView.addSubview(topStackView)
        horizontalStackView.addSubview(clearButton)
        topView.addSubview(searchTextField)
        topView.addSubview(collectionView)
        addSubview(pageControl)
        addSubview(productTitleCollectionView)
        addSubview(productCollectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 280),
            
            topStackView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 63),
            topStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -30),
            
            clearButton.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor),
            clearButton.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            clearButton.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            clearButton.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 24),
            searchTextField.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30),
            searchTextField.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -30),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),
            
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -30),
            collectionView.heightAnchor.constraint(equalToConstant: 140),
            
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 6),
            
            productTitleCollectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            productTitleCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            productTitleCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            productTitleCollectionView.heightAnchor.constraint(equalToConstant: 38),
            
            productCollectionView.topAnchor.constraint(equalTo: productTitleCollectionView.bottomAnchor, constant: 24),
            productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            productCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func reloadWith(_ viewModel: CoffeeShopHomePageViewModel) {
        addressLabel.text = viewModel.addressLabel
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.profileImageUrl)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                }
            }
        }
    }
}
