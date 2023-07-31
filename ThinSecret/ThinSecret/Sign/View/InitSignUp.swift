import SwiftUI

struct InitSignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Para começar, vamos calcular sua Ingestão Diária Recomendada. Sua IDR é a quantidade ideal de alimentos que você deve consumir todos os dias.")
                        .font(.custom("acme", size: 25))
                        .foregroundColor(Color.mainText)
                    
                    Text("A IDR é gerada de acordo com sua meta nutricional, seu nível de atividade, sua idade, seu peso e outras características pessoais.")
                        .font(.custom("acme", size: 25))
                        .foregroundColor(Color.mainText)
                    
                    Button(action: {
                        // Next Button Action
                    }) {
                        Text("Next")
                            .font(.custom("acme", size: 20))
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 40)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton) // Adiciona o botão de volta como item de navegação
            }
        }
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .font(.title)
                .foregroundColor(Color.mainText)
        }
    }
}


struct InitSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        InitSignUpView()
    }
}
