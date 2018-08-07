//
//  RestaurantTableViewController.swift
//  foodpin
//
//  Created by viplab on 2018/7/27.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]

    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubandkitchen"]
    
    var restaurantLocations = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Sydney","Sydney","Sydney","New York","New York","New York","New York","New York","New York","New York","London","London","London","London"]
    
    var restaurantTypes = ["Coffee & Tea shop","Cafe","Tea House","Austrian / Causual Drink","French","Bakery","Chocolate","Cafe","American / Seafood","American","American","Breakfast & Brunch","Coffee & Tea","Coffee & Tea","Latin American","Spanish","Spanish","Spanish","British","British","Thai"]
    
    //初始化陣列
    var restaurantIsVisited = Array(repeating: false, count:21)
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // 設定cell
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        //避免cell顯示上一次的結果
        if restaurantIsVisited[indexPath.row]{
            cell.heartImageView.image = UIImage(named: "heart-tick")
        }else{
            cell.heartImageView.image = nil
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //建立一個選單作為動作清單
//        let optionMenu = UIAlertController(title: nil,message:"What do you want to do?",preferredStyle: .actionSheet)
//        //加入動作至選單中
//        //取消打勾
//        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel,handler:nil
//        )
//        optionMenu.addAction(cancelAction)
//        //加入打電話動作
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title:"Service Unavailable",message:"Sorry, the call feature is not available yet. Please retry later.",preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title:"OK.",style: .default, handler:nil))
//            self.present(alertMessage,animated:true,completion: nil)
//        }
//        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)",style: .default,handler:callActionHandler)
//        optionMenu.addAction(callAction)
//        //打卡動作
//        let checkInAction = UIAlertAction(title: restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in", style: .default,handler:{(action:UIAlertAction!) -> Void in
//            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//            if self.restaurantIsVisited[indexPath.row]{
//                cell.heartImageView.image = UIImage(named: "heart-tick")
//            }else{
//                cell.heartImageView.image = nil
//            }
//            
//            /*cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none*/
//            
//        })
//        optionMenu.addAction(checkInAction)
//        //呈現選單
//        present(optionMenu, animated: true, completion: nil)
//        //iPad 彈出
//        if let popoverController = optionMenu.popoverPresentationController{
//            if let cell = tableView.cellForRow(at: indexPath){
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        //取消列選取
//        tableView.deselectRow(at: indexPath, animated: false)
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            //從資料源刪除
            restaurantNames.remove(at:indexPath.row)
            restaurantLocations.remove(at:indexPath.row)
            restaurantTypes.remove(at:indexPath.row)
            restaurantIsVisited.remove(at:indexPath.row)
            restaurantImages.remove(at:indexPath.row)
        }
        
        tableView.deleteRows(at:[indexPath],with:.fade)
        //tableView.reloadData()
        
        print("Total item: \(restaurantNames.count)")
        for name in restaurantNames{
            print(name)
        }
    }
    //向左滑動
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,sourceView,completionHandler) in
            //從資料來源刪除列
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            //呼叫完成處理器來取消動作按鈕
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title:"Share"){
            (action,sourceView,completionHandler) in
            let defaultText = "Jest checking in at " + self.restaurantNames[indexPath.row]
            let activityController: UIActivityViewController
            //以防圖片載入失敗，用if let確認
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            //如果是iPad,popoverController會存放彈出控制顯示控制器
            //設定位子
            if let popoverController = activityController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            self.present(activityController, animated: true,completion: nil)
            completionHandler(true)
        }
        deleteAction.backgroundColor = UIColor(red:231/255,green:76/255,blue:60/255,alpha:1)
        deleteAction.image = UIImage(named:"delete")
        shareAction.backgroundColor = UIColor(red:254/255,green:149/255,blue:38/255,alpha:1)
        shareAction.image = UIImage(named:"share")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    
    }
    //向右滑動
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkinAction = UIContextualAction(style: .normal, title: "CheckIn"){
            (action,sourceView,completionHandler) in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            if self.restaurantIsVisited[indexPath.row]{
                cell.heartImageView.image = UIImage(named: "heart-tick")
            }else{
                cell.heartImageView.image = nil
            }
            completionHandler(true)
        }
        checkinAction.backgroundColor = UIColor(red:11/255,green:250/255,blue:38/255,alpha:1)
        checkinAction.image = UIImage(named:self.restaurantIsVisited[indexPath.row] ? "undo" : "tick")
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkinAction])
        return swipeConfiguration
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurantImageName = restaurantImages[indexPath.row]
                destinationController.restaurantNameName = restaurantNames[indexPath.row]
                destinationController.restaurantTypeName = restaurantTypes[indexPath.row]
                destinationController.restaurantLocationName = restaurantLocations[indexPath.row]
            }
        }
    }
    

}
