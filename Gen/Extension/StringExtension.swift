//
//  SwiftExtension.swift
//  Gen
//
//  Created by Jan Timar on 4.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Foundation

extension String {
	
	func lowercasedFirstLetter() -> String {
		let first = String(characters.prefix(1)).lowercased()
		let other = String(characters.dropFirst())
		return first + other
	}

}
