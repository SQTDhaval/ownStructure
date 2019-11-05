//
//  ViewController.swift
//  DemoWeatherData
//
//  Created by softqube on 04/11/19.
//  Copyright © 2019 softqube. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var listData : weatherData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        
        // Do any additional setup after loading the view.
    }
    
    func callAPI()
    {
        Alamofire.request(baseURL, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(let json):
                    print(json)
                    DispatchQueue.main.async {
                        
                        let jsonDecode = JSONDecoder()
                        
                        do{
                            let user = try jsonDecode.decode(weatherData.self, from: response.data!)
                            self.listData = weatherData(cod: user.cod, message: user.message, cnt: user.cnt, list: user.list)
                            
                            DispatchQueue.main.async {
                                self.tblView.reloadData()
                            }
                        }
                        catch
                        {
                            print(error.localizedDescription)
                        }
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
}





