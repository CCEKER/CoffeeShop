//
//  ProductTitleCollectionViewCell.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class ProductTitleCollectionViewCell: UICollectionViewCell {
    
    let productTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F4B4E)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
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
        contentView.addSubview(productTitle)
        self.contentView.layer.cornerRadius = 12
        self.contentView.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            productTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func reloadWith(productName: String, isSelectedProduct: Bool) {
        productTitle.text = productName
        
        self.contentView.backgroundColor = isSelectedProduct ? UIColor.init(rgb: 0xC67C4E) : .white
        self.productTitle.textColor = isSelectedProduct ? UIColor.white : UIColor.init(rgb: 0x2F4B4E)
        self.productTitle.font = isSelectedProduct ? UIFont.systemFont(ofSize: 14, weight: .semibold): UIFont.systemFont(ofSize: 14, weight: .regular)
    }
}
