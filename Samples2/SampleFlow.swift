//
//  SampleFlow.swift
//	Project
//
//  Created by Author on Date.
//  Copyright © 2017 Author. All rights reserved.
//

import UIKit

class SampleFlow {

	// MARK: - Private properties
	
	fileprivate let navigationVC: UINavigationController
	private let servicesFactory: ServicesFactoryProtocol
	private let useCaseFactory: UseCaseFactoryProtocol
	private var appStyle: AppStyleProtocol?
	
	init(navigationVC: UINavigationController,
	     servicesFactory: ServicesFactoryProtocol,
	     useCaseFactory: UseCaseFactoryProtocol,
	     appStyle: AppStyleProtocol?) {
		
		self.navigationVC = navigationVC
		self.servicesFactory = servicesFactory
		self.useCaseFactory = useCaseFactory
		self.appStyle = appStyle
	}

#content
}

#content2
