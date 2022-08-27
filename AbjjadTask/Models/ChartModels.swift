//
//  ChartModels.swift
//  AbjjadTask
//
//  Created by Hussam Elsadany on 27/08/2022.
//

typealias ChartModelResponse = [[ChartModel]]

enum ChartModel: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ChartModel.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ChartModel"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
