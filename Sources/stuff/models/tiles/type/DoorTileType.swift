import Foundation

enum DoorTileTypes: Codable, Equatable, Hashable {
	case castle(side: CastleSide)
	case blacksmith
	case mine
	case shop
	case builder
	case hunting_area
	case inventor
	case house
	case stable
	case farm(type: FarmDoors)
	case hospital(side: HospitalSide)
	case carpenter
	case restaurant
	case potter
	indirect case custom(mapID: UUID?, doorType: DoorTileTypes)
}

enum FarmDoors: Codable, Equatable, Hashable {
	case main, farm_area
}

enum HospitalSide: Codable, Equatable, Hashable {
	case top, bottom
}

enum CastleSide: Codable, Equatable, Hashable {
	case top, bottom, right, left
}
