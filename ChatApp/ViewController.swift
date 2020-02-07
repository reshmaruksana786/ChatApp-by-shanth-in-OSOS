//
//  ViewController.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 05/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {
    
 
          
    @IBOutlet weak var contentView: UIView!
    
          
    
    @IBOutlet weak var textView1: UITextView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.shared.allMessages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            
        
        return CGFloat(70)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        acition()
      textView1.isUserInteractionEnabled = true

//        UIKeyboardAppearance.alert
        
//        textView1.becomeFirstResponder()
        return true
    }
    @objc func keyBoardinteraction(notification:Notification){
        
        textView1.isUserInteractionEnabled = true
    }
    
    
    
    func acition(){
        UIView.animate(withDuration: 0.5) {
           self.contentView.transform = CGAffineTransform(translationX: 0, y: -280)
               }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(DBManager.shared.Diffrentiate[indexPath.row] == "S"){

        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath) as! CustomTableViewCell
        
        
        cell.messageText?.text = DBManager.shared.allMessages[indexPath.row]
//        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.messageText.numberOfLines = 0
             cell.messageText.layer.cornerRadius = cell.messageText.frame.width/22
            cell.messageText.clipsToBounds = true
            cell.backgroundColor = .clear
//            cell.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
        cell.messageText.textColor = .black
        cell.messageText.backgroundColor = .systemGray2
    
            print("sender")
            return cell
        }
         if (DBManager.shared.Diffrentiate[indexPath.row] == "C"){
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactsTableViewCell
                   
           cell.contactLbl.text = DBManager.shared.allMessages[indexPath.row]
           cell.contactLbl.numberOfLines = 0
           cell.backgroundColor = .clear
           //        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
                   cell.contactLbl.textColor = .black
                   cell.contactLbl.backgroundColor = .systemGray2
//          cell.heightAnchor.constraint(equalToConstant: 60).isActive = true
//           cell.contactLbl.layer.cornerRadius = cell.contactLbl.frame.width/22
//           cell.contactLbl.clipsToBounds = true
            
            print("contacts")

//                    self.tableView3.contentInset = UIEdgeInsets(top: tableView3.frame.height,left: 0,bottom: 0,right: 0)
//                        let indexPath = IndexPath(item: DBManager.shared.Diffrentiate.count, section: 0)
//
//
            scrollToBottom()
            
           return cell
        }
    

    let cell = tableView.dequeueReusableCell(withIdentifier: "abcd", for: indexPath) as! Custom2TableViewCell
            
                 cell.messageLbl2?.text = DBManager.shared.allMessages[indexPath.row]
                  cell.messageLbl2.numberOfLines = 0
                 cell.backgroundColor = .clear
         //        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
                 cell.messageLbl2.textColor = .black
                 cell.messageLbl2.backgroundColor = .systemTeal
//             cell.heightAnchor.constraint(equalToConstant: 60).isActive = true
         
//         cell.messageLbl2.layer.cornerRadius = cell.messageLbl2.frame.width/22
//         cell.messageLbl2.clipsToBounds = true

         return cell
    }
    
  
   func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//       if (textView == textView1)
//       {
//
//
//           if (text == "\n")
//           {
//               textView.text = textView.text + "\n"
//               //textView.resignFirstResponder()
//
//            }
//
//        }
   return true
   }
  

    @IBAction func addMedia(_ sender: Any) {
      
       
        let target = storyboard?.instantiateViewController(identifier: "abc") as! PopUpViewController
        
         let target1 = storyboard?.instantiateViewController(identifier: "contactView") as! ContactsViewController
        
        target1.viEW1Refernce = self
//
        present(target, animated: true, completion: nil)
        
//        navigationController?.pushViewController(target, animated: true)
       
    }
    
    @objc func loadList(notification: NSNotification){
      //load data here
      //scrollToBottom()
        self.tableView3.reloadData()
        func scrollToBottom(){
            DispatchQueue.main.async {
                let indexPath = IndexPath(row: DBManager.shared.allMessages.count-1, section: 0)
               self.tableView3.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
        }

//        self.tableView3.contentInset = UIEdgeInsets(top: tableView3.frame.height,left: 0,bottom: 0,right: 0)
//                   let indexPath = IndexPath(item: DBManager.shared.Diffrentiate.count, section: 0)
        
        
  }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        var touch: UITouch?
//         touch = touches.first
//
//            delegate1.view.isHidden = true
//
//    }
    
    
//    present(UIViewController(), animated: true, completion: nil)

    
//        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//        dismiss(animated: true, completion: nil)
//    }


    @IBOutlet weak var tableView3: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        tableView3.delegate = self
        tableView3.dataSource = self
        textView1.textColor = .black
        
//        contentView.layer.cornerRadius = 14
//        contentView.clipsToBounds = true
        
//        textView1.layer.cornerRadius = 8
//        textView1.clipsToBounds = true
       
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardinteraction(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
        tableView3.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView3.reloadData()
    
//        textView1.layer.cornerRadius = textView1.frame.width/16
//        textView1.clipsToBounds = true
        textView1.delegate = self
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        
        tableView3.register(nib, forCellReuseIdentifier: "abc")
        
        let nib2 = UINib(nibName: "Custom2TableViewCell", bundle: nil)
               
               tableView3.register(nib2, forCellReuseIdentifier: "abcd")
       
        let nib3 = UINib(nibName: "ContactsTableViewCell", bundle: nil)
               
               tableView3.register(nib3, forCellReuseIdentifier: "contact")

        
       
        }

    var value = 1
    
    var viewSection = 0
    
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: DBManager.shared.allMessages.count-1, section: 0)
            self.tableView3.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    
    
    
    @IBAction func sendAction(_ sender: Any) {
        
        
        if(value == 1){
         DBManager.shared.allMessages.append(textView1.text!)
            DBManager.shared.Diffrentiate.append("S")
         tableView3.reloadData()
//        updateLastRow()
            
            
            
//       scrollToBottom()


            value += 1
        
            textView1.text = ""
        }
        
        else if (value == 2){
           
             DBManager.shared.allMessages.append(textView1.text!)
                DBManager.shared.Diffrentiate.append("R")
            tableView3.reloadData()
//             /       updateLastRow()
//                    scrollToBottom()
//                    self.tableView3.contentInset = UIEdgeInsets(top: tableView3.frame.height,left: 0,bottom: 0,right: 0)
////
////
//                let indexPath = IndexPath(item: DBManager.shared.Diffrentiate.count, section: 1)
                        
                        value -= 1
            
        }
//
        scrollToBottom()
        textView1.text = ""
         print(DBManager.shared.Diffrentiate)
    }
    
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
   
   
        
}

