import Foundation

struct UserInfo {
    var name: String
    var email: String
    var phone: String
    var birthDate: String
    var bodyInfo: BodyInfo

    init(name: String, email: String, phone: String, birthDate: String, bodyInfo: BodyInfo) {
        self.name = name
        self.email = email
        self.phone = phone
        self.birthDate = birthDate
        self.bodyInfo = bodyInfo
    }
}
