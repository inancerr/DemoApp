
import struct Foundation.Data
import class Foundation.JSONSerialization

// MARK: - Extensions
extension Data {
    var pretty: String {
        guard let json = try? JSONSerialization.jsonObject(with: self) else { return "" }
        let options: JSONSerialization.WritingOptions
        if #available(iOS 13.0, *) {
            options = [.prettyPrinted, .withoutEscapingSlashes]
        } else {
            options = [.prettyPrinted]
        }
        let data = try! JSONSerialization.data(withJSONObject: json, options: options)
        return String(data: data, encoding: .utf8) ?? ""
    }
}
