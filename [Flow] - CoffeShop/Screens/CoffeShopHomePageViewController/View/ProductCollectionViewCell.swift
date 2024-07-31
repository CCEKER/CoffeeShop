//
//  ProductCollectionViewCell.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var plusButtonTapped: (() -> Void)?
    private let ratingView = CustomRatingView()
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let productSubtitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x9B9B9B)
        return view
    }()
    
    private let currency: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F4B4E)
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F4B4E)
        view.numberOfLines = 0
        return view
    }()
    
    let plusButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "button"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let view = UIStackView(arrangedSubviews: [currency, priceLabel, spacerView, plusButton])
        view.axis = .horizontal
        view.distribution = .fill 
        view.alignment = .center
        view.spacing = 5
        plusButton.setContentHuggingPriority(.required, for: .horizontal)
        plusButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [productTitleLabel, productSubtitleLabel, horizontalStackView])
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        setupViews()
    }
    
    @objc private func didTapPlusButton() {
        plusButtonTapped?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(ratingView)
        
        configureCell()
        setupConstraints()
        
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.backgroundColor = .black.withAlphaComponent(0.3)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 132),
            
            plusButton.heightAnchor.constraint(equalToConstant: 32),
            
            verticalStackView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ratingView.widthAnchor.constraint(equalToConstant: 50),
            ratingView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureCell() {
        self.contentView.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        self.contentView.layer.cornerRadius = 16
    }
    
    func reloadWith(productImageName: String, productTitle: String, productSubtitle: String, currency: String, priceLabel: String, score: String) {
        self.productImageView.image = UIImage(named: productImageName)
        self.productTitleLabel.text = productTitle
        self.productSubtitleLabel.text = productSubtitle
        self.currency.text = currency
        self.priceLabel.text = priceLabel
        ratingView.ratingLabel.text = score
    }
}
