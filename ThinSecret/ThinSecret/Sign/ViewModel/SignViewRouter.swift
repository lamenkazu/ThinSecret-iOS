//
//  SignViewRouter.swift
//  ThinSecret
//
//  Created by coltec on 29/06/23.
//

import Foundation
import SwiftUI

enum SignViewRouter {
    static func makeInitSignUpView() -> some View {
        return InitSignUpView()
    }
    
    static func makeHomeScreen() -> some View {
        return HomeView()
    }
}
