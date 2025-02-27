import Foundation

protocol NetworkService {
    func download(_ resourceName: String) async throws -> [User]
    
    var type: String { get }
}
