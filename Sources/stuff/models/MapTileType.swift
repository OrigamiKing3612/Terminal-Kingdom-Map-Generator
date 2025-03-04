enum MapTileType: Codable, Equatable {
	// MARK: Plains Biome

	case plain
	case water
	case tree

	// MARK: Desert Biome

	case sand
	case cactus

	// MARK: Snow Biome

	case snow
	case snow_tree
	case ice

	// MARK: Other

	case path // TODO: Make buildable
	case player

	// MARK: Buildable

	case building(tile: BuildingTile)
	case door(tile: DoorTile)
	case chest /* (tile: ChestTile) */
	case bed(tile: BedTile)
	case desk(tile: DeskTile)
	case fence(tile: FenceTile)
	case gate(tile: GateTile)

	// MARK: Dont Generate

	case TOBEGENERATED
	case playerStart
	case biomeTOBEGENERATED(type: BiomeType)

	// MARK: Building Stuff

	case station(station: StationTile)
	case startMining

	// MARK: Crops

	// TODO: rename crop -> tile
	case crop(crop: CropTile)
	case pot(tile: PotTile)

	// MARK: NPC

	case npc(tile: NPCTile)
	case shopStandingArea(type: ShopStandingAreaType)
}

enum ShopStandingAreaType: String, Codable {
	case buy, sell, help
}
