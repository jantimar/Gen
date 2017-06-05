//
//  ServicesFileService.swift
//  Gen
//
//  Created by Jan Timar on 5.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Foundation

// Services
extension FileService {
	
	func createFactory(services: [String]) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Services")
		
		// Create directory
		create(directory: directoryPath)
		
		// Create files in directory
		var protocolContent: String = ""
		var content: String = ""
		
		for service in services {
			// Create use case
			create(service: service)
			// Content
			content.append("\tfunc \(service.lowercasedFirstLetter())() -> \(service)Protocol {\n")
			content.append("\t\treturn \(service)()\n")
			content.append("\t}\n\n")
			// Protocol content
			protocolContent.append("\t///\n")
			protocolContent.append("\tfunc \(service.lowercasedFirstLetter())() -> \(service)Protocol\n")
		}
		
		create("", at: directoryPath.appending("/ServicesFactory.swift"), from: "ServicesFactory", additionalContent: content)
		create("", at: directoryPath.appending("/ServicesFactoryProtocol.swift"), from: "ServicesFactoryProtocol", additionalContent: protocolContent)
	}
	
	func create(service: String) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Services/\(service)")
		
		// Create directory
		create(directory: currentPath.appending("/\(project)/Services"))
		create(directory: directoryPath)
		
		// Create files in directory
		create(service, at: directoryPath.appending("/\(service).swift"), from: "SampleService")
		create(service, at: directoryPath.appending("/\(service)Protocol.swift"), from: "SampleServiceProtocol")
	}
}
