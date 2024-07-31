//
//  CustomFlowLayout.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 20.03.2024.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
            guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
            
            let nextX: CGFloat
            if proposedContentOffset.x <= 0 || collectionView.contentOffset == proposedContentOffset {
                nextX = 0
            } else {
                let targetX = collectionView.contentOffset.x + velocity.x * 60.0
                let targetIndex = round(targetX / (itemSize.width + minimumLineSpacing))
                nextX = targetIndex * (itemSize.width + minimumLineSpacing)
            }
            
            return CGPoint(x: nextX, y: proposedContentOffset.y)
        }

}
