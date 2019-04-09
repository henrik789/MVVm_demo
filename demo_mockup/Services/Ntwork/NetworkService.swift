import Foundation

class NetworkService {
    init() { }
    func addRequest(_ request: Request, completion: @escaping (Any)-> Void) {
        completion("blaaaa")
    }
}
