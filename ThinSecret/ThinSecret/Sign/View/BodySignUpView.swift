import SwiftUI

struct BodySignUpView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Body")
                    .font(.custom("acme", size: 40))
                    .foregroundColor(.white)
                    .padding(.top, 150)
                
                HStack {
                    TextField("Height", text: $height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .frame(width: 120)
                    
                    Text("Cm")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                }
                
                HStack {
                    TextField("Weight", text: $weight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .frame(width: 120)
                    
                    Text("Kg")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                }
                
                Button(action: {
                    // Body Next Button Action
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
        }
    }
}

struct BodySignUpView_Previews: PreviewProvider {
    static var previews: some View {
        BodySignUpView()
    }
}
