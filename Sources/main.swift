import Foundation

let fileManager = FileManager.default
let currentDirectoryURL = fileManager.currentDirectoryPath

enum MapFileName: String, CaseIterable {
	case castle
	case blacksmith
	case mine
	case shop
	case builder
	case hunting_area
	case inventor
	case house
	case stable
	case farm
	case hospital
	case carpenter
	case restaurant
	case potter
}

func mainMap() {
	let (inputFilePath, outputFilePath) = Utils.getMapFilePaths(mapName: "main")

	do {
		let fileContents = try String(contentsOfFile: inputFilePath, encoding: .utf8)
		let map = Utils.mainMapStringToMapTiles(mapString: fileContents)
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		let jsonString = try encoder.encode(map)
		try jsonString.write(to: URL(fileURLWithPath: outputFilePath))
	} catch {
		print(error)
		exit(1)
	}
}

func allBuildingMaps() {
	for mapFileName in MapFileName.allCases {
		let (inputFilePath, outputFilePath) = Utils.getMapFilePaths(mapName: mapFileName.rawValue)

		do {
			let fileContents = try String(contentsOfFile: inputFilePath, encoding: .utf8)
			let map = Utils.typeMapToMap(mapType: mapFileName, mapString: fileContents)
			let encoder = JSONEncoder()
			encoder.outputFormatting = .prettyPrinted
			let jsonString = try encoder.encode(map)
			try jsonString.write(to: URL(fileURLWithPath: outputFilePath))
		} catch {
			print(error)
		}
	}
}

print("")
print("Running")

mainMap()
allBuildingMaps()
