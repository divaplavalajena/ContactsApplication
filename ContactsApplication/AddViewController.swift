//
//  AddViewController.swift
//  ContactsApplication
//
//  Created by Jena Grafton on 10/28/15.
//  Copyright © 2015 Bella Voce Productions. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class AddViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var numberTextField: UITextField!
    
    var contactName: String = ""
    var contactNumber: String = ""
    
    var ExistingItem: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (ExistingItem != nil) {
            
            nameTextField.text = contactName
            numberTextField.text = contactNumber
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func Save(sender: AnyObject) {
        
        //get up the appDel to save it as overall of application before we get the data that then is saved to the SocialList
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //create context for the NSManagedObject and assign it to the AppDelegate
        let theContext: NSManagedObjectContext = appDel.managedObjectContext
        
        //create entity to access SocialList to save data to the two attributes
        let theEnt = NSEntityDescription.entityForName("SocialList", inManagedObjectContext: theContext)
        
        if (ExistingItem != nil){
            
            ExistingItem.setValue(nameTextField.text as String?, forKey: "contactname")
            ExistingItem.setValue(numberTextField.text as String?, forKey: "contactnumber")

            
        }else {
            
            //reference theEnt or the entity - create a new item and add it to the database
            let newItem = Model(entity: theEnt!, insertIntoManagedObjectContext: theContext)
            
            //add text to the new Items in the database based on attribute
            newItem.contactname = nameTextField.text!
            newItem.contactnumber = numberTextField.text!
            
        }
        
        
        
        //save it to the database
        do {
            try theContext.save()
        } catch _ {
            
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    @IBAction func Call(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(numberTextField.text!)")!)
        
        
        
    }
    
    @IBAction func SMS(sender: AnyObject) {
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.recipients = ["\(numberTextField.text!)"]
        messageVC.body = "Hello " + nameTextField.text!
        
        messageVC.messageComposeDelegate = self
        
        self.presentViewController(messageVC, animated: true, completion: nil)
        
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        switch (result.rawValue) {
            
        case MessageComposeResultCancelled.rawValue:
            print("Cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        case MessageComposeResultFailed.rawValue:
            print("Failed")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        case MessageComposeResultSent.rawValue:
            print("Sent")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        default:
            break
            
        }
        
        
        
    }
    

}






