//
//  ContactsViewController.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 06/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    

    
    var viEW1Refernce:ViewController!
    
    @IBOutlet weak var tableView3: UITableView!
     
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
            let contactToDspaly = contacts[indexPath.row]
            cell.textLabel?.text = contactToDspaly.name
            cell.detailTextLabel?.text = contactToDspaly.number
            cell.backgroundColor = .clear
            
            
            return cell
        }
        
         let contactStore = CNContactStore()
         var contacts = [ContactStruct]()
        var wholeData = [String:Any]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView3.delegate = self
            tableView3.dataSource = self
            tableView3.backgroundColor = .clear
            
            contactStore.requestAccess(for: .contacts) { (success, error) in
            print("authorization successful")
                
                self.fetchContacts()
                
            // Do any additional setup after loading the view.
        }
         
        }
        
        
        
        func fetchContacts(){
            
            
            
            let key = [CNContactGivenNameKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let request = CNContactFetchRequest(keysToFetch: key)
            
            try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
                let name = contact.givenName
                let number = contact.phoneNumbers.first?.value.stringValue
                let contactToAppend = ContactStruct(name: name, number: number!)
                self.contacts.append(contactToAppend)
                
                DBManager.shared.names.append(name)
                DBManager.shared.number.append(number!)
                
            }
            
            DispatchQueue.main.async {
                self.tableView3.reloadData()
            }
            
            
        }

        var mobile:Int!
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        dataReq(id: "5e26ea82dcef130017295cd9")
           
            NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
            
           UIKeyboardAppearance.alert
            DBManager.shared.selectedName = DBManager.shared.names[indexPath.row]
            DBManager.shared.selecetedNo = DBManager.shared.number[indexPath.row]
            
            var value1 = "()-"
            let removeslashes = DBManager.shared.selecetedNo.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)

            let removeslashes2 = removeslashes.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
           let value2 = removeslashes2.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
            let value3 = value2.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
    //       print("@@@@@@\(value3)")
            
            DBManager.shared.mobileNumber = Int(value3)
            
    //        print(DBManager.shared.mobileNumber)
       
            DBManager.shared.allMessages.append(DBManager.shared.selectedName + "\n" + DBManager.shared.selecetedNo)
            
            print(DBManager.shared.allMessages)
            
         NotificationCenter.default.post(name: Notification.Name("load"), object: nil)

            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            
//            dismiss(animated: true, completion: nil)
    
//        performSegue(withIdentifier: "123", sender: nil)
            
         
//            let target = storyboard?.instantiateViewController(identifier: "abc") as! ViewController
//
//            present(target, animated: true, completion: nil)
            

            }

        
}

