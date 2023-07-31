import SwiftUI


struct ReportFragment: View {
    @State private var selectedDate = ""
    
    var body: some View {
        VStack {
            // ConstraintLayout
            HStack {
                Button(action: {
                    // Ação do botão "Voltar"
                }) {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                }
                
                DatePicker("", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(maxWidth: 200)
                    .font(.system(size: 30))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                
                Button(action: {
                    // Ação do botão "Avançar"
                }) {
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 60)
            
            // Gráfico
            Text("Gráfico aqui")
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(.top, 10)
            
            Spacer()
        }
    }
}
