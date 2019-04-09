import Foundation

struct User {
    let name: String
}


extension User {
    static var mockUsers: [User] {
        return [User(name: "A"), User(name: "B"), User(name: "C"), User(name: "D"), User(name: "E"), User(name: "F"), User(name: "G")]
    }
}
