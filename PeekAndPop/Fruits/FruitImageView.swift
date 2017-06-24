//
//  FruitImageView.swift
//  PeekAndPop
//
//  Created by Imanou Petit on 24/06/2017.
//  Copyright © 2017 Imanou Petit. All rights reserved.
//

import UIKit

class FruitImageView: UIImageView {
	
	override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
		guard let superview = superview else { return false }
		
		let point = convert(point, from: superview)
		return bounds.contains(point)
	}
	
}
