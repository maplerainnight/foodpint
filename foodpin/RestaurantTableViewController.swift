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

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
    ]
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // 設定cell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named:restaurants[indexPath.row].image)
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        //避免cell顯示上一次的結果
        if restaurants[indexPath.row].isVisited{
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
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            //呼叫完成處理器來取消動作按鈕
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title:"Share"){
            (action,sourceView,completionHandler) in
            let defaultText = "Jest checking in at " + self.restaurants[indexPath.row].name
            let activityController: UIActivityViewController
            //以防圖片載入失敗，用if let確認
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].name){
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
            
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            if self.restaurants[indexPath.row].isVisited{
                cell.heartImageView.image = UIImage(named: "heart-tick")
            }else{
                cell.heartImageView.image = nil
            }
            completionHandler(true)
        }
        checkinAction.backgroundColor = UIColor(red:11/255,green:250/255,blue:38/255,alpha:1)
        checkinAction.image = UIImage(named:self.restaurants[indexPath.row].isVisited ? "undo" : "tick")
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
