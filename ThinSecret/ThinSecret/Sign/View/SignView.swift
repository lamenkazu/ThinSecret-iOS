import SwiftUI

struct SignView: View {
    @StateObject private var viewModel = SignViewModel()
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 130)
                        .scaledToFit()
                        .transition(.slide)
                        .id("logo_image")
                    
                    TitleView()
                    
                    Spacer()
                    
                    ButtonsView()
                        .onChange(of: viewModel.uiState) { uiState in
                            if uiState == .initSignUp {
                                navigateToInitSignUpView()
                            }
                        }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .environmentObject(viewModel)
    }
    
    private func navigateToInitSignUpView() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        window.rootViewController = UIHostingController(rootView: SignViewRouter.makeInitSignUpView())
        window.makeKeyAndVisible()
    }
    
    
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: -29.5) {
            Text("Thin")
                .font(.custom("aclonica", size: 30))
                .foregroundColor(Color.mainPrimary)
                .transition(.slide)
                .id("title")
            
            Text("Secret")
                .font(.custom("aclonica", size: 50))
                .foregroundColor(Color.mainSecond)
                .transition(.slide)
                .id("title2")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct ButtonsView: View {
    @EnvironmentObject private var viewModel: SignViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                viewModel.navigateToInitSignUpView()
            }) {
                Text("Sou um novo usuário")
                    .font(.custom("acme", size: 20))
                    .foregroundColor(Color.mainText)
                    .frame(width: 200, height: 40)
                    .background(Color.mainPrimary)
                    .cornerRadius(8)
            }
            
            Button(action: {
                // Implemente a ação desejada para o outro botão
            }) {
                Text("Já possuo uma conta")
                    .font(.custom("acme", size: 20))
                    .foregroundColor(Color.mainText)
                    .frame(width: 200, height: 40)
                    .background(Color.mainSecond)
                    .cornerRadius(8)
            }
        }
    }
}

extension Color {
    static let mainBackground = Color("mainBackground")
    static let mainPrimary = Color("mainPrimary")
    static let mainSecond = Color("mainSecond")
    static let mainText = Color("mainText")
    static let mainRed = Color("mainWarning")
    static let mainAccent = Color("mainAccent")
    static let mainGreen = Color("mainGreen")
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
