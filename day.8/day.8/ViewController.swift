//
//  ViewController.swift
//  day.8
//
//  Created by rawan  on 9/7/23.
//  Copyright © 2023 rawan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonGet(_ sender: Any) {
        
        let mytableview : MyTableViewController = storyboard?.instantiateViewController(withIdentifier: "mytableview") as! MyTableViewController
        
        navigationController?.pushViewController(mytableview, animated: true)
        
        
         let url : URL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        
        let request : URLRequest = URLRequest(url: url)
        
        let session : URLSession = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
        do{
        
            let jsonObject : Dictionary<String , Any> = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String , Any>
            
            
            let employeesArray : Array<Dictionary<String , Any>> = jsonObject["data"] as! Array<Dictionary<String , Any>>
            
            
            for employee in employeesArray{
                
                let name : String = employee["employee_name"] as! String
                
                mytableview.employeesNameArray.append(name)
                
            }
            
            DispatchQueue.main.async {
                
                mytableview.tableView.reloadData()
                
            }
        }
        catch let error{
            
            print(error.localizedDescription)
        }
        
        
    }
    
    task.resume()
        
    }

}
