//
//  ChatViewController.swift
//  msg
//
//  Created by 1amageek on 2017/01/30.
//  Copyright © 2017年 Stamp inc. All rights reserved.
//

import UIKit
import Toolbar

open class ChatViewController: UIViewController, UICollectionViewDelegate {

    var toolbarBottomConstraint: NSLayoutConstraint?

    open func registerCells(_ collectionView: UICollectionView) {

    }
    
    open override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        self.view.addSubview(toolbar)
        self.toolbarBottomConstraint = self.toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        self.toolbarBottomConstraint?.isActive = true
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.contentInsetAdjustmentBehavior = .automatic
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        layoutChatView()
        self.collectionView.scrollToBottom(false)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    open override func viewWillLayoutSubviews() {
        self.collectionView.frame = self.view.bounds
    }

    func layoutChatView() {
        var contentInset: UIEdgeInsets = collectionView.contentInset
        contentInset.top = contentInsetTop
        contentInset.bottom = toolBarHeight
        collectionView.scrollIndicatorInsets = contentInset
        contentInset.top = contentInsetTop + 8
        contentInset.bottom = toolBarHeight + 8
        collectionView.contentInset = contentInset
    }

    // Keyboard

    var contentInsetTop: CGFloat {
        return 0
    }

    private var toolBarHeight: CGFloat {
        return self.keyboardHeight + self.toolbar.bounds.height
    }

    private var keyboardHeight: CGFloat = 0

    @objc final func keyboardWillShow(notification: Notification) {
        moveToolbar(up: true, notification: notification)
    }

    @objc final func keyboardWillHide(notification: Notification) {
        moveToolbar(up: false, notification: notification)
    }

    var propertyAnimator: UIViewPropertyAnimator?

    final func moveToolbar(up: Bool, notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let animationDuration: TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        //let animationCurve: UIViewAnimationCurve = UIViewAnimationCurve(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue)!
        self.keyboardHeight = up ? (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height : 0
        self.toolbarBottomConstraint?.constant = -self.keyboardHeight
        
        // Animation
        self.layoutChatView()
        UIView.animate(withDuration: animationDuration, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        if up {
            self.collectionView.scrollToBottom(true)
        }
    }

    // MARK: -

    public private(set) lazy var collectionView: ChatView = {
        let layout: ChatViewFlowLayout = ChatViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        let view: ChatView = ChatView(frame: self.view.bounds, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.register(ChatViewCell.self, forCellWithReuseIdentifier: "ChatViewCell")
        self.registerCells(view)
        view.backgroundColor = .white
        view.keyboardDismissMode = .onDrag
        return view
    }()

    public private(set) lazy var toolbar: Toolbar = {
        let toolbar: Toolbar = Toolbar()
        toolbar.maximumHeight = 100
        return toolbar
    }()
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ChatViewController: UICollectionViewDataSource {

    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ChatViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatViewCell", for: indexPath) as! ChatViewCell
        return cell
    }
}

extension ChatViewController: UITextViewDelegate {

    public func textViewDidChangeSelection(_ textView: UITextView) {
        textView.scrollRangeToVisible(textView.selectedRange)
    }
}

