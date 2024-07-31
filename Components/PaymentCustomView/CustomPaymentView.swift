//
//  CustomPaymentView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import UIKit

class CustomPaymentView: UIView {
    
    let cashLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = UIColor.init(rgb: 0xC67C4E)
        view.adjustsFontSizeToFitWidth = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cashPriceLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.textAlignment = .center
        view.adjustsFontSizeToFitWidth = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cashStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [cashLabel, cashPriceLabel])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 2
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cashStackView.layoutIfNeeded()
        
        cashLabel.layer.cornerRadius = cashLabel.bounds.height / 2
        cashPriceLabel.layer.cornerRadius = cashPriceLabel.bounds.height / 2
        
        cashLabel.clipsToBounds = true
        cashPriceLabel.clipsToBounds = true
    }
    
    private func setupViews() {
        backgroundColor = UIColor.init(rgb: 0xF6F6F6)
        addSubview(cashStackView)
        self.layer.cornerRadius = 20
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            cashStackView.topAnchor.constraint(equalTo: topAnchor),
            cashStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cashStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cashStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
