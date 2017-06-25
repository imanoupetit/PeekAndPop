//
//  ViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class FruitMasterViewController: UIViewController {
	
	@IBOutlet var imageViews: [UIImageView]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Register view for 3D Touch (Peek & Pop)
		// You can designate more than one source view for a single registered view controller, but you cannot designate a single view as a source view more than once.
		if traitCollection.forceTouchCapability == .available {
			registerForPreviewing(with: self, sourceView: view)
		}
	}
	
}

extension FruitMasterViewController: UIViewControllerPreviewingDelegate {
	
	// MARK: - UIViewControllerPreviewingDelegate
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		for imageView in imageViews {
			// Convert fruitImageView's frame inside stack view to corresponding frame inside view
			guard let stackView = imageView.superview as? UIStackView else { continue }
			let sourceRect = view.convert(imageView.frame, from: stackView)
			guard sourceRect.contains(location) else { continue }
			
			previewingContext.sourceRect = sourceRect
			
			let controller = storyboard!.instantiateViewController(withIdentifier: "FruitDetailViewController") as! FruitDetailViewController
			controller.image = imageView.image
			// If necessary, you can force the height of the preview view
			//controller.preferredContentSize = CGSize(width: 0.0, height: 200)
			return controller
		}
		return nil
	}
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		navigationController?.pushViewController(viewControllerToCommit, animated: true)
	}
	
}
