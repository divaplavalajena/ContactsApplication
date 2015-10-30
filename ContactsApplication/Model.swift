//
//  Model.swift
//  ContactsApplication
//
//  Created by Jena Grafton on 10/30/15.
//  Copyright © 2015 Bella Voce Productions. All rights reserved.
//

import UIKit
import CoreData

class Model: NSManagedObject {
    
    @NSManaged var contactname: String
    
    @NSManaged var contactnumber: String

}
