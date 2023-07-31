import SwiftUI

struct GenderSignUpView: View {
    @State private var isOrientationSelected = false
    @State private var isBoySelected = false
    @State private var isGirlSelected = false
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dec")
                    .font(.system(size: 30))
                    .padding(.top, 100)
                
                Button(action: {
                    isOrientationSelected.toggle()
                }, label: {
                    Image("transgender")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.white)
                })
                .padding()
                .background(isOrientationSelected ? Color.pink : Color.black)
                .cornerRadius(12) // Define a borda arredondada
                
                HStack {
                    Button(action: {
                        isBoySelected.toggle()
                        isGirlSelected = false
                    }, label: {
                        Image("man")
                            .resizable()
                            .frame(width: 54, height: 54)
                    })
                    .padding()
                    .background(isBoySelected ? Color.mainAccent : Color.clear)
                    .cornerRadius(12) // Define a borda arredondada
                    
                    Button(action: {
                        isGirlSelected.toggle()
                        isBoySelected = false
                    }, label: {
                        Image("woman")
                            .resizable()
                            .frame(width: 54, height: 54)
                    })
                    .padding()
                    .background(isGirlSelected ? Color.mainAccent : Color.clear)
                    .cornerRadius(12) // Define a borda arredondada
                }
                
                Button(action: {
                    if !isBoySelected && !isGirlSelected {
                        Toast.show("Selecione um gênero para prosseguir")
                    } else {
                        // Handle next button action
                    }
                }, label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 50)
                })
                .cornerRadius(12) // Define a borda arredondada
            }
            .padding()
        }
    }
}

struct GenderSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSignUpView()
    }
}

struct Toast {
    static func show(_ message: String) {
        // Implement your custom toast view or use a third-party library to display a toast message
    }
}
