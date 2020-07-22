//
//  GSHeaderView.swift
//  GoalScore
//
//  Created by mac_user on 7/5/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit


@objc protocol GSHeaderViewDelegate: class {
    @objc optional func onRightButtonTap()
    @objc optional func onLeftButtonTap()
}

class GSHeaderView: BaseView {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    
    var delegate: GSHeaderViewDelegate?
    
    func setupHeaderView(leftTitle: String = "", leftIcon: String = "", titleImage: String = "", titleLabel: String = "", rightTitle: String = "", righttIcon: String = "", delegate: GSHeaderViewDelegate?) {
    
        self.delegate = delegate
        self.leftButton.isHidden = leftTitle.isEmpty && leftIcon.isEmpty
        
        self.leftButton.setTitle(leftTitle, for: .normal)
        if !leftIcon.isEmpty {
            self.leftButton.setImage(UIImage(named: leftIcon), for: .normal)
        }
        
        self.titleLabel.isHidden = titleLabel.isEmpty
        self.titleImage.isHidden = titleImage.isEmpty
        
        if !titleImage.isEmpty {
            self.titleImage.image = UIImage(named: titleImage)
        }
        
        if !titleLabel.isEmpty {
            self.titleLabel.text = titleLabel
        }
        
        self.rightButton.isHidden = rightTitle.isEmpty && righttIcon.isEmpty
        self.rightButton.setTitle(rightTitle, for: .normal)
        
        if !righttIcon.isEmpty {
            self.rightButton.setImage(UIImage(named: leftIcon), for: .normal)
        }
                
    }
    
    
    @IBAction func leftAction(_ sender: Any) {
        if let onLeftButtonTap = delegate?.onLeftButtonTap {
            onLeftButtonTap()
        }
    }
    @IBAction func rightAction(_ sender: Any) {
        if let onRightButtonTap = delegate?.onRightButtonTap {
            onRightButtonTap()
        }
    }
}
