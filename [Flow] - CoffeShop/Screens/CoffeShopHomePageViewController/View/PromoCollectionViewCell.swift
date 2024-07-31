//
//  PromoCollectionViewCell.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    
    private let promoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
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
        contentView.addSubview(promoImageView)
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            promoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            promoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            promoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            promoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func loadImage(named imageName: String) {
        self.promoImageView.image = UIImage(named: imageName)
    }
}
