import SwiftUI

struct SignView: View {
    var body: some View {
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
                
                Spacer()
            }
            .padding()
        }
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
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                // New User Button Action
            }) {
                Text("Sou um novo usuario")
                    .font(.custom("acme", size: 20))
                    .foregroundColor(Color.mainText)
                    .frame(width: 200, height: 40)
                    .background(Color.mainPrimary)
                    .cornerRadius(8)
            }
            
            Button(action: {
                // Existing User Button Action
            }) {
                Text("Ja possuo uma conta")
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
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
