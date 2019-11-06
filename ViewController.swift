//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Apple on 05/10/19.
//  Copyright © 2019 TechMade. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    
    @NSManaged var username: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //MARK:- Save Data
    func saveData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        user.setValue("Dhaval", forKey: "username")
        user.setValue("dhaval.jasoliya@yopmail.com", forKey: "email")
        user.setValue("123456", forKey: "password")
        
        do
        {
            try managedContext.save()
            
        }
        catch let error as NSError
        {
            print("could not save. \(error), \(error.userInfo)")
        }
    }
    
    //MARK:- Get Data
    func getData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]
            {
                print(data.value(forKey: "username") as! String)
//                lbl.text = data.value(forKey: "username") as! String
            }
        }
        catch
        {
            print("Faild")
        }
    }
    
    //MARK:- Update data
    func updateData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Dhaval")
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("Dhaval Jasoliya", forKey: "username")
            objectUpdate.setValue("dhaval@yopmail.com", forKey: "email")
            objectUpdate.setValue("qwerty", forKey: "password")
            do{
                try managedContext.save()
//                lbl.text = "Data Update Successfully"
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
    }
    
    //MARK:- Delete Data
    func deleteData()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Dhaval Jasoliya")
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do
            {
                try managedContext.save()
                lbl.text = "Data Delete Successfully"
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
    }
}
