import SwiftUI

struct DiaryFragment: View {
    @State private var searchText = ""
    @State private var searchResult: [FoodDetails] = []
    @State private var foodList: [FoodDetails] = []
    @State private var IR: Int = 0


    var body: some View {
        VStack(spacing: 20) {
            SearchView(searchText: $searchText, onSearch: searchFoodsAsync)
                .padding(.top, 20)

            // Status Layout
            HStack(spacing: 20) {
                CardView(text: "IDR: \(getFormattedIDR())")
                CardView(text: "IR: \(IR)")
            }
            .padding(13)

            // Scroll Food List
            ScrollView {
                ForEach(foodList) { food in
                    CardView(text: food.foodName)
                        .frame(height: 100)
                }
            }
            .padding(.horizontal, 10)

            Button(action: {
                clearFoodList()
            }) {
                Text("Esvaziar Lista")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(red: 0.698, green: 0.137, blue: 0.196))
                    .cornerRadius(8)
            }

            Button(action: {
                //addFoodListToDB()
            }) {
                Text("Adicionar Refeição")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color(red: 0.918, green: 0.918, blue: 0.918))
                    .cornerRadius(8)
            }
            .padding(.bottom, 20)

            // Exibir os resultados da pesquisa
            List(searchResult, id: \.foodId) { food in
                Button(action: {
                    // Adicione o alimento selecionado à lista de alimentos
                    addToFoodList(food)
                }) {
                    CardView(text: food.foodName)
                        .frame(height: 100)
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 20)
        .onAppear {
            updateIDR()
        }
    }

    func addToFoodList(_ food: FoodDetails) {
        foodList.append(food)
        // Atualize o valor de IR conforme necessário com base nos detalhes do alimento selecionado
        //IR += food.calories // Por exemplo, você pode adicionar as calorias do alimento ao IR
    }


    
    func searchFoodsAsync() {
        DispatchQueue.global().async {
            FatSecretApiService.searchFoods(query: self.searchText) { result in
                switch result {
                case .success(let xmlData):
                    let xmlParser = XmlParser()
                    let foodDetails = xmlParser.parseFoodSearchResults(xmlData: xmlData)
                    DispatchQueue.main.async {
                        self.searchResult = foodDetails
                    }
                case .failure(let error):
                    // Tratar o erro de forma apropriada
                    print("Erro na busca de alimentos: \(error)")
                }
            }
        }
    }



    func updateIDR() {
        // Implemente a lógica para atualizar o valor de IDR
        // Por exemplo, você pode usar a mesma lógica presente na função onResume() do seu código Java para buscar o valor de IDR do usuário e atualizar o estado correspondente.
    }

    func clearFoodList() {
        foodList.removeAll()
        IR = 0
    }

//    func addFoodListToDB() {
////        HomeController.addFoodListToDB(foodList, IR, success: { success in
////            if success {
////                clearFoodList()
////            }
////        })
//    }

    func getFormattedIDR() -> String {
//        // Implemente a lógica para obter o valor de IDR formatado corretamente
//        // Por exemplo, se você tiver uma variável `idrValue` com o valor de IDR, você pode usar uma formatação adequada antes de retornar a string formatada.
//        let formattedIDR = ...
//        return formattedIDR
        return ""
    }
}

struct CardView: View {
    var text: String
    
    var body: some View {
        VStack {
            CardContentView(text: text)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding(30)
    }
}

struct CardContentView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 27))
            .frame(width: 155)
            .padding(10)
            .multilineTextAlignment(.center)
    }
}

struct SearchView: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    var body: some View {
        TextField("Search", text: $searchText, onCommit: onSearch)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct DiaryFragment_Previews: PreviewProvider {
    static var previews: some View {
        DiaryFragment()
    }
}
