import Foundation

struct User: Codable {
    let name: String
    let username: String
    let phone: String
    let email: String
}

extension User {
    init(json: [String: Any]) throws {
        guard
            let name = json["name"] as? String,
        let phone = json["phone"] as? String,
        let userName = json["username"] as? String,
        let email = json["email"] as? String
        else {
            throw NSError(domain: "Failed initializing user with given data", code: 1, userInfo: json)
        }
        self = User(name: name, username: userName, phone: phone, email: email)
    }
}




//extension User {
//    static var mockUsers: [User] {
//        return [User(name: "A"), User(name: "B"), User(name: "C"), User(name: "D"), User(name: "E"), User(name: "F"), User(name: "G")]
//    }
//}
