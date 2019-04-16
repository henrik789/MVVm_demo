import Foundation

enum Request {
    case getUsers
    case getImages
}

extension Request {
    var url: URL {
        switch self {
        case .getImages:
            return URL(string: "https://picsum.photos/60/?random")!
        case .getUsers:
            return URL(string: "https://jsonplaceholder.typicode.com/users")!
        }
    }
}


