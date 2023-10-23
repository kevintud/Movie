

import Foundation

struct Model: Codable {
    let title: String
    let description: String?
    let shouldShowDescription: Bool
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title, description, shouldShowDescription, image
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)

        if let shouldShowDescriptionInt = try? container.decode(Int.self, forKey: .shouldShowDescription) {
            shouldShowDescription = shouldShowDescriptionInt == 1
        } else if let shouldShowDescriptionString = try? container.decode(String.self, forKey: .shouldShowDescription) {
            shouldShowDescription = shouldShowDescriptionString.lowercased() == "true"
        } else {
            shouldShowDescription = false 
        }
    }
}


struct MovieModel: Codable {
    let data: [Model]
}
