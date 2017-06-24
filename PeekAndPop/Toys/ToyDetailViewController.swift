//
//  CarDetailViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class ToyDetailViewController: UIViewController {
	
	@IBOutlet weak var toyLabel: UILabel!
	
	var toy: Toy?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		toyLabel.text = toy?.name
	}
	
}
