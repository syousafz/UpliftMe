//
//  CustomView.swift
//  UpliftMe
//
//  Created by Shabano Yousafzai on 2024-01-09.
//

import SwiftUI

struct CustomView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.text),])
    var affirmations: FetchedResults<Entity>
    @State private var affirmation: String = "You do not currently have any custom affirmations!"
    var body: some View {
        NavigationStack() {
            ZStack{
                Color(red: 242/255, green: 237/255, blue: 228/255)
                    .ignoresSafeArea()
                VStack {
                    HStack{
                        NavigationLink {
                            MenuView()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .frame(width: 45, height: 45)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 10)
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
                        NavigationLink {
                            AddView()
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 45, height: 45)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing, 10)
                        
                        
                    }
                    Spacer()
                    Text(affirmation)
                        .onAppear {
                            Task {
                                if let randomAffirmation = affirmations.randomElement() {
                                    affirmation = randomAffirmation.text ?? "You do not currently have any custom affirmations!"
                                }
                            }
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    HStack{
                        Button {
                            Task {
                                if let randomAffirmation = affirmations.randomElement() {
                                    affirmation = randomAffirmation.text ?? "You do not currently have any custom affirmations!"
                                }
                            }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .frame(width: 45, height: 45)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 10)
                        Spacer()
                        Button {
                            // TODO: remove from your favorites
                            print("Favorite button")
                        } label: {
                            Image(systemName: "heart")
                                .frame(width: 45, height: 45)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    CustomView()
}
