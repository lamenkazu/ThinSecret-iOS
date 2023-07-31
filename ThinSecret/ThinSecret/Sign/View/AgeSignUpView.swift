import SwiftUI

struct AgeSignUpView: View {
    @State private var selectedDate = Date()
    @State private var isProgressVisible = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
    
    var age: String {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: selectedDate, to: now)
        if let age = ageComponents.year {
            return "\(age) anos"
        } else {
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Data de Nascimento")
                    .font(.system(size: 32))
                    .foregroundColor(.primary)
                    .font(.custom("Acme-Regular", size: 32))
                    .padding(.bottom, 20)
                
                DatePicker(
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: .date
                ) {
                    Text("Selecione uma data")
                        .foregroundColor(.primary)
                        .font(.system(size: 20))
                }
                .padding(.horizontal, 35)
                .labelsHidden()
                
                HStack {
                    Text("\(selectedDate, formatter: dateFormatter)")
                        .font(.system(size: 18))
                        .foregroundColor(.primary)
                    
                    Text(age)
                        .font(.system(size: 18))
                        .foregroundColor(.primary)
                }
                .padding(.top, 10)
                
                if isProgressVisible {
                    ProgressView()
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(.blue)
                        .padding(30)
                }
                
                Button(action: {
                    // Age Next Button Action
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(30)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
    }
}

struct AgeSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AgeSignUpView()
    }
}
