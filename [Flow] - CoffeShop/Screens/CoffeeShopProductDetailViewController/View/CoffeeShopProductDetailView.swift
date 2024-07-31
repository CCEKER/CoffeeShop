//
//  CoffeeShopProductDetailView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import UIKit

class CoffeeShopProductDetailView: UIView {
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 20)
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.numberOfLines = 0
        return view
    }()
    
    private let productSubtitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x9B9B9B)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [productTitle, productSubtitle])
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .center
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "star"))
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    private let scoreLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let voteLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x808080)
        return view
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [starIcon, scoreLabel, voteLabel])
        view.axis = .horizontal
        view.spacing = 4
        view.alignment = .fill
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let icon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "icon1"))
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.widthAnchor.constraint(equalToConstant: 44).isActive = true
        view.clipsToBounds = true
        return view
    }()
    
    private let icon2: UIImageView = {
        let view = UIImageView(image: UIImage(named: "icon2"))
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.widthAnchor.constraint(equalToConstant: 44).isActive = true
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var iconsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [icon, icon2])
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .fill
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0xEAEAEA)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private let descriptionTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.numberOfLines = 0
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 3
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        view.textColor = UIColor.init(rgb: 0x9B9B9B)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let readMoreButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitleColor(UIColor.init(rgb: 0xC67C4E), for: .normal)
        view.backgroundColor = .clear
        view.titleLabel?.font = UIFont(name: "Sora", size: 14)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEnabled = true
        view.isHidden = false
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [descriptionLabel, readMoreButton])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .lastBaseline
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [descriptionTitle, horizontalStackView])
        view.axis = .vertical
        view.spacing = 12
        view.alignment = .fill
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sizeLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 12
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProductTypeCollectionViewCell.self, forCellWithReuseIdentifier: "ccell")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let priceTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 18)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x9B9B9B)
        return view
    }()
    
    private let currency: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0xC67C4E)
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0xC67C4E)
        view.numberOfLines = 0
        return view
    }()
    
    let buyNowButton: UIButton = {
        let view = UIButton(type: .custom)
        view.titleLabel?.font = UIFont(name: "Sora", size: 16)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.backgroundColor = UIColor.init(rgb: 0xC67C4E)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [currency, priceLabel])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8
        return view
    }()
    
    private lazy var lastStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [priceTitle, priceStackView])
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .fill
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buyNowButton])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(productImageView)
        addSubview(titleStackView)
        addSubview(ratingStackView)
        addSubview(iconsStackView)
        addSubview(seperatorView)
        addSubview(descriptionStackView)
        addSubview(sizeLabel)
        addSubview(collectionView)
        addSubview(holderView)
        holderView.addSubview(lastStackView)
        holderView.addSubview(buttonStackView)
        backgroundColor = UIColor.init(rgb: 0xF5F5F5)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 108),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            productImageView.heightAnchor.constraint(equalToConstant: 230),
            
            titleStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            ratingStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 16),
            ratingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            iconsStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 60),
            iconsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            seperatorView.topAnchor.constraint(equalTo: iconsStackView.bottomAnchor, constant: 20),
                        
            descriptionStackView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 20),
            descriptionStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            sizeLabel.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 20),
            sizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            collectionView.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 33),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33),
            collectionView.heightAnchor.constraint(equalToConstant: 43),
            
            holderView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 17),
            holderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            holderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            holderView.heightAnchor.constraint(equalToConstant: 121),
            
            lastStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 22),
            lastStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            
            buttonStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -30),
            
            buyNowButton.leadingAnchor.constraint(equalTo: lastStackView.trailingAnchor, constant: 42),
            buyNowButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    func reloadWith(_ viewModel: CoffeeShopDetailViewModel) {

        productImageView.image = UIImage(named: viewModel.productDetailImage)
        productTitle.text = viewModel.productTitle
        productSubtitle.text = viewModel.productSubtitle
        scoreLabel.text = viewModel.scoreLabel
        voteLabel.text = viewModel.voteLabel
        descriptionTitle.text = viewModel.descriptionTitle
        descriptionLabel.text = viewModel.description
        readMoreButton.setTitle(viewModel.readMoreButtonTitle, for: .normal)
        sizeLabel.text = viewModel.sizeLabel
        priceTitle.text = viewModel.priceTitle
        priceLabel.text = viewModel.price
        currency.text = viewModel.currency
        buyNowButton.setTitle(viewModel.buyNowButtonTitle, for: .normal)
    }
}
