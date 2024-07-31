//
//  CoffeShopWelcomeView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 19.03.2024.
//

import UIKit

class CoffeShopWelcomeView: UIView {
    
    private let backgroundHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImage2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 36)
        view.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        view.textColor = .white
        view.numberOfLines = 3
        view.textAlignment = .center
        view.adjustsFontForContentSizeCategory = false
        view.heightAnchor.constraint(equalToConstant: 129).isActive = true
        return view
    }()
    
    private let subtitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textColor = UIColor.init(rgb: 0xA9A9A9)
        view.numberOfLines = 2
        view.textAlignment = .center
        view.adjustsFontForContentSizeCategory = false
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return view
    }()
    
    let getStartedButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor.init(rgb: 0xC67C4E)
        view.layer.cornerRadius = 16
        view.titleLabel?.font = UIFont(name: "Sora", size: 16)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, subtitle])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .fill
        view.distribution = .fill
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
        addSubview(backgroundHolderView)
        backgroundHolderView.addSubview(backgroundImage)
        backgroundHolderView.addSubview(backgroundImage2)
        backgroundHolderView.addSubview(stackView)
        backgroundHolderView.addSubview(getStartedButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            backgroundHolderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundHolderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundHolderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundHolderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: backgroundHolderView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: backgroundHolderView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: backgroundHolderView.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            backgroundImage2.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            backgroundImage2.leadingAnchor.constraint(equalTo: backgroundHolderView.leadingAnchor),
            backgroundImage2.trailingAnchor.constraint(equalTo: backgroundHolderView.trailingAnchor),
            backgroundImage2.bottomAnchor.constraint(equalTo: backgroundHolderView.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: backgroundHolderView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: backgroundHolderView.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            
            getStartedButton.leadingAnchor.constraint(equalTo: backgroundHolderView.leadingAnchor, constant: 30),
            getStartedButton.trailingAnchor.constraint(equalTo: backgroundHolderView.trailingAnchor, constant: -30),
            getStartedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -9),
            getStartedButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    func reloadWith(_ viewModel: CoffeShopWelcomeViewModel) {
        backgroundImage.image = viewModel.backgroundImage
        backgroundImage2.image = viewModel.backgroundImage2
        title.text = viewModel.title
        subtitle.text = viewModel.subtitle
        getStartedButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
}
