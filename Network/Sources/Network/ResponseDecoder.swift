
import struct Foundation.Data

public typealias ResponseDecoder<Model: Decodable> = (Data, [CodingUserInfoKey: Any]?) throws -> Model
