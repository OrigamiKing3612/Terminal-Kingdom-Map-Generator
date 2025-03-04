enum MapTileEvent: Codable {
	case openDoor
	case chopTree
	case startMining
	case talkToNPC
	case collectCrop
	case useStation
	//    case collectItem(item: String)
	//    case combat(enemy: String)
	//    case custom(action: () -> Void)
}
