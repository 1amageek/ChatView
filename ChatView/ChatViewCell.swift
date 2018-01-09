//
//  ChatViewCell.swift
//  msg
//
//  Created by 1amageek on 2017/01/30.
//  Copyright © 2017年 Stamp inc. All rights reserved.
//

import UIKit

open class ChatViewCell: UICollectionViewCell {

    open override func layoutSubviews() {
        super.layoutSubviews()
        _ = calculateSize()
    }
    
    open func calculateSize() -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
}
