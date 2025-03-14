import Foundation

enum Utils {
	// MARK: Main Map to Map

	static func mainMapStringToMapTiles(mapString: String) -> [[MapTile]] {
		mapString.split(separator: "\n").map { line in
			line.map { char in
				switch char {
					case ".":
						MapTile(type: .biomeTOBEGENERATED(type: .plains), isWalkable: true)
					case " ":
						MapTile(type: .plain, isWalkable: true)
					case "P":
						MapTile(type: .path, isWalkable: true)
					case "#":
						MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
					case "1":
						MapTile(type: .door(tile: DoorTile(type: .blacksmith)), isWalkable: true, event: .openDoor)
					case "2":
						MapTile(type: .door(tile: DoorTile(type: .stable)), isWalkable: true, event: .openDoor)
					case "!":
						MapTile(type: .door(tile: DoorTile(type: .castle(side: .top))), isWalkable: true, event: .openDoor)
					case "^":
						MapTile(type: .door(tile: DoorTile(type: .castle(side: .left))), isWalkable: true, event: .openDoor)
					case "$":
						MapTile(type: .door(tile: DoorTile(type: .castle(side: .right))), isWalkable: true, event: .openDoor)
					case "%":
						MapTile(type: .door(tile: DoorTile(type: .castle(side: .bottom))), isWalkable: true, event: .openDoor)
					case "4":
						MapTile(type: .door(tile: DoorTile(type: .farm(type: .main))), isWalkable: true, event: .openDoor)
					case "5":
						MapTile(type: .door(tile: DoorTile(type: .inventor)), isWalkable: true, event: .openDoor)
					case "6":
						MapTile(type: .door(tile: DoorTile(type: .shop)), isWalkable: true, event: .openDoor)
					case "7":
						MapTile(type: .door(tile: DoorTile(type: .mine)), isWalkable: true, event: .openDoor)
					case "8":
						MapTile(type: .door(tile: DoorTile(type: .hunting_area)), isWalkable: true, event: .openDoor)
					case "9":
						MapTile(type: .door(tile: DoorTile(type: .hospital(side: .top))), isWalkable: true, event: .openDoor)
					case ")":
						MapTile(type: .door(tile: DoorTile(type: .hospital(side: .bottom))), isWalkable: true, event: .openDoor)
					case "*":
						MapTile(type: .door(tile: DoorTile(type: .builder)), isWalkable: true, event: .openDoor)
					case "d":
						MapTile(type: .door(tile: DoorTile(type: .carpenter)), isWalkable: true, event: .openDoor)
					case "p":
						MapTile(type: .door(tile: DoorTile(type: .potter)), isWalkable: true, event: .openDoor)
					case "0":
						MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
					case "W":
						MapTile(type: .water, isWalkable: false)
					case "@":
						MapTile(type: .playerStart, isWalkable: true)
					case "f":
						MapTile(type: .fence(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
					case "F":
						MapTile(type: .gate(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
					case "c":
						MapTile(type: .pot(tile: .init(cropTile: .init(type: .carrot))), isWalkable: true, event: .collectCrop)
					case "(":
						MapTile(type: .door(tile: .init(type: .farm(type: .farm_area))), isWalkable: true, event: .openDoor)
					default:
						MapTile(type: .plain, isWalkable: true)
				}
			}
		}
	}

	static func typeMapToMap(mapType: MapFileName, mapString: String) -> [[MapTile]] {
		mapString.split(separator: "\n").map { line in
			line.map { char in
				if char == "#" {
					return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
				}
				// TODO: can this be better?
				switch mapType {
					case .castle:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "1":
								return MapTile(type: .door(tile: .init(type: .castle(side: .top))), isWalkable: true, event: .openDoor)
							case "2":
								return MapTile(type: .door(tile: .init(type: .castle(side: .right))), isWalkable: true, event: .openDoor)
							case "3":
								return MapTile(type: .door(tile: .init(type: .castle(side: .bottom))), isWalkable: true, event: .openDoor)
							case "4":
								return MapTile(type: .door(tile: .init(type: .castle(side: .left))), isWalkable: true, event: .openDoor)
							case "K":
								return MapTile(type: .npc(tile: .init(type: .king)), isWalkable: true, event: .talkToNPC)
							case "b":
								return MapTile(type: .bed(tile: .init(isPlacedByPlayer: false)), isWalkable: true)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .blacksmith:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "a":
								return MapTile(type: .station(station: .init(type: .anvil)), isWalkable: true, event: .useStation)
							case "F":
								return MapTile(type: .station(station: .init(type: .furnace(progress: .empty))), isWalkable: true, event: .useStation)
							case "1":
								return MapTile(type: .npc(tile: NPCTile(type: .blacksmith)), isWalkable: true, event: .talkToNPC)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .blacksmith)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .mine:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "M":
								return MapTile(type: .startMining, isWalkable: true, event: .startMining)
							case "1":
								return MapTile(type: .npc(tile: NPCTile(type: .miner)), isWalkable: true, event: .talkToNPC)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .mine)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .shop:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .shop)), isWalkable: true, event: .openDoor)
							case "1":
								return MapTile(type: .shopStandingArea(type: .buy), event: .talkToNPC)
							case "2":
								return MapTile(type: .shopStandingArea(type: .sell), event: .talkToNPC)
							case "3":
								return MapTile(type: .shopStandingArea(type: .help), event: .talkToNPC)
							case "4":
								return MapTile(type: .npc(tile: .init(type: .salesman(type: .buy))))
							case "5":
								return MapTile(type: .npc(tile: .init(type: .salesman(type: .sell))))
							case "6":
								return MapTile(type: .npc(tile: .init(type: .salesman(type: .help))))
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .builder:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .builder)), isWalkable: true, event: .openDoor)
							case "1":
								return MapTile(type: .npc(tile: .init(type: .builder)), event: .talkToNPC)
							case "2":
								return MapTile(type: .npc(tile: .init(type: .builder_helper)), event: .talkToNPC)
							case "w":
								return MapTile(type: .station(station: .init(type: .workbench)), isWalkable: true, event: .useStation)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .hunting_area:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .hunting_area)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							case "1":
								return MapTile(type: .npc(tile: .init(type: .hunter)), isWalkable: true, event: .talkToNPC)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .inventor:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .inventor)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .house:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .house)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .stable:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .stable)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .farm:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .farm(type: .main))), isWalkable: true, event: .openDoor)
							case "a":
								return MapTile(type: .door(tile: DoorTile(type: .farm(type: .farm_area))), isWalkable: true, event: .openDoor)
							case "1":
								return MapTile(type: .npc(tile: .init(type: .farmer)), isWalkable: true, event: .talkToNPC)
							case "2":
								return MapTile(type: .npc(tile: .init(type: .farmer_helper)), isWalkable: true, event: .talkToNPC)
							case "p":
								return MapTile(type: .pot(tile: .init(cropTile: .init(type: .carrot))), isWalkable: true, event: .collectCrop)
							case "P":
								return MapTile(type: .pot(tile: .init(cropTile: .init(type: .none))), isWalkable: true, event: .collectCrop)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .hospital:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .hospital(side: .top))), isWalkable: true, event: .openDoor)
							case "a":
								return MapTile(type: .door(tile: DoorTile(type: .hospital(side: .bottom))), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .carpenter:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "1":
								return MapTile(type: .npc(tile: NPCTile(type: .carpenter)), isWalkable: true, event: .talkToNPC)
							case "2":
								return MapTile(type: .npc(tile: NPCTile(type: .carpenter_helper)), isWalkable: true, event: .talkToNPC)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .carpenter)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .restaurant:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .restaurant)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
					case .potter:
						switch char {
							case "#":
								return MapTile(type: .building(tile: .init(isPlacedByPlayer: false)), isWalkable: false)
							case "D":
								return MapTile(type: .door(tile: DoorTile(type: .potter)), isWalkable: true, event: .openDoor)
							case "@":
								return MapTile(type: .playerStart, isWalkable: true)
							case "1":
								return MapTile(type: .npc(tile: NPCTile(type: .potter)), isWalkable: true, event: .talkToNPC)
							default:
								return MapTile(type: .plain, isWalkable: true)
						}
				}
			}
		}
	}

	static func getMapFilePaths(mapName: String) -> (input: String, output: String) {
		if let directory = ProcessInfo.processInfo.environment["TERMINAL_KINGDOM_DEV_DIR"] {
			let inputFilePath = "./maps/\(mapName).map"
			let outputFilePath = "\(directory)/Sources/Resources/maps/starting_village/\(mapName).json"
			return (inputFilePath, outputFilePath)
		} else {
			exit(-1)
		}
	}
}
