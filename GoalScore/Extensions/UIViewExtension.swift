//
//  UIViewExtension.swift
//  GoalScore
//
//  Created by mac_user on 6/27/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

extension UIView {
    
    func dock(parentView: UIView?, left: Bool = true, top: Bool = true, right: Bool = true, bottom: Bool = true, constant: Int = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if top {
            parentView?.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: CGFloat(constant)))
        }
        
        if bottom {
            parentView?.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(-constant)))
        }
        if left {
            parentView?.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1.0, constant: CGFloat(constant)))
        }
        if right {
            parentView?.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parentView, attribute: .trailing, multiplier: 1.0, constant: CGFloat(-constant)))
        }
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    
    func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let fileName = self.typeName
        if let _ = bundle.path(forResource: fileName, ofType: "nib") {
            bundle.loadNibNamed(fileName, owner: self, options: nil)
        }
        
        if let view = embeddedView() {
            view.frame = self.bounds
            addAutoLayoutSubview(view)
        }
        
        setupView()
    }
    
    @objc func setupView() {
    }
    
    @objc func embeddedView() -> UIView? {
        return nil
    }
    
    public func addAutoLayoutSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        
        var anchors = [NSLayoutConstraint]()
        anchors.append(topAnchor.constraint(equalTo: subview.topAnchor, constant: 0))
        anchors.append(bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: 0))
        anchors.append(leadingAnchor.constraint(equalTo: subview.leadingAnchor, constant: 0))
        anchors.append(trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: 0))
        NSLayoutConstraint.activate(anchors)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    enum ViewSide {
        case left, right, top, bottom
    }
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
        case .bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        }
        
        layer.addSublayer(border)
    }
    
}
