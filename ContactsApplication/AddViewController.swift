//
//  AddViewController.swift
//  ContactsApplication
//
//  Created by Jena Grafton on 10/28/15.
//  Copyright © 2015 Bella Voce Productions. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func Call(sender: AnyObject) {
    }
    
    @IBAction func SMS(sender: AnyObject) {
    }
    
    

}
