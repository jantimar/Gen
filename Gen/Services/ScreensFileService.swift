//
//  ScreensFileService.swift
//  Gen
//
//  Created by Jan Timar on 5.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Foundation

/// Screens
extension FileService {
	
	func create(flow: String, with screens: [String]) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Flows")
		
		// Create directory
		create(directory: directoryPath)
		
		
		// Create files in directory
		var content: String = ""
		var content2: String = ""
		
		for screen in screens {
			
			content.append("\tprivate func create\(screen)VC() -> \(screen)VC {\n")
			content.append("\t\tlet screen = \(screen)VC()\n")
			content.append("\t\tlet presenter = \(screen)Presenter()\n")
			content.append("\t\tpresenter.delegate = self\n")
			content.append("\t\tscreen.presenter = \(screen)Presenter()\n")
			content.append("\t\treturn screen\n")
			content.append("\t}\n\n")
			
			content2.append("extension \(flow)Flow: \(screen)PresenterProtocol {\n")
			content2.append("\t// TODO: Implement\n")
			content2.append("}\n\n")
			
			create(screen: screen)
		}
		
		
		create(flow, at: directoryPath.appending("/\(flow)Flow.swift"),
		       from: "SampleFlow",
		       additionalContent: content,
		       additionalContent2: content2)
	}
	
	/// Create "screen"Screen directory with Presenter, PresenterProcotol and VC files
	func create(screen: String) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Modules/\(screen)Screen")
		
		// Create directory
		create(directory: currentPath.appending("/\(project)/Modules"))
		create(directory: directoryPath)
		
		// Create files in directory
		create(screen, at: directoryPath.appending("/\(screen)Presenter.swift"), from: "SamplePresenter")
		create(screen, at: directoryPath.appending("/\(screen)PresenterProtocol.swift"), from: "SamplePresenterProtocol")
		create(screen, at: directoryPath.appending("/\(screen)VC.swift"), from: "SampleVC")
	}
}
