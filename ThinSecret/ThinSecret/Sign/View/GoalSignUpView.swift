import SwiftUI

struct GoalSignUpView: View {
    @State private var selectedGoal: String = ""
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Qual seu objetivo atual?")
                    .font(.custom("acme", size: 35))
                    .foregroundColor(Color.mainText)
                    .frame(maxWidth: .infinity)
                
                RadioGroupGoal(selectedGoal: $selectedGoal)
                
                Button(action: {
                    // Goal Next Button Action
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }.padding()
        }
    }
}

struct RadioGroupGoal: View {
    @Binding var selectedGoal: String
    
    var body: some View {
        VStack(spacing: 15) {
            RadioButtonGoal(id: "btn_loss", text: "Perder Peso", selectedGoal: $selectedGoal)
            RadioButtonGoal(id: "btn_keep", text: "Manter Peso", selectedGoal: $selectedGoal)
            RadioButtonGoal(id: "btn_gain", text: "Ganhar Peso", selectedGoal: $selectedGoal)
        }
    }
}

struct RadioButtonGoal: View {
    let id: String
    let text: String
    @Binding var selectedGoal: String
    
    var body: some View {
        Button(action: {
            selectedGoal = id
        }) {
            HStack {
                Image(systemName: selectedGoal == id ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(text)
                    .font(.title2)
            }
            .foregroundColor(Color.mainText)
            .padding(.leading, 10)
        }
    }
}

struct GoalSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSignUpView()
    }
}
