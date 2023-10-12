//
//  MyTableViewController.swift
//  day.8
//
//  Created by rawan  on 9/7/23.
//  Copyright © 2023 rawan . All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var employeesNameArray : [String] = [String]()

        
        override func viewDidLoad () {
            super.viewDidLoad()

           
        }
        
        // MARK: - Table view data source

       override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return employeesNameArray.count
       }

       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           return 80
           
       }
       
       override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           
           return "Names"
       }
       
       override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
           
           return "Names Footer"
       }
        
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            // Configure the cell...

            cell.textLabel?.text = employeesNameArray[indexPath.row]
            cell.detailTextLabel?.text = "API"
            cell.accessoryType = .disclosureIndicator

            return cell
        }
        

        
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                employeesNameArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        
        }
        
        
        

        
    }
