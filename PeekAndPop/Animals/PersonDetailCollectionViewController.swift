//
//  PersonDetailCollectionViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class PersonDetailCollectionViewController: UIViewController {
	
	@IBOutlet weak var label: UILabel! {
		didSet {
			label.text = person.name
		}
	}
	
	var person: Person!
	
}
