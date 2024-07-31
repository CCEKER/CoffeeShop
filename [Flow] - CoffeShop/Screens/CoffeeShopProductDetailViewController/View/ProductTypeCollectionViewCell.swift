//
//  ProductTypeCollectionViewCell.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import UIKit

class ProductTypeCollectionViewCell: UICollectionViewCell {
    
    private let typeLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollectionViewCell()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(typeLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            typeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupCollectionViewCell() {
        self.layer.cornerRadius = 12
        self.contentView.layer.cornerRadius = 12
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.contentView.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
    }
    
    func configureWith(_ productType: String, isSelected: Bool) {
        typeLabel.text = productType
        self.contentView.backgroundColor = isSelected ? UIColor.init(rgb: 0xC67C4E).withAlphaComponent(0.2) : .white
        self.layer.borderColor = isSelected ? UIColor.init(rgb: 0xC67C4E).cgColor : UIColor.gray.withAlphaComponent(0.2).cgColor
        typeLabel.textColor = isSelected ? UIColor.init(rgb: 0xC67C4E) : UIColor.gray
    }
}
