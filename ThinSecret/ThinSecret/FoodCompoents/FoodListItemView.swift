//
//  FoodListItemView.swift
//  ThinSecret
//
//  Created by coltec on 28/06/23.
//

import SwiftUI

struct FoodListItemView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("mainAccent"))
                    .frame(height: 80)
                    .padding(5)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom("aclonica", size: 18))
                        .bold()
                        .foregroundColor(.black)
                    Text(description)
                        .font(.custom("acme", size: 12))
                        .italic()
                        .foregroundColor(Color("mainText"))
                        .padding(.top, 5)
                }
                .padding(8)
            }
        }
    }
}

struct FoodListItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListItemView(title: "", description: "")
    }
}
