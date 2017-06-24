//
//  CarTableViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

struct Car {
	let brand: String
	let model: String
}

class CarTableViewController: UITableViewController {
	
	let cars = [
		Car(brand: "Ford", model: "Mustang"),
		Car(brand: "Citroen", model: "BX"),
		Car(brand: "Mazda", model: "626")
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 3D Touch (Peek & Pop)
		if traitCollection.forceTouchCapability == .available {
			registerForPreviewing(with: self, sourceView: tableView)
		}
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cars.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		cell.textLabel?.text = cars[indexPath.row].brand
		cell.detailTextLabel?.text = cars[indexPath.row].model
		
		return cell
	}
	
}

extension CarTableViewController: UIViewControllerPreviewingDelegate {
	
	// MARK: - UIViewControllerPreviewingDelegate
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
		
		let cellRect = tableView.rectForRow(at: indexPath)
		let sourceRect = previewingContext.sourceView.convert(cellRect, from: tableView)
		previewingContext.sourceRect = sourceRect
		
		let carDetailViewController = storyboard?.instantiateViewController(withIdentifier: "CarDetailViewController") as! CarDetailViewController
		carDetailViewController.car = cars[indexPath.row]
		return carDetailViewController
	}
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		self.show(viewControllerToCommit, sender: self)
		//navigationController?.pushViewController(viewControllerToCommit, animated: true) // also works
		//navigationController?.show(viewControllerToCommit, sender: self) // also works
	}
	
}
