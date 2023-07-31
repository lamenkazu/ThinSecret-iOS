//
//  DietTypeSignUpView.swift
//  ThinSecret
//
//  Created by coltec on 28/06/23.
//

import SwiftUI

struct DietTypeSignUpView: View {
    @State private var selectedDiet: String = ""
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("Tipo de Dieta desejada")
                    .font(.custom("aclonica", size: 30))
                    .foregroundColor(Color.mainText)
                    .frame(maxWidth: .infinity)
                
                RadioGroupDietType(selectedDiet: $selectedDiet)
                
                Text("É possível alcançar seu objetivo com qualquer tipo de dieta, o que muda é o tempo necessário para isso!")
                    .font(.custom("acme", size: 15))
                    .foregroundColor(Color.mainRed)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 50)
                    .padding(.top, 20)
                    
                
                Button(action: {
                    // Diet Next Button Action
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)

                }
                
            }.padding()
        }
    }
}

struct RadioGroupDietType: View {
    @Binding var selectedDiet: String
    
    var body: some View {
        VStack(spacing: 15) {
            RadioButtonDietType(id: "btn_lowcarb", text: "Carboidratos baixos", selectedDiet: $selectedDiet)
            Text("Redução do açúcar: alimentos açucarados, refrigerantes, grãos refinados e produtos com alto teor de açúcar são evitados.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_lowcarb" ? 1 : 0)
                .padding(.bottom, 15)
            Text("Aumento do consumo de vegetais com baixo teor de carboidratos: vegetais como espinafre, brócolis, couve-flor e abobrinha são frequentemente incluídos.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_lowcarb" ? 1 : 0)
            
            RadioButtonDietType(id: "btn_midcarb", text: "Carboidratos moderados", selectedDiet: $selectedDiet)
            Text("Fontes de carboidratos saudáveis: prioriza-se o consumo de carboidratos provenientes de grãos integrais, frutas, legumes e outros alimentos saudáveis.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_midcarb" ? 1 : 0)
                .padding(.bottom, 15)
            Text("Ênfase na qualidade dos alimentos: a atenção é voltada para escolher alimentos não processados e nutritivos.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_midcarb" ? 1 : 0)
            
            RadioButtonDietType(id: "btn_highcarb", text: "Carboidratos altos", selectedDiet: $selectedDiet)
            Text("Ênfase em grãos, legumes e frutas: alimentos ricos em carboidratos, como pães, massas, arroz, cereais, legumes e frutas, são a base da dieta.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_highcarb" ? 1 : 0)
                .padding(.bottom, 15)
            Text("Energia de rápida absorção: uma maior ingestão de carboidratos pode fornecer energia rápida, mas é importante escolher fontes de carboidratos integrais e minimamente processados.")
                .font(.caption)
                .frame(maxWidth: .infinity)
                .opacity(selectedDiet == "btn_highcarb" ? 1 : 0)
        }
    }
}

struct RadioButtonDietType: View {
    let id: String
    let text: String
    @Binding var selectedDiet: String
    
    var body: some View {
        Button(action: {
            selectedDiet = id
        }) {
            HStack {
                Image(systemName: selectedDiet == id ? "largecircle.fill.circle" : "circle")
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

struct DietTypeSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        DietTypeSignUpView()
    }
}
