//
//  CustomProgressView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 26.03.2024.
//

import UIKit

class CustomProgressView: UIView {
    
    private let totalBars = 4
    private var bars: [UIView] = []
    private let barSpacing: CGFloat = 8.0
    private let barHeigth: CGFloat = 4
    private let cornerRadius: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBars()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBars()
    }
    
    private func setupBars() {
        for _ in 0..<totalBars {
            let bar = UIView()
            bar.backgroundColor = .clear
            bar.layer.cornerRadius = cornerRadius
            bar.clipsToBounds = true
            bars.append(bar)
            addSubview(bar)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let barWidth = (self.bounds.width - (CGFloat(totalBars - 1) * barSpacing)) / CGFloat(totalBars)
        
        let barCornerRadius = barHeigth / 2
        
        for (index, bar) in bars.enumerated() {
            let barX = CGFloat(index) * (barWidth + barSpacing)
            bar.frame = CGRect(x: barX, y: 0, width: barWidth, height: barHeigth)
            bar.layer.cornerRadius = barCornerRadius
        }
    }

    func randomizeProgress() {
        bars.forEach { $0.backgroundColor = UIColor.init(rgb: 0xDFDFDF) }
        
        let filledBars = Int.random(in: 1...totalBars)
        for i in 0..<filledBars {
            bars[i].backgroundColor = UIColor.init(rgb: 0x36C07E)
        }
    }
}
