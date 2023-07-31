import SwiftUI

struct UserSignUpView: View {
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isProgressVisible = false
    
    var body: some View {
        ZStack {
            Color("mainBackground")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Registro")
                    .font(.system(size: 32))
                    .foregroundColor(.primary)
                    .font(.custom("Acme-Regular", size: 32))
                
                VStack(spacing: 15) {
                    TextField("Nome", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                    
                    TextField("Telefone", text: $phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                    
                    SecureField("Senha", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                    
                    SecureField("Confirmar Senha", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                }
                .padding()
                
                if isProgressVisible {
                    ProgressView()
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(.blue)
                        .padding(30)
                }
                
                Button(action: {
                    // User Done Button Action
                }) {
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .padding(30)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("MainBackground"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct UserSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUpView()
    }
}

extension UserSignUpView{
    private func navigateToHomeScreen() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        window.rootViewController = UIHostingController(rootView: SignViewRouter.makeHomeScreen())
        window.makeKeyAndVisible()
    }
}
