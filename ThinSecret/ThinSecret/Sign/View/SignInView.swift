import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isProgressVisible = false
    
    var body: some View {
        ZStack {
            Color("mainBackground")
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 130)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .padding(.top, 50)
                
                VStack(spacing: -29.5) {
                    Text("Thin")
                        .font(.custom("Aclonica-Regular", size: 30))
                        .foregroundColor(Color("mainPrimary"))
                        .transition(.move(edge: .leading))
                    
                    Text("Secret")
                        .font(.custom("Aclonica-Regular", size: 50))
                        .foregroundColor(Color("mainSecond"))
                        .transition(.move(edge: .leading))
                }
                .padding(.top, 20)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                
                VStack {
                    Text("Bem vindo de volta!")
                        .font(.custom("Acme-Regular", size: 25))
                        .foregroundColor(Color("mainText"))
                        .padding(.leading, 35)
                    
                    VStack(spacing: 15) {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 250)
                            .padding(.horizontal, 20)
                        
                        SecureField("Senha", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 250)
                            .padding(.horizontal, 20)
                    }
                    .padding(.top, 30)
                    
                    if isProgressVisible {
                        ProgressView()
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color("mainPrimary"))
                            .padding(.top, 30)
                    }
                    
                    Button(action: {
                        isProgressVisible = true
                        
                        // Perform authentication logic
                        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                            isProgressVisible = false
                            
                            if let error = error {
                                // Authentication failed
                                print("Authentication failed: \(error.localizedDescription)")
                            } else {
                                // Authentication successful
                                print("Authentication successful")
                                navigateToHomeScreen()
                                
                                // Perform any necessary actions, such as navigating to the home screen
                            }
                        }
                    }) {
                        Text("Entrar")
                            .font(.custom("Acme-Regular", size: 20))
                            .foregroundColor(Color("mainText"))
                            .frame(width: 200, height: 50)
                            .background(Color("mainPrimary"))
                            .cornerRadius(10)
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}

extension SignInView{
    private func navigateToHomeScreen() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        window.rootViewController = UIHostingController(rootView: SignViewRouter.makeHomeScreen())
        window.makeKeyAndVisible()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
