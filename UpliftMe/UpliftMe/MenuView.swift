//
//  MenuView.swift
//  UpliftMe
//
//  Created by Shabano Yousafzai on 2024-01-06.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var BackButton : some View { Button(action:{
        self.presentationMode.wrappedValue.dismiss()
    }) { 
        Image(systemName:"house")
            .frame(width: 50, height: 50)
            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
            .clipShape(Circle())
            .font(.title3)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(.top, 10)
            }
        }
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 242/255, blue: 247/255)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true).navigationBarItems(leading: BackButton)
    }
}
    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }

