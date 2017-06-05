//
//  SamplePresenterProtocol.swift
//	Project
//
//  Created by Author on Date.
//  Copyright © 2017 Author. All rights reserved.
//

import UIKit

protocol SamplePresenterDelegate: class {
	
	// TODO: Implement
}

protocol SamplePresenterProtocol {
	
	weak var delegate: SamplePresenterDelegate? { get set }

}
