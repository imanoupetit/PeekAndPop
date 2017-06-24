//
//  ViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class FruitMasterViewController: UIViewController {
	
	@IBOutlet var fruitImageViews: [FruitImageView]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Register view for 3D Touch (Peek & Pop)
		if traitCollection.forceTouchCapability == .available {
			registerForPreviewing(with: self, sourceView: view)
		}
	}
	
}

extension FruitMasterViewController: UIViewControllerPreviewingDelegate {
	
	// MARK: - UIViewControllerPreviewingDelegate
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		for fruitImageView in fruitImageViews where fruitImageView.point(inside: location, with: nil) {
			let controller = storyboard?.instantiateViewController(withIdentifier: "FruitDetailViewController") as! FruitDetailViewController
			controller.image = fruitImageView.image
			return controller
		}
		return nil
	}
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		navigationController?.pushViewController(viewControllerToCommit, animated: true)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print("bob:", type(of: sender))
	}
	
}
