//
//  tblViewExtention.swift
//  DemoWeatherData
//
//  Created by softqube on 05/11/19.
//  Copyright © 2019 softqube. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if listData?.list?.count != nil{
            return (listData?.list!.count)!
        }
        else
        {
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let date = cell.viewWithTag(1) as! UILabel
        date.text = (listData?.list![indexPath.row].dt)?.description
        let btnCheck = cell.viewWithTag(2) as? UIButton
        
        if btnCheck != nil{
//            btnCheck!.tag = indexPath.row
            
            btnCheck!.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
            
            
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
//        vc.vcData = listData?.list![indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    @objc func connected(sender: UIButton){
        let buttonPosition = sender.convert(CGPoint(), to:tblView)
        let indexPath = tblView.indexPathForRow(at:buttonPosition)
//        let buttonTag = sender.tag
        print(indexPath?.row)
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        vc.vcData = listData?.list![indexPath!.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
