import SwiftUI

struct UserFragment: View {
    
    @ObservedObject var viewModel: UserViewModel
    
    @State private var userIMC = ""
    @State private var userWeight = ""
    @State private var userHeight = ""
    @State private var selectedGoalIndex = 0
    @State private var selectedDietIndex = 0
    @State private var selectedActivityLevelIndex = 0
    @State private var isLoading = false
    
    let goals = ["Perder Peso", "Manter Peso", "Ganhar Peso"]
    let diets = ["Carboidratos baixos", "Carboidratos moderados", "Carboidratos altos"]
    let activityLevels = ["Sedentário", "Pouco Ativo", "Ativo", "Altamente Ativo", "Extremamente Ativo"]
    
    
    init(viewModel: UserViewModel) {
            self.viewModel = viewModel
            self.viewModel.fetchUser { _ in }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("üsuario q veio: \(String(describing: viewModel.user))" )

        }
        
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 100)
                
                VStack {
                    ProgressView()
                        .progressViewStyle(LinearProgressViewStyle(tint: Color("mainPrimary")))
                        .frame(height: 10)
                    
                    VStack {
                        Text("\(viewModel.user?.name ?? ""), \(viewModel.user?.bodyInfo.age ?? 0)")
                            .font(.custom("Acme", size: 28))
                            .padding()

                        
                        HStack {
                        TextField("IMC", text: .constant(viewModel.user?.bodyInfo.IMC != nil ? String(viewModel.user!.bodyInfo.IMC!) : ""))
                                                        .textFieldStyle(.plain)
                                                        .keyboardType(.decimalPad)
                                                        .frame(width: 100)
                                                        .padding()
                                                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color("mainSecond")))
                                                    
                                                    TextField("IDR", text: .constant(viewModel.user?.bodyInfo.IDR != nil ? String(viewModel.user!.bodyInfo.IDR!) : ""))
                                                        .textFieldStyle(.plain)
                                                        .disabled(true)
                                                        .frame(width: 100)
                                                        .padding()
                                                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color("mainSecond")))
                                                }
                                                .padding(.vertical, 10)
                                                
                                                HStack {
                                                    TextField("Weight", text: .constant(viewModel.user?.bodyInfo.weight != nil ? String(viewModel.user!.bodyInfo.weight!) : ""))
                                                        .textFieldStyle(.plain)
                                                        .keyboardType(.decimalPad)
                                                        .frame(width: 100)
                                                        .padding()
                                                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color("mainSecond")))
                                                    
                                                    TextField("Height", text: .constant(viewModel.user?.bodyInfo.height != nil ? String(viewModel.user!.bodyInfo.height!) : ""))
                                                        .textFieldStyle(.plain)
                                                        .keyboardType(.decimalPad)
                                                        .frame(width: 100)
                                                        .padding()
                                                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color("mainSecond")))
                                                }
                                                .padding(.vertical, 10)

                        VStack {
                            
                            Picker(selection: $selectedGoalIndex, label: Text("Goal")) {
                                ForEach(0..<goals.count) { index in
                                    Text(goals[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 200)
                            .onChange(of: selectedGoalIndex) { newIndex in
                                selectedGoalIndex = newIndex
                            }
                            
                            Picker(selection: $selectedDietIndex, label: Text("Diet")) {
                                ForEach(0..<diets.count) { index in
                                    Text(diets[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 200)
                            
                            Picker(selection: $selectedActivityLevelIndex, label: Text("Activity Level")) {
                                ForEach(0..<activityLevels.count) { index in
                                    Text(activityLevels[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 200)
                        }
                        .padding(.top, 15)
                    }
                    .padding(15)
                    
                    HStack {
                        Button(action: {
                            isLoading = true
                            // Perform API request or any other action here
                            // Once the request is complete, set isLoading = false
                            // You can simulate a delay using DispatchQueue.main
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                            }
                        }) {
                            Text("Save")
                                .font(.custom("Acme", size: 20))
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color("mainPrimary"))
                                .cornerRadius(8)
                        }
                        .padding(.trailing, 15)
                        .disabled(isLoading)
                        
                        Button(action: {
                            // Implement Logout functionality here
                        }) {
                            Text("Log Out")
                                .font(.custom("Acme", size: 20))
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(8)
                        }
                        .padding(.trailing, 15)
                        .disabled(isLoading)
                        
                        Button(action: {
                            // Implement Reset functionality here
                        }) {
                            Text("Reset")
                                .font(.custom("Acme", size: 20))
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color("mainPrimary"))
                                .cornerRadius(8)
                        }
                        .padding(.trailing, 15)
                        .disabled(isLoading)
                    }
                    .padding(.top, 20)
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
                .background(Color("mainBackground"))
                .cornerRadius(15)
                .padding()
            }
        }
        .background(Color("mainBackground").ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    Text("AppName")
                        .font(.custom("Acme", size: 20))
                }
            }
        }
    }
}

extension UserFragment{
    
    private var selectedGoal: String {
        if let userGoal = viewModel.user?.bodyInfo.goal {
            switch userGoal {
            case BodyInfo.DietGoal.loss:
                return goals[0]
            case BodyInfo.DietGoal.keep:
                return goals[1]
            case .gain:
                return goals[2]
            }
        } else {
            return goals[selectedGoalIndex]
        }
    }
    
}

struct UserFragment_Previews: PreviewProvider {
    static var previews: some View {
        UserFragment(viewModel: UserViewModel())
    }
}
