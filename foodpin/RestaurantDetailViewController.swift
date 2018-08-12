//
//  RestaurantDetailViewController.swift
//  foodpin
//
//  Created by viplab on 2018/8/7.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantLocation.text = restaurant.location
        restaurantType.text = restaurant.type
        restaurantName.text = restaurant.name
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantLocation: UILabel!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantType: UILabel!
    var restaurant:Restaurant = Restaurant()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
    

}
