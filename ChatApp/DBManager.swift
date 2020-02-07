//
//  DBManager.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 06/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import Foundation
import UIKit


class DBManager:NSObject{
    static var shared = DBManager()
    
    var names = [String]()
    var number = [String]()
    var mobileNumber:Int!
     var allMessages = [String]()
    var Diffrentiate = [String]()
    var email = [UInt64]()
    var images = [UIImage]()
    
    var view:ViewController!
     var name1 = ""
     var number1 = ""
    
    var selectedName = ""
    var selecetedNo = ""
}
