//
//  SelfSizingUICollectionView.swift
//  Sit Next To
//
//  Created by Blerina Berisha on 11/21/19.
//  Copyright © 2019 Blerina Berisha. All rights reserved.
//

import UIKit

class SelfSizingCollectionView: UICollectionView {

    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }
}
