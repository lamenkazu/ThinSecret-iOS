
import Foundation
import SwiftUI

class InitSignUpViewModel: ObservableObject {
    @Published var uiState: InitSignUpUIState = .none
    
    
}

enum InitSignUpUIState: Equatable {
    case none
}
