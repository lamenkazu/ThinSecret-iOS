import Foundation
import SwiftUI
import Combine

class SignViewModel: ObservableObject {
    @Published var uiState: SignViewUIState = .none
    
    func navigateToInitSignUpView() {
        uiState = .initSignUp
    }
    
    func navigateToHomeScreen(){
        uiState = .goToHomeScreen
    }
}
