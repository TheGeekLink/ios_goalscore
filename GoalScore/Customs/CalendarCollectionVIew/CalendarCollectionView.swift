//
//  CalendarCollectionView.swift
//  GoalScore
//
//  Created by mac_user on 6/28/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

class CalendarCollectionView: BaseView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var calendars: [String]?
    var calendarPicker: CalendarPicker?
    var selectedDate: Int = 0
    
    override func setupView() {
        
        self.setupCollectionView()
        
        self.calendars = getCalendar().arrayOfDates()
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        self.collectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: [])
        collectionView(self.collectionView, didSelectItemAt: indexPathForFirstRow)
    }
    
    func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "CalendarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.itemSize.height = 70
        layout.itemSize.width = 70
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.collectionView.collectionViewLayout = layout
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.collectionView == scrollView {
            setSelectedItemFromScrollView(scrollView)
        }
    }
    
    func setSelectedItemFromScrollView(_ scrollView: UIScrollView) {
        
        if self.collectionView == scrollView {
            let center = CGPoint(x: scrollView.center.x + scrollView.contentOffset.x, y: scrollView.center.y + scrollView.contentOffset.y)
            let index = self.collectionView.indexPathForItem(at: center)
            if index != nil {
                self.collectionView.scrollToItem(at: index!, at: .centeredHorizontally, animated: true)
                self.collectionView.selectItem(at: index, animated: false, scrollPosition: [])
                self.collectionView(self.collectionView, didSelectItemAt: index!)
                
                self.selectedDate = (index?.row)!
            }
            else {
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if self.collectionView == scrollView && !decelerate  {
            setSelectedItemFromScrollView(scrollView)
        }
    }
}

extension CalendarCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = calendars?.count {
            return count + 1
        }
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell else {
            return CalendarCollectionViewCell()
        }
        
        if indexPath.row != self.calendars?.count {
            
            let dateString = self.calendars?[indexPath.row]
            let fullNameArr = dateString?.components(separatedBy: "-")
            
            cell.dateLabel.text = fullNameArr?[0]
            cell.dayMonthLabel.text = fullNameArr?[1]
            
        } else {
            cell.dateLabel.text = "Calendar"
            cell.dayMonthLabel.text = ""
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        self.selectedDate = indexPath.row
        let centeredIndexPath = IndexPath.init(item: selectedDate, section: 0)
        collectionView.scrollToItem(at: centeredIndexPath, at: .centeredHorizontally, animated: true)
        if indexPath == centeredIndexPath {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension CalendarCollectionView: CalendarDelgate {
    func getCalendar() -> CalendarPicker {
        guard let cal = calendarPicker else {
            let calendar = CalendarPicker()
            calendar.delegate = self
            calendarPicker = calendar
            return calendar
        }
        return cal
    }
}
