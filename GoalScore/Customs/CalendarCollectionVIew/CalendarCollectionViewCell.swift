//
//  CalendarCollectionViewCell.swift
//  GoalZone
//
//  Created by mac_user on 3/19/1440 AH.
//  Copyright © 1440 AH Apple. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dayMonthLabel: UILabel!
    @IBOutlet var mainContainer: UIView!
    
    
    override var isSelected: Bool {
        
        didSet {
            if isSelected {
                dateLabel.textColor = UIColor.black
                dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
                dayMonthLabel.textColor = UIColor.black
                dayMonthLabel.font = UIFont.boldSystemFont(ofSize: 14)
                mainContainer.backgroundColor = UIColor(hexString: "#FBBC05")
                //
            } else {
                dateLabel.textColor = UIColor.white
                dateLabel.font = UIFont.systemFont(ofSize: 14)
                dayMonthLabel.textColor = UIColor.white
                dayMonthLabel.font = UIFont.systemFont(ofSize: 14)
                mainContainer.backgroundColor = UIColor(hexString: "#2B2A48")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
