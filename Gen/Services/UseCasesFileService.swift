//
//  UseCasesFileService.swift
//  Gen
//
//  Created by Jan Timar on 5.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Foundation

// Use cases
extension FileService {
	
	func createFactory(useCases: [String]) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Modules/UseCase")
		
		// Create directory
		create(directory: currentPath.appending("/\(project)/Modules"))
		create(directory: directoryPath)
		
		// Create files in directory
		var protocolContent: String = ""
		var content: String = ""
		
		for useCase in useCases {
			// Create use case
			create(useCase: useCase)
			// Content
			content.append("\tfunc \(useCase.lowercasedFirstLetter())() -> \(useCase)UseCaseProtocol {\n")
			content.append("\t\treturn \(useCase)UseCase()\n")
			content.append("\t}\n\n")
			// Protocol content
			protocolContent.append("\t///\n")
			protocolContent.append("\tfunc \(useCase.lowercasedFirstLetter())() -> \(useCase)UseCaseProtocol\n")
		}
		
		create("", at: directoryPath.appending("/UseCaseFactory.swift"), from: "UseCaseFactory", additionalContent: content)
		create("", at: directoryPath.appending("/UseCaseFactoryProtocol.swift"), from: "UseCaseFactoryProtocol", additionalContent: protocolContent)
	}
	
	func create(useCase: String) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Modules/UseCase/\(useCase)UseCase")
		
		// Create directory
		create(directory: currentPath.appending("/\(project)/Modules"))
		create(directory: currentPath.appending("/\(project)/Modules/UseCase"))
		create(directory: directoryPath)
		
		// Create files in directory
		create(useCase, at: directoryPath.appending("/\(useCase)UseCase.swift"), from: "SampleUseCase")
		create(useCase, at: directoryPath.appending("/\(useCase)UseCaseProtocol.swift"), from: "SampleUseCaseProtocol")
	}
}
