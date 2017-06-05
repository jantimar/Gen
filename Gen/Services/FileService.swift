//
//  FileService.swift
//  Gen
//
//  Created by Jan Timar on 3.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Cocoa

class FileService: NSObject {
	
	// MARK: - Public properties
	let manager = FileManager.default
	
	// MARK: - Private properties
	
	// TODO: Set your own samples path
	private let samplesPath = (UserDefaults.standard.value(forKey: "samples") as? String) ??  "/Users/jantimar/Samples/"
	private lazy var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "d.M.yy"
		return formatter
	}()
	
	// MARK: - Creation of files
	
	func create(entity: String) {
		let currentPath = manager.currentDirectoryPath
		let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
		let directoryPath = currentPath.appending("/\(project)/Entities")
		// Create directory
		create(directory: directoryPath)
		
		// Create files in directory
		create(entity, at: directoryPath.appending("/\(entity).swift"), from: "Sample")
		create(entity, at: directoryPath.appending("/\(entity)Model.swift"), from: "SampleModel")
	}
	
	// MARK: - Helpers
	
	/// Create file on path and setup file content
	func create(_ name: String, at path: String, from file: String, additionalContent: String? = nil, additionalContent2: String? = nil) {
		do {
			var content = try String(contentsOfFile: "\(samplesPath)\(file).swift")
			content = content.replacingOccurrences(of: "Sample", with: name) // Set name
			content = content.replacingOccurrences(of: "sample", with: name.lowercasedFirstLetter()) // Set name
			content = content.replacingOccurrences(of: "Date", with: dateFormatter.string(from: Date())) // Set date

			// Set author
			let author = (UserDefaults.standard.value(forKey: "author") as? String) ?? ""
			content = content.replacingOccurrences(of: "Author", with: author)

			// Set project
			let project = (UserDefaults.standard.value(forKey: "project") as? String) ?? ""
			content = content.replacingOccurrences(of: "Project", with: project)

			// Set contect
			if let additionalContent2 = additionalContent2 {
				content = content.replacingOccurrences(of: "#content2", with: additionalContent2) // Set additionalContent
			}
			
			if let additionalContent = additionalContent {
				content = content.replacingOccurrences(of: "#content", with: additionalContent) // Set additionalContent
			}
			
			manager.createFile(atPath: path, contents: content.data(using: .utf8), attributes: nil)
		} catch {
			print(error.localizedDescription)
			print("HINT: Probably you forget set \"samplesPath\" you can set it with \"./gen -samples SampleDirectory\"")
			exit(-1)
		}
	}
	
	func create(directory: String) {
		// Create directory
		try? manager.createDirectory(atPath: directory, withIntermediateDirectories: false, attributes: nil)
	}
}
