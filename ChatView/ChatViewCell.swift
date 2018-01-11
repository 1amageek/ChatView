//
//  ChatViewCell.swift
//  msg
//
//  Created by 1amageek on 2017/01/30.
//  Copyright © 2017年 Stamp inc. All rights reserved.
//

import UIKit

open class ChatViewCell: UICollectionViewCell {

    public private(set) lazy var stackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(stackView)
        self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.contentView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentView.addSubview(stackView)
        self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.contentView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
    }
}
