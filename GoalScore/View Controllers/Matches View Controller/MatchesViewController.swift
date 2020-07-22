//
//  MatchesViewController.swift
//  GoalScore
//
//  Created by mac_user on 6/27/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

class MatchesViewController: GSBaseViewController {
    
    @IBOutlet weak var headerView: GSHeaderView!
    @IBOutlet weak var imageSlideShow: GSImageSlideshow!
    @IBOutlet weak var calendarCollectionView: CalendarCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarCollectionView.setupView()
        
    }
    
    override func setupInterface() {
        
        super.setupInterface()
        imageSlideShow.setupImageSlideShow(controller: self, imageSources: [ImageSource(image: UIImage(named: "match_1")!), ImageSource(image: UIImage(named: "match_2")!), ImageSource(image: UIImage(named: "match_3")!), ImageSource(image: UIImage(named: "match_4")!), ImageSource(image: UIImage(named: "match_5")!)])
    }
    
    override func setupHeaderView() {
        super.setupHeaderView()
        self.headerView.setupHeaderView(leftIcon: "ic_menu", titleLabel: "Goal Score", delegate: self)
    }
}
