import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("Home")
                    .font(.title)
                    .padding(.top)
                
                Picker("", selection: $selectedTab) {
                    Text("Tab Item 1").tag(0)
                    Text("Tab Item 2").tag(1)
                    Text("Tab Item 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .background(Color("mainBackground")) // Adicione a cor de background ao Picker
                
                Spacer()
                
                if selectedTab == 0 {
                    DiaryFragment()
                } else if selectedTab == 1 {
                    ReportFragment()
                } else {
                    UserFragment(viewModel: UserViewModel())
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color("mainBackground")) // Adicione a cor de background ao NavigationView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
