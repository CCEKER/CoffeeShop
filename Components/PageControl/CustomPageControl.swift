//
//  CustomPageControl.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class CustomPageControl: UIView {

    var numberOfPages: Int = 0 {
           didSet {
               setupPages()
           }
       }
       
       var currentPage: Int = 0 {
           didSet {
               updateCurrentPage()
           }
       }
       
       private let stackView = UIStackView()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupStackView()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupStackView()
       }
       
       private func setupStackView() {
           stackView.axis = .horizontal
           stackView.distribution = .fill
           stackView.alignment = .fill
           stackView.spacing = 3
           stackView.translatesAutoresizingMaskIntoConstraints = false
           addSubview(stackView)
           
           NSLayoutConstraint.activate([
               stackView.topAnchor.constraint(equalTo: topAnchor),
               stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
               stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
               stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
           ])
       }
       
       private func setupPages() {
           stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
           
           for _ in 0..<numberOfPages {
               let dot = UIView()
               dot.backgroundColor = UIColor.init(rgb: 0xAAAAAA)
               dot.layer.cornerRadius = 4
               dot.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   dot.widthAnchor.constraint(equalToConstant: 6),
                   dot.heightAnchor.constraint(equalToConstant: 6)
               ])
               stackView.addArrangedSubview(dot)
           }
           
           updateCurrentPage()
       }
       
       private func updateCurrentPage() {
           for (index, dot) in stackView.arrangedSubviews.enumerated() {
               dot.backgroundColor = index == currentPage ? .black : .lightGray
           }
       }

}
