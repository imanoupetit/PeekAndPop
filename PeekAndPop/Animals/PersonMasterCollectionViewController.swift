//
//  PersonMasterCollectionViewController.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

struct Person {
	let name: String
}

class PersonCell: UICollectionViewCell {
	
	@IBOutlet weak var label: UILabel!
	
}

class PersonMasterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIViewControllerPreviewingDelegate {
	
	let persons = [
		Person(name: "Marie"),
		Person(name: "Bob"),
		Person(name: "Dan"),
		Person(name: "Angela")
	]
	
	let margin: CGFloat = 10
	let cellsPerRow = 2
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let collectionView = collectionView else { return }
		
		collectionView.alwaysBounceVertical = true
		
		if traitCollection.forceTouchCapability == .available {
			registerForPreviewing(with: self, sourceView: collectionView)
		}
		
		guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
		flowLayout.minimumInteritemSpacing = margin
		flowLayout.minimumLineSpacing = margin
		flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
	}
	
    // MARK: - UICollectionViewDataSource
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return persons.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PersonCell
		cell.label.text = persons[indexPath.row].name
        return cell
    }
	
	// MARK: - UICollectionViewDataSource UICollectionViewDelegateFlowLayout
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
		let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
		return CGSize(width: itemWidth, height: itemWidth)
	}
	
	// MARK: - Rotation management
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		collectionView?.collectionViewLayout.invalidateLayout()
		super.viewWillTransition(to: size, with: coordinator)
	}
	
	// MARK: - UIViewControllerPreviewingDelegate
	
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
		guard let collectionView = collectionView,
			let indexPath = collectionView.indexPathForItem(at: location),
			let cell = collectionView.cellForItem(at: indexPath) else {
			return nil
		}
		
		previewingContext.sourceRect = cell.frame
		
		let countyViewController = storyboard!.instantiateViewController(withIdentifier: "PersonDetailCollectionViewController") as! PersonDetailCollectionViewController
		let person = persons[indexPath.row]
		countyViewController.person = person
		
		return countyViewController
	}

	func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		self.show(viewControllerToCommit, sender: self)
	}
	
}



