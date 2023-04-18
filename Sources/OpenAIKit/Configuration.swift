import NIOHTTP1
import Foundation

public struct Configuration {
    public let apiKey: String
    public let organization: String?
    public let host: String
    let headers: HTTPHeaders
    
    public init(
        apiKey: String,
        organization: String? = nil,
        host: String = "api.openai.com",
        customHeaders: [String: String] = [:]
    ) {
        self.apiKey = apiKey
        self.organization = organization
        self.host = host
        
        var headers = HTTPHeaders()
        headers.add(name: "Authorization", value: "Bearer \(apiKey)")

        if let organization = organization {
            headers.add(name: "OpenAI-Organization", value: organization)
        }
        
        customHeaders.keys.forEach { key in
            headers.add(name: key, value: customHeaders[key] ?? "")
        }
        
        self.headers = headers
    }
}
