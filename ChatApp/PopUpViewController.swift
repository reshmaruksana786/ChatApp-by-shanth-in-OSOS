//
//  PopUpViewController.swift
//  ChatApp
//
//  Created by Vidushi Duhan on 06/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit
import MobileCoreServices

class PopUpViewController:UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIDocumentPickerDelegate

{
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
//         documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
   
    
//    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
//
//        print("dfgh")
//
//    }
//
    
    
    var delegate1:UIDocumentPickerViewController!
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
                  let myURL = url as URL
                  print("import result : \(myURL)")
        }


//    func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
//            documentPicker.delegate = self
//            present(documentPicker, animated: true, completion: nil)
//        }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                print("view was cancelled")
                dismiss(animated: true, completion: nil)
        }
    
    
  
var imagePicke = UIImagePickerController()
    
    
    var reference1:ViewController!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var efftectView: UIVisualEffectView!
    
//    var delegate1:UIDocumentMenuDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.layer.cornerRadius = contentView.frame.width/8
        contentView.clipsToBounds = true
        
        efftectView.layer.cornerRadius = efftectView.frame.width/8
               efftectView.clipsToBounds = true
               
        // Do any additional setup after loading the view.
    }
    
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//                         guard let myURL = urls.first else {
//                              return
//                         }
//                         print("import result : \(myURL)")
//               }
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
//                  print("url = \(url)")
////                   present(controller, animated: true, completion: nil)
//              }
           
        
    private func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                  guard let myURL = urls.first else {
                       return
                  }
                  print("import result : \(myURL)")
        }



//    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
//                print("view was cancelled")
//                dismiss(animated: true, completion: nil)
//        }
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    func clickFunction(){

        
        let docMenu = UIDocumentMenuViewController(documentTypes: [], in: .import)
        docMenu.addOption(withTitle: "Create New Document", image: nil, order: .first, handler: { print("New Doc Requested") })
        docMenu.delegate = self as? UIDocumentMenuDelegate
        docMenu.popoverPresentationController?.sourceView
        self.present(docMenu, animated: true, completion: nil)
        
        
        
    }
    
    
    
    

    @IBAction func docsAction(_ sender: Any) {
        
        print("documents")
        
                
           clickFunction()
        
//        func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
//            
//            present(documentPicker, animated: true, completion: nil)
//        }
       
    }
    
    
    @IBAction func cameraAction(_ sender: Any) {
        
        
    }
    
    
    @IBAction func galleryAction(_ sender: Any) {
        
if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){

         imagePicke.delegate = self
         imagePicke.sourceType = .savedPhotosAlbum
         imagePicke.allowsEditing = true


        present(imagePicke, animated: true, completion: nil)
        
    }
    }
    
    
    
    @IBAction func audioAction(_ sender: Any) {
        
       clickFunction()
        
        
        
    }
    
    @IBAction func navigationAction(_ sender: Any) {
        
        let target = storyboard?.instantiateViewController(identifier: "789") as! MapViewController
        
     present(target, animated: true, completion: nil)
        
        navigationController?.pushViewController(target, animated: true)

    }
    
    @IBAction func contactAction(_ sender: Any) {
       
//       dismiss(animated: true, completion: nil)
        
        let target = storyboard?.instantiateViewController(identifier: "contactView") as! ContactsViewController
        
        
        present(target, animated: true, completion: nil)
        
        DBManager.shared.Diffrentiate.append("C")
       
        print(DBManager.shared.Diffrentiate)
        target.viEW1Refernce = reference1
     
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {         DBManager.shared.images = [UIImage]()
        if  let pickedImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage{

//            buttonImage2.setImage(pickedImage, for: UIControl.State.normal)

          DBManager.shared.images.append(pickedImage)

        }

        dismiss(animated: true, completion: nil)

    }

   
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          let touch = touches.first
          
//            dismiss(animated: true, completion: nil)
         
     }
    

}
