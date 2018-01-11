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

    public lazy var widthConstraint: NSLayoutConstraint = {
        return self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
    }()

    public lazy var heightConstraint: NSLayoutConstraint = {
        return self.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
    }()

    public lazy var topConstraint: NSLayoutConstraint = {
        return self.contentView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0)
    }()

    public lazy var bottomConstraint: NSLayoutConstraint = {
        return self.contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0)
    }()

    public lazy var leadingConstraint: NSLayoutConstraint = {
        return self.contentView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0)
    }()

    public lazy var trailingConstraint: NSLayoutConstraint = {
        return self.contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stackView)
        self.widthConstraint.isActive = true
        self.heightConstraint.isActive = true
        self.topConstraint.isActive = true
        self.bottomConstraint.isActive = true
        self.leadingConstraint.isActive = true
        self.trailingConstraint.isActive = true
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stackView)
        self.widthConstraint.isActive = true
        self.heightConstraint.isActive = true
        self.topConstraint.isActive = true
        self.bottomConstraint.isActive = true
        self.leadingConstraint.isActive = true
        self.trailingConstraint.isActive = true
    }
}
