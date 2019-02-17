//
//  MyButton.swift
//  CustomButton
//
//  Created by juhee on 10/02/2019.
//  Copyright © 2019 caution-dev. All rights reserved.
//

import UIKit

class MyButton: UIView {

    fileprivate typealias Action = (() -> Void)?
    
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    // MARK : View Components
    private var titleLabel: UILabel!
    
    private var leadingImageView: UIImageView!
    
    //MARK: IBInspectable
    private let minimumMargin: CGFloat = 4
    @IBInspectable var title: String = "Button" {
        didSet {
            titleLabel.text = title
        }
    }
    @IBInspectable var textColor: UIColor = UIColor.blue {
        didSet {
            titleLabel.textColor = textColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor = .blue {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var image: UIImage? = nil {
        didSet {
            if let image = image {
                leadingImageView.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
                leadingImageView.image = image
            } else {
                leadingImageView.frame = CGRect.zero
            }
        }
    }
    
    //MARK: Initializer
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel()
        titleLabel.text = "Button"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        leadingImageView = UIImageView(frame: CGRect.zero)
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leadingImageView)
        self.isUserInteractionEnabled = true
        setConstraints()
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setConstraints() {
        leadingImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: minimumMargin).isActive = true
        leadingImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: minimumMargin).isActive = true
        leadingImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1 * minimumMargin).isActive = true
        titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: minimumMargin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -1 * minimumMargin).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func updateView() {
        titleLabel.text = title
        titleLabel.textColor = textColor
        titleLabel.textAlignment = .center
        leadingImageView.image = image
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.shadowColor = shadowColor.cgColor
    }
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    public func addTapGestureRecognizers(action: (() -> Void)?) {
        self.tapGestureRecognizerAction = action
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTouchInside))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
    }
    
    private var touchAction: () -> Void = {}
    
    @objc func didTouchInside(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
}

extension MyButton: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return (touch.view == self)
    }
}

