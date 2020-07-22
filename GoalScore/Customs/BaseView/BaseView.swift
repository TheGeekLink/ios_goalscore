//
//  BaseView.swift
//  GoalScore
//
//  Created by mac_user on 6/28/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

class BaseView: UIView {

    @IBOutlet weak var view: UIView!
     override init(frame: CGRect) {
            super.init(frame: frame)
            self.xibSetup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.xibSetup()
        }
    
        override func embeddedView() -> UIView? {
            return view
        }
    
        override func setupView() {
            super.setupView()
        }
        
        override var backgroundColor: UIColor? {
            didSet {
                view?.backgroundColor = backgroundColor
            }
        }

}
