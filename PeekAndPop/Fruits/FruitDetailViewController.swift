//
//  FruitDetailViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class FruitDetailViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	var image: UIImage!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Fruit"
		imageView.image = image
    }

}
