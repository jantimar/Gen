//
//  main.swift
//  Gen
//
//  Created by Jan Timar on 3.6.17.
//  Copyright © 2017 Jan Timar. All rights reserved.
//

import Foundation

/// Avalibale commands for generate files
enum Command: String {
	case screen = "-sc"
	case screenFlow = "-scf"
	case entity = "-e"
	case useCase = "-u"
	case useCaseFactory = "-uf"
	case service = "-se"
	case serviceFactory = "-sef"
	case author = "-author"
	case samples = "-samples"
	case project = "-project"
	case invalid
}

/// Print helper message and exit app 
func invalidCommannd() {
	print("try one of this gen comnad")
	print("./gen -sc Screen1                              - Generate screen")
	print("./gen -scf Flow1 Screen1 Screen2 Screen3       - Generate flow with screens")
	print("./gen -e Entity1                               - Generate entity")
	print("./gen -u UseCase1                              - Generate use case")
	print("./gen -uf UseCase1 UseCase2 UseCase3 UseCase4  - Generate use case factory and use cases")
	print("./gen -se Service1                             - Generate service")
	print("./gen -sef Service1 Service2 Service3 Service4 - Generate services factory and services")
	
	print("")
	print("./gen -author Author                           - Set classes author")
	print("./gen -samples SampleDirectory                 - Set direcotry to samples")
	print("./gen -project NameOfProject                   - Set project name")
	exit(-1)
}

// Check numbers of arguments
if CommandLine.arguments.count < 3 {
	invalidCommannd()
} else {
	
	let fileService = FileService()
	
	// Read arguments
	let command = Command(rawValue: CommandLine.arguments[1]) ?? .invalid
	let arg1 = CommandLine.arguments[2]
	
	// Execute command
	switch command {
	case .screen: fileService.create(screen: arg1)
	case .screenFlow:
		let screens = Array(CommandLine.arguments[3..<CommandLine.arguments.count])
		fileService.create(flow: CommandLine.arguments[2], with: screens)
	case .entity: fileService.create(entity: arg1)
	case .useCase: fileService.create(useCase: arg1)
	case .useCaseFactory:
		let useCases = Array(CommandLine.arguments[2..<CommandLine.arguments.count])
		fileService.createFactory(useCases: useCases)
	case .service: fileService.create(service: arg1)
	case .serviceFactory:
		let services = Array(CommandLine.arguments[2..<CommandLine.arguments.count])
		fileService.createFactory(services: services)
	case .author: UserDefaults.standard.set(CommandLine.arguments[2], forKey: "author")
	case .samples: UserDefaults.standard.set(CommandLine.arguments[2], forKey: "samples")
	case .project: UserDefaults.standard.set(CommandLine.arguments[2], forKey: "project")
	case .invalid: invalidCommannd()
	}
}
