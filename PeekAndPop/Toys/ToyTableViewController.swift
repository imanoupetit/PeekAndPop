//
//  CarTableViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

struct Toy {
	let name: String
}

class ToyTableViewController: UITableViewController {
	
	let toys = [
		Toy(name: "Ball"),
		Toy(name: "Bike"),
		Toy(name: "Doll")
	]
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return toys.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		cell.textLabel?.text = toys[indexPath.row].name
		
		return cell
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let cell = sender as? UITableViewCell,
			let indexPath = tableView.indexPath(for: cell),
			let toyDetailViewController = segue.destination as? ToyDetailViewController
			else { return }
		
		toyDetailViewController.toy = toys[indexPath.row]
	}
	
}
