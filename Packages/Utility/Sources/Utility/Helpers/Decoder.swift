
import class Foundation.JSONDecoder
import struct Foundation.Data

import enum Entities.APIError

public func decode<Model>(
    data: Data,
    decodingInfo: [CodingUserInfoKey: Any]?
) throws -> Model where Model: Decodable {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    
    do {
        #if DEBUG
            print(data.pretty)
        #endif
        let model = try decoder.decode(Model.self, from: data)
        return model
    } catch {
        throw APIError.decoding(error)
    }
}
