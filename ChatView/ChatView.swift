//
//  ChatView.swift
//  msg
//
//  Created by 1amageek on 2017/01/30.
//  Copyright © 2017年 Stamp inc. All rights reserved.
//

import UIKit

public class ChatView: UICollectionView {
    
    public var offsetToBottom: CGPoint {
        let visibleHeight: CGFloat = self.bounds.height - self.contentInset.bottom
        let offsetY: CGFloat = max(self.contentSize.height - visibleHeight, 0)
        return CGPoint(x: 0, y: offsetY)
    }

    public func scrollToBottom(_ animated: Bool) {
        let visibleHeight: CGFloat = self.bounds.height - self.contentInset.bottom
        if self.contentSize.height > visibleHeight {
            let offsetY: CGFloat = self.contentSize.height - visibleHeight
            let offset: CGPoint = CGPoint(x: 0, y: offsetY)
            self.setContentOffset(offset, animated: animated)
        }
    }
}
