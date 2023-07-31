//
//  FoodSearchView.swift
//  ThinSecret
//
//  Created by coltec on 28/06/23.
//

import SwiftUI

struct FoodSearchView: View {
    var title: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .frame(height: 60)
                VStack {
                    Text(title)
                        .font(.system(size: 21))
                        .padding(10)
                }
            }
        }
    }
}
struct FoodSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearchView(title: "")
    }
}
