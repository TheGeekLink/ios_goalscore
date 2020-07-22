//
//  SideMenuView.swift
//  GoalScore
//
//  Created by mac_user on 6/27/20.
//  Copyright © 2020 com.TGL.GoalScore. All rights reserved.
//

import UIKit

struct Menu {
    var cellId:String! = ""
    var cellName:String! = ""
    var cellImage:String! = ""
}

class SideMenuView: UIView, ExpandableDelegate {

    @IBOutlet weak var expandableTableView: ExpandableTableView!
    
    var homeParentViewController: UIViewController?
    var menus:[[Menu]]?
    
    var cell: UITableViewCell {
        if let tableview = expandableTableView {
            return tableview.dequeueReusableCell(withIdentifier:ExpandedCell.ID)!
        }
        return UITableViewCell()
    }
    
    func menuDidLoad()  {
        
        var menu2 = Menu()
        menu2.cellId = ExpandableCell2.ID
        menu2.cellName = "Service"
        menu2.cellImage = "ic_services"
        
        var menu3 = Menu()
        menu3.cellId = NormalCell.ID
        menu3.cellName = NSLocalizedString("salon_text", comment: "")
        menu3.cellImage = "ic_salon"
        
        var menu4 = Menu()
        menu4.cellId = ExpandableCell2.ID
        menu4.cellName = "Choose Service"
        menu4.cellImage = "ic_choose_services"
        
        var menu5 = Menu()
        menu5.cellId = NormalCell.ID
        menu5.cellName = "Add Bundle"
        menu5.cellImage = "ic_add_bundle"
        
        var menu6 = Menu()
        menu6.cellId = NormalCell.ID
        menu6.cellName = "Manage Time"
        menu6.cellImage = "ic_manage_time"
        
        var menu7 = Menu()
        menu7.cellId = NormalCell.ID
        menu7.cellName = "Exception Manage Time"
        menu7.cellImage = "ic_barber"
        
        var menu8 = Menu()
        menu8.cellId = NormalCell.ID
        menu8.cellName = "Barber"
        menu8.cellImage = "ic_exception_manage_time"
        
        var menu9 = Menu()
        menu9.cellId = NormalCell.ID
        menu9.cellName = "Beautician Requests"
        menu9.cellImage = "ic_exception_manage_time"
        
        var menu10 = Menu()
        menu10.cellId = NormalCell.ID
        menu10.cellName = "Log Out"
        
//        menus = [[menu3, menu2, menu8, menu6, menu7, menu9, menu10]]
        
        expandableTableView?.expandableDelegate = self
        expandableTableView?.animation = .automatic
        
        expandableTableView?.separatorStyle = .none
        
        expandableTableView?.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: NormalCell.ID)
        expandableTableView?.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.ID)
        expandableTableView?.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: ExpandableCell2.ID)
        expandableTableView?.register(UINib(nibName: "ExpandableSelectableCell", bundle: nil), forCellReuseIdentifier: ExpandableSelectableCell2.ID)

        
    }
    
    //scroll view methods are being forwarded correctly
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidScroll, decelerate:\(decelerate)")
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
    
    
    // fill the sub cells
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        
        if let myMenu = menus?[indexPath.section][indexPath.row], myMenu.cellId == ExpandableCell2.ID {
            
            if(myMenu.cellName == "Service") {
                let cell1 = expandableTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell1.titleLabel.text = "Add \(String(describing: myMenu.cellName!))"
                cell1.imgView?.image =  UIImage(named: "ic_add")
                fixImageRatio(imgeName: "ic_add", imageView: cell1.imgView, containerView: cell1.containerView)
                
                let cell2 = expandableTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell2.titleLabel.text = "Choose \(String(describing: myMenu.cellName!))"
                cell2.imgView?.image =  UIImage(named: "ic_modify")
                fixImageRatio(imgeName: "ic_modify", imageView: cell2.imgView, containerView: cell2.containerView)
                
                return [cell1, cell2]
            }
            else {
                let cell1 = expandableTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell1.titleLabel.text = "Add \(String(describing: myMenu.cellName!))"
                cell1.imgView?.image =  UIImage(named: "ic_add")
                fixImageRatio(imgeName: "ic_add", imageView: cell1.imgView, containerView: cell1.containerView)
                
                let cell2 = expandableTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell2.titleLabel.text = "Delete \(String(describing: myMenu.cellName!))"
                cell2.imgView?.image =  UIImage(named: "ic_delete")
                fixImageRatio(imgeName: "ic_delete", imageView: cell2.imgView, containerView: cell2.containerView)
                
                let cell3 = expandableTableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell3.titleLabel.text = "Modify \(String(describing: myMenu.cellName!))"
                cell3.imgView?.image =  UIImage(named: "ic_modify")
                fixImageRatio(imgeName: "ic_modify", imageView: cell3.imgView, containerView: cell3.containerView)
                
                return [cell1, cell2, cell3]
            }
        }
        return nil
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        return [44, 44, 44]
    }
    
    func numberOfSections(in tableView: ExpandableTableView) -> Int {
        return self.menus?.count ?? 0
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return self.menus?[section].count ?? 0
    }
    
    // did select for normal cell and header expanded cell
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell: UITableViewCell = self.expandableTableView?.cellForRow(at: indexPath)! ?? UITableViewCell()
        
        
        if selectedCell.tag == 2 {
            let cells = selectedCell as! NormalCell
            print("DidSelect: %@", cells.normalCellTitle.text!)
            
            if cells.normalCellTitle.text! == "" {
            }
            
        }
        else {
            UIView.animate(withDuration: 0.2) {
                
                let cells = selectedCell as! ExpandableCell2
                
                if cells.arrowImg.transform == CGAffineTransform.identity {
                    cells.arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi) / -2)
                    
                }
                else {
                    cells.arrowImg.transform = CGAffineTransform.identity
                }
            }
        }
        
    }
    
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        //        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    // did select an expandable cell
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        
        if let cell = expandedCell as? ExpandedCell {
            
            print("\(cell.titleLabel.text ?? "")")
            if (cell.titleLabel.text?.contains(""))! {
            }
            
        }
    }
    
    //header section if commented then it is hidden
    
    //    func expandableTableView(_ expandableTableView: ExpandableTableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Section:\(section)"
    //    }
    //    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 20
    //    }
    
    // create the cells
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellId = menus?[indexPath.section][indexPath.row].cellId, let cell = expandableTableView.dequeueReusableCell(withIdentifier: cellId) else {
            return UITableViewCell()
        }
        
        if let menu = menus?[indexPath.section][indexPath.row], menu.cellId == ExpandableCell2.ID {
            let expandableCell = cell as! ExpandableCell2
            expandableCell.tag = 1
            
            //hide the parent arrow
            expandableCell.arrowImageView.isHidden = true
            
            expandableCell.expandableCellTitle.text = menus?[indexPath.section][indexPath.row].cellName;
            
            // load the image
            expandableCell.imgView?.image =  UIImage(named: menu.cellImage)
            fixImageRatio(imgeName: menu.cellImage, imageView: expandableCell.imgView, containerView: expandableCell.containerView)
            return expandableCell
        }
        else if menus?[indexPath.section][indexPath.row].cellId == NormalCell.ID {
            let normalCell = cell as! NormalCell
            normalCell.tag = 2
            normalCell.normalCellTitle.text = menus?[indexPath.section][indexPath.row].cellName;
            
            // load the image
            if let cellImage = menus?[indexPath.section][indexPath.row].cellImage, !cellImage.isEmpty {
                normalCell.imageView?.isHidden = false
                normalCell.imgView?.image =  UIImage(named: cellImage)
                fixImageRatio(imgeName: cellImage, imageView: normalCell.imgView, containerView: normalCell.containerView)
            } else {
                normalCell.imageView?.isHidden = true
            }
            
            return normalCell
        }
        return cell
    }
    
    
    // height for normal cell
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    @objc(expandableTableView:didCloseRowAt:) func expandableTableView(_ expandableTableView: UITableView, didCloseRowAt indexPath: IndexPath) {
        let cell = expandableTableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func expandableTableView(_ expandableTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
    }
    
    func fixImageRatio(imgeName:String, imageView:UIImageView, containerView:UIView) {
        if let image = UIImage(named: imgeName) {
            let ratio = image.size.width / image.size.height
            if containerView.frame.width > containerView.frame.height {
                let newHeight = containerView.frame.width / ratio
                imageView.frame.size = CGSize(width: containerView.frame.width, height: newHeight)
            }
            else{
                let newWidth = containerView.frame.height * ratio
                imageView.frame.size = CGSize(width: newWidth, height: containerView.frame.height)
            }
        }
    }
    
}
