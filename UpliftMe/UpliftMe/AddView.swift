//
//  AddView.swift
//  UpliftMe
//
//  Created by Shabano Yousafzai on 2024-01-06.
//

import SwiftUI

struct AddView: View {
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "house")
                .frame(width: 45, height: 45)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(Circle())
                .font(.title3)
                .foregroundColor(Color.white)
                .padding(.leading, 10)
        }
    }
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var favorite = false
    @State var newAffirmation = ""
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 237/255, blue: 228/255)
                .ignoresSafeArea()
            VStack{
                HStack{
                    backButton
                    Spacer()
                    VStack {
                        Text("UpliftMe")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                        Text("daily affirmation companion")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    }
                    Spacer()
                    Button {
                        favorite.toggle()
                    } label: {
                        Image(systemName: favorite ? "heart.fill" : "heart")
                            .frame(width: 45, height: 45)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)
                }
                Spacer()
                TextField("Enter your new affirmation...", text: $newAffirmation, axis: .vertical)
                  .multilineTextAlignment(.center)
                  .font(.title2)
                  .fontWeight(.bold)
                  .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                  .padding()
                  .lineLimit(3, reservesSpace: true)
                Button {
                    let favAffirmation = Entity(context: managedObjectContext)
                    favAffirmation.text = newAffirmation
                    favAffirmation.isFavorite = favorite
                    favAffirmation.isCustom = true
                    PersistenceController.shared.save()
                } label: {
                    Image(systemName: "plus")
                    Text("Save Affirmation")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
