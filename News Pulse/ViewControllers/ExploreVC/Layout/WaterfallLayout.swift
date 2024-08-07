//
//  WaterfallLayout.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

//MARK: - WATERFALL LAYOUT
//class WaterfallLayout: UICollectionViewLayout {
//    var delegate: UICollectionViewDelegateFlowLayout!
//    
//    private var numberOfColumns = 2
//    private var cellPadding: CGFloat = 6.0
//    private var cache: [UICollectionViewLayoutAttributes] = []
//    
//    private var contentHeight: CGFloat = 0
//    private var contentWidth: CGFloat {
//        guard let collectionView = collectionView else {
//            return 0
//        }
//        let insets = collectionView.contentInset
//        return collectionView.bounds.width - (insets.left + insets.right)
//    }
//    
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: contentWidth, height: contentHeight)
//    }
//    
//    override func prepare() {
//        guard cache.isEmpty, let collectionView = collectionView else {
//            return
//        }
//        
//        let columnWidth = contentWidth / CGFloat(numberOfColumns)
//        var xOffset: [CGFloat] = []
//        for column in 0 ..< numberOfColumns {
//            xOffset.append(CGFloat(column) * columnWidth)
//        }
//        var column = 0
//        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
//        
//        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
//            let indexPath = IndexPath(item: item, section: 0)
//            
//            let width = columnWidth - cellPadding * 2
//            let text = delegate.collectionView?(collectionView, layout: self, sizeForItemAt: indexPath) ?? CGSize(width: width, height: 60)
//            let height = text.height + cellPadding * 2
//            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
//            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
//            
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//            attributes.frame = insetFrame
//            cache.append(attributes)
//            
//            contentHeight = max(contentHeight, frame.maxY)
//            yOffset[column] = yOffset[column] + height
//            
//            column = column < (numberOfColumns - 1) ? (column + 1) : 0
//        }
//    }
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return cache.filter { $0.frame.intersects(rect) }
//    }
//    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return cache[indexPath.item]
//    }
//}
//// MARK: - UICollectionViewDelegateFlowLayout
//extension ExploreVC: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let section = indexPath.section
//        if section == 0{
//            let width = (collectionView.bounds.width / 2) - 12 // Adjusted for padding
//            return CGSize(width: width, height: 60)
//        } else {
//            let text = deleteArray[indexPath.item]
//            let width = (collectionView.bounds.width / 2) - 12 // Adjusted for padding
//            let height = heightForText(text, width: width)
//            return CGSize(width: width, height: height)
//        }
//        
//    }
//    
//    private func heightForText(_ text: String, width: CGFloat) -> CGFloat {
//        let font = UIFont.systemFont(ofSize: 14)
//        let rect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
//                                                       options: .usesLineFragmentOrigin,
//                                                       attributes: [.font: font],
//                                                       context: nil)
//        return ceil(rect.height) + 36 // Padding
//    }
//}
