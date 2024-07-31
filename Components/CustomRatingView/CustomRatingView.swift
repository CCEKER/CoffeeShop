//
//  CustomRatingView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 21.03.2024.
//

import UIKit

class CustomRatingView: UIView {
    
    private let starIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "star"))
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.widthAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()
    
    let ratingLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 10)
        view.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0xFFFFFF)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [starIcon, ratingLabel])
        view.axis = .horizontal
        view.spacing = 2
        view.alignment = .center
        view.distribution = .fill
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
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        applyCustomCorners()
    }
    
    private func applyCustomCorners() {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 12, height: 12))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCustomCorners() 
    }
}

