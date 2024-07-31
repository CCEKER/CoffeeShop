//
//  CoffeeShopOrderView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 23.03.2024.
//

import UIKit

class CoffeeShopOrderView: UIView {
    
    private let customPaymentView = CustomPaymentView()
    
    private let deliveryTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let address: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x303336)
        return view
    }()
    
    private let addressDetail: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.textColor = UIColor.init(rgb: 0x808080)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        return view
    }()
    
    private let editAddressButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addNoteButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [editAddressButton, addNoteButton])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [deliveryTitle, address, addressDetail])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 12
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
    
    private let productImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let productSubtitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x9B9B9B)
        return view
    }()
    
    let minusButton: UIButton = {
        let view = UIButton(type: .custom)
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        view.widthAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let productCountLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.textAlignment = .center
        view.text = "1"
        return view
    }()
    
    let plusButton: UIButton = {
        let view = UIButton(type: .custom)
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        view.widthAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [productTitle, productSubtitle])
        view.spacing = 4
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private lazy var plusAndMinusButtonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [minusButton, productCountLabel, plusButton])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 4
        return view
    }()
    
    private lazy var imageStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [productImage, titleStackView, plusAndMinusButtonStackView])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 12
        return view
    }()
    
    private let seperatorView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        return view
    }()
    
    private let discountCodeHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
        return view
    }()
    
    private let discountIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()
    
    private let discountTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        view.numberOfLines = 0
        return view
    }()
    
    private let arrowRightIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    private lazy var discountStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [discountIcon, discountTitle, arrowRightIcon])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paymentSummaryTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let priceTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let priceValueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let deliveryFreeTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let deliveryFeeValueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let totalPaymentTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private let seperatorView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0xEAEAEA)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private let totalPaymentValueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x2F2D2C)
        return view
    }()
    
    private lazy var priceStackView = createStackView(leftLabel: priceTitleLabel, rigthLabel: priceValueLabel)
    private lazy var deliveryFeeStackView = createStackView(leftLabel: deliveryFreeTitleLabel, rigthLabel: deliveryFeeValueLabel)
    private lazy var totalPaymentStackView = createStackView(leftLabel: totalPaymentTitleLabel, rigthLabel: totalPaymentValueLabel)
    
    private lazy var summarryStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [priceStackView, deliveryFeeStackView, seperatorView3, totalPaymentStackView])
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let moneyIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()
    
    private lazy var moneysIconStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [moneyIcon, customPaymentView])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let orderButton: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0xC67C4E)
        view.layer.cornerRadius = 16
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "Sora", size: 16)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
        backgroundColor = UIColor.init(rgb: 0xF5F5F5)
        addSubview(verticalStackView)
        addSubview(buttonStackView)
        addSubview(seperatorView)
        addSubview(imageStackView)
        addSubview(seperatorView2)
        addSubview(discountCodeHolderView)
        discountCodeHolderView.addSubview(discountStackView)
        addSubview(summarryStackView)
        addSubview(holderView)
        holderView.addSubview(moneysIconStackView)
        holderView.addSubview(orderButton)
        customPaymentView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            buttonStackView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 16),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            seperatorView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            imageStackView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 20),
            imageStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            productImage.heightAnchor.constraint(equalToConstant: 54),
            productImage.widthAnchor.constraint(equalToConstant: 54),
            
            editAddressButton.heightAnchor.constraint(equalToConstant: 27),
            addNoteButton.heightAnchor.constraint(equalToConstant: 27),
            
            seperatorView2.topAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 20),
            seperatorView2.heightAnchor.constraint(equalToConstant: 4),
            seperatorView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            discountCodeHolderView.topAnchor.constraint(equalTo: seperatorView2.bottomAnchor, constant: 20),
            discountCodeHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            discountCodeHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            discountCodeHolderView.heightAnchor.constraint(equalToConstant: 56),
            
            discountStackView.topAnchor.constraint(equalTo: discountCodeHolderView.topAnchor, constant: 16),
            discountStackView.leadingAnchor.constraint(equalTo: discountCodeHolderView.leadingAnchor, constant: 16),
            discountStackView.trailingAnchor.constraint(equalTo: discountCodeHolderView.trailingAnchor, constant: -18),
            discountStackView.bottomAnchor.constraint(equalTo: discountCodeHolderView.bottomAnchor, constant: -16),
            
            summarryStackView.topAnchor.constraint(equalTo: discountCodeHolderView.bottomAnchor, constant: 20),
            summarryStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            summarryStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            holderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            holderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            holderView.heightAnchor.constraint(equalToConstant: 161),
            
            customPaymentView.widthAnchor.constraint(equalToConstant: 112),
            customPaymentView.heightAnchor.constraint(equalToConstant: 24),
            
            moneysIconStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 16),
            moneysIconStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            
            orderButton.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            orderButton.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -30),
            orderButton.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -30),
            orderButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    func reloadWith(_ viewModel: CoffeeShopOrderViewModel) {
        deliveryTitle.text = viewModel.deliveryTitle
        address.text = viewModel.address
        addressDetail.text = viewModel.addressDetail
        editAddressButton.setImage(viewModel.editAdressButtonIcon, for: .normal)
        addNoteButton.setImage(viewModel.addNoteButtonIcon, for: .normal)
        productImage.image = UIImage(named: viewModel.selectedProductImageUrl)
        productTitle.text = viewModel.productTitle
        productSubtitle.text = viewModel.productSubtitle
        minusButton.setImage(viewModel.minusButtonIcon, for: .normal)
        plusButton.setImage(viewModel.plusButtonIcon, for: .normal)
        productCountLabel.text = viewModel.productCountLabel
        minusButton.isEnabled = viewModel.isMinusButtonEnabled
        plusButton.isEnabled = viewModel.isPlusButtonEnabled
        discountIcon.image = viewModel.discountIcon
        arrowRightIcon.image = viewModel.arrowRightIcon
        discountTitle.text = viewModel.discountTitle
        paymentSummaryTitle.text = viewModel.paymentSummaryTitle
        priceTitleLabel.text = viewModel.priceTitleLabel
        priceValueLabel.text = viewModel.priceValueLabel
        deliveryFreeTitleLabel.text = viewModel.deliveryFeeTitleLabel
        deliveryFeeValueLabel.text = viewModel.deliveryFeeDiscountLabel
        totalPaymentTitleLabel.text = viewModel.totalPaymentTitleLabel
        totalPaymentValueLabel.text = viewModel.totalPaymentValueLabel
        moneyIcon.image = viewModel.moneysIcon
        customPaymentView.cashLabel.text = viewModel.cashTitleLabel
        customPaymentView.cashPriceLabel.text = viewModel.cashPriceLabel
        orderButton.setTitle(viewModel.orderButtonTitle, for: .normal)
    }
    
    private func createStackView(leftLabel: UILabel, rigthLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [leftLabel, rigthLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        rigthLabel.textAlignment = .right
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
