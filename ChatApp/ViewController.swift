//
//  ViewController.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 05/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return messages.count
        }
        
        return messages2.count
    }
    
    var path = 1
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(indexPath.section == 0){
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! CustomTableViewCell
        
        
        cell.messageText?.text = messages[indexPath.row]
//        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
             cell.messageText.layer.cornerRadius = cell.messageText.frame.width/10
            cell.messageText.clipsToBounds = true

        cell.messageText.textColor = .black
        cell.messageText.backgroundColor = .green
            
            path += 1
            
            return cell
        }
        
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "abcd", for: indexPath) as! Custom2TableViewCell
                
                
                cell.messageLbl2?.text = messages2[indexPath.row]
        //        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
                cell.messageLbl2.textColor = .black
                cell.messageLbl2.backgroundColor = .red

        
        cell.messageLbl2.layer.cornerRadius = cell.messageLbl2.frame.width/10
       cell.messageLbl2.clipsToBounds = true
//
        path -= 1
        return cell
    
    }
    
    var messages2 = [String]()
    var messages = [String]()
    
   var allMessages = [String]()
    

    @IBOutlet weak var tableView3: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
            super.viewDidLoad()
        
        tableView3.delegate = self
        tableView3.dataSource = self
        
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        
        tableView3.register(nib, forCellReuseIdentifier: "abc")
        
        let nib2 = UINib(nibName: "Custom2TableViewCell", bundle: nil)
               
               tableView3.register(nib2, forCellReuseIdentifier: "abcd")
               
        
       
        }

    var value = 1
    
    var viewSection = 0
    @IBAction func sendAction(_ sender: Any) {
        
        if(value == 1){
        
        
         messages.append(textField.text!)
         tableView3.reloadData()
//        updateLastRow()
            
            if (viewSection == 0){
            
         scrollToBottom()
                viewSection += 1
            }else
            {
            scrollToBottom1()
                
            }
            
            
          print(messages)
        self.tableView3.contentInset = UIEdgeInsets(top: tableView3.frame.height,left: 0,bottom: 0,right: 0)
            let indexPath = IndexPath(item: messages.count, section: 0)
            
            value += 1
        }
        
        
        else if (value == 2){
           
             messages2.append(textField.text!)
            tableView3.reloadData()
            //        updateLastRow()
                    scrollToBottom1()
                      print(messages2)
                    self.tableView3.contentInset = UIEdgeInsets(top: tableView3.frame.height,left: 0,bottom: 0,right: 0)
            var valu2 = 1
            if(valu2 == 1){
                let indexPath = IndexPath(item: messages2.count, section: 1)
                        valu2 += 1
                        value -= 1
            
        }
    
        textField.text = ""
        
    }
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.tableView3.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    func scrollToBottom1(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages2.count-1,section:1)
            self.tableView3.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
        
        func scrollToBottom2(){
            DispatchQueue.main.async {
                let indexPath = IndexPath(row: self.messages.count-1,section:0)
                self.tableView3.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }

        
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    func allmesg(){
        
        
        
        for i in messages{
            allMessages.append(i)
            
        }
        
        
        
        for i in messages2{
            allMessages.append(i)
            
        }

        
    }
    
        
}

