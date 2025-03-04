enum StationTileType: Codable, Equatable {
	case furnace(progress: FurnaceProgress)
	case anvil
	case workbench
}

enum FurnaceProgress: Int, Codable {
	case empty = 0
	case inProgess = 1
	case finished = 2
}
