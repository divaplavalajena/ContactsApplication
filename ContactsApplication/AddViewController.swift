//
//  AddViewController.swift
//  ContactsApplication
//
//  Created by Jena Grafton on 10/28/15.
//  Copyright © 2015 Bella Voce Productions. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var numberTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        //reference theEnt or the entity - create a new item and add it to the database
        let newItem = Model(entity: theEnt!, insertIntoManagedObjectContext: theContext)
        
        //add text to the new Items in the database based on attribute
        newItem.contactname = nameTextField.text!
        newItem.contactnumber = numberTextField.text!
        
        //save it to the database
        do {
            try theContext.save()
        } catch _ {
            
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    @IBAction func Call(sender: AnyObject) {
    }
    
    @IBAction func SMS(sender: AnyObject) {
    }
    
    

}






