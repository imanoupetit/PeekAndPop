//
//  CarDetailViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {
	
	@IBOutlet weak var brandLabel: UILabel!
	@IBOutlet weak var modelLabel: UILabel!
	
	var car: Car!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Car"
		
		brandLabel.text = car.brand
		modelLabel.text = car.model
	}
	
}
