import Foundation

enum Request {
    case getUsers
    case getImages
    case getBigImages
}

extension Request {
    var url: URL {
        switch self {
        case .getImages:
            return URL(string: "https://picsum.photos/60/?random")!
        case .getBigImages:
            return URL(string: "https://picsum.photos/300/?random")!
        case .getUsers:
            return URL(string: "https://jsonplaceholder.typicode.com/users")!
        }
    }
}


