//
//  DetailsViewController.swift
//  DemoWeatherData
//
//  Created by softqube on 05/11/19.
//  Copyright © 2019 softqube. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblTwo: UILabel!
    @IBOutlet weak var lblOne: UILabel!
    
    var vcData: List!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        lblTwo.text = (vcData.dt)?.description
        lblOne.text = vcData.dt_txt

        // Do any additional setup after loading the view.
    }
    

}
