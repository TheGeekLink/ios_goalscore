//
//  FavoritesViewController.swift
//  GoalScore
//
//  Created by mac_user on 6/27/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

class FavoritesViewController: GSBaseViewController {

    @IBOutlet weak var headerView: GSHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupHeaderView() {
        super.setupHeaderView()
        self.headerView.setupHeaderView(leftIcon: "ic_menu", titleLabel: "Goal Score", delegate: self)
    }

}
