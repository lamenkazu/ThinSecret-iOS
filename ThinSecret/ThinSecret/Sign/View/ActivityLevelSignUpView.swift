import SwiftUI

struct ActivityLevelSignUpView: View {
    @State private var selectedOption: String = ""
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Seu nível de atividade")
                    .font(.custom("Acme-Regular", size: 35))
                    .foregroundColor(.mainText)
                    .padding(.top, 50)
                
                RadioGroupActivityLevel(selectedOption: $selectedOption, options: [
                    "Sedentário": "Pouco ou nenhum exercício",
                    "Pouco Ativo": "Exercício leve 1 a 3 dias por semana",
                    "Ativo": "Exercício moderado, fazer desporto 3 a 5 dias por semana",
                    "Altamente Ativo": "Exercício pesado de 5 a 6 dias por semana",
                    "Extremamente Ativo": "Exercício pesado diariamente e até 2x por dia"
                ])
                .padding(.vertical, 20)
                
                Button(action: {
                    // Activity Next Button Action
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.mainText)
        }
    }
}

struct RadioGroupActivityLevel: View {
    @Binding var selectedOption: String
    let options: [String: String]
    
    let orderedKeys = ["Sedentário", "Pouco Ativo", "Ativo", "Altamente Ativo", "Extremamente Ativo"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(orderedKeys, id: \.self) { key in
                if let description = options[key] {
                    RadioButtonActivityLevel(
                        option: key,
                        isSelected: key == selectedOption,
                        description: description
                    ) {
                        selectedOption = key
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct RadioButtonActivityLevel: View {
    let option: String
    let isSelected: Bool
    let description: String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: action) {
                HStack(spacing: 10) {
                    Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 10)
                    
                    Text(option)
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
                        
            Text(description)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10) // Espaço extra abaixo do texto
        }
    }
}


struct ActivityLevelSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLevelSignUpView()
    }
}
