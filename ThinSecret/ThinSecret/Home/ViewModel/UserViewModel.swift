//
//  UserViewModel.swift
//  ThinSecret
//
//  Created by coltec on 03/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseDatabaseSwift

class UserViewModel: ObservableObject {
    @Published var uiState: HomeUIState = .userFragment
    @Published var user: UserInfo?
    
    private var currentUserUid: String? {
        return Auth.auth().currentUser?.uid
    }
    
    var userInfoRef: DatabaseReference? {
            if let uid = currentUserUid {
                return Database.database().reference(withPath: "UserInfo").child(uid)
            }
            return nil
        }
    
    var userBodyRef: DatabaseReference? {
        if let uid = currentUserUid {
            return Database.database().reference(withPath: "BodyInfo").child(uid)
        }
        return nil
    }
    
    
    func fetchUser(completion: @escaping (UserInfo?) -> Void) {
        guard let userInfoRef = userInfoRef else {
            completion(nil)
            return
        }
        
        userInfoRef.observeSingleEvent(of: .value) { snapshot, error in
            if let error = error {
                print("Erro ao buscar dados do usuario: \(error)")
                completion(nil)
                return
            }
            
            guard let userInfoDict = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }
            
            // Parse user info from the snapshot data
            let name = userInfoDict["name"] as? String ?? ""
            let email = userInfoDict["email"] as? String ?? ""
            let phone = userInfoDict["phone"] as? String ?? ""
            let birthDate = userInfoDict["birthDate"] as? String ?? ""
        
            
            // Fetch user body info
            self.fetchUserBodyInfo { bodyInfo in
                if let bodyInfo = bodyInfo {
                    let user = UserInfo(name: name, email: email, phone: phone, birthDate: birthDate, bodyInfo: bodyInfo)
                    
                    DispatchQueue.main.async {
                        self.user = user

                    }
                    
                    completion(user)
                } else {
                    completion(nil)
                }
            }
        }
    }

    private func fetchUserBodyInfo(completion: @escaping (BodyInfo?) -> Void) {
        guard let userBodyRef = userBodyRef else {
            completion(nil)
            return
        }
        
        userBodyRef.observeSingleEvent(of: .value) { snapshot, error in
            if let error = error {
                print("Erro ao buscar dados do usuario: \(error)")
                completion(nil)
                return
            }
            
            guard let bodyInfoDict = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }

            
            // Parse body info from the snapshot data
            let age = bodyInfoDict["age"] as? Int
            let weight = bodyInfoDict["weight"] as? Int
            let height = bodyInfoDict["height"] as? Int
            // ...
            let genderString = bodyInfoDict["gender"] as? String
            let goalString = bodyInfoDict["goal"] as? String
            let actLevelString = bodyInfoDict["actLevel"] as? String
            let dietString = bodyInfoDict["diet"] as? String
            let IMC = bodyInfoDict["imc"] as? Double
            let IDR = bodyInfoDict["idr"] as? Double
            
            let gender: BodyInfo.Sex = {
                switch genderString?.lowercased() {
                case "masculino":
                    return .masculino
                case "feminino":
                    return .feminino
                default:
                    return .nulo
                }
            }()
            
            let goal: BodyInfo.DietGoal = {
                switch goalString?.lowercased() {
                case "perder peso":
                    return .loss
                case "manter peso":
                    return .keep
                case "ganhar peso":
                    return .gain
                default:
                    return .keep
                }
            }()
            
            let actLevel: BodyInfo.ActLevel = {
                switch actLevelString?.lowercased() {
                case "sedentary":
                    return .sedentary
                case "low_active":
                    return .lowActive
                case "active":
                    return .active
                case "high_active":
                    return .highActive
                case "extreme_active":
                    return .extremeActive
                default:
                    return .sedentary
                }
            }()
            
            let diet: BodyInfo.DietType = {
                switch dietString?.lowercased() {
                case "lowcarb":
                    return .lowCarb
                case "midcarb":
                    return .midCarb
                case "highcarb":
                    return .highCarb
                default:
                    return .lowCarb
                }
            }()
            
            // Create BodyInfo instance with parsed values
            let bodyInfo = BodyInfo(age: age,
                                    weight: weight,
                                    height: height,
                                    gender: gender,
                                    goal: goal,
                                    actLevel: actLevel,
                                    diet: diet,
                                    IMC: IMC,
                                    IDR: IDR)
            
            
            completion(bodyInfo)
        }
    }

}
