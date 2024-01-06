import SwiftUI

struct ContentView: View {
    @State private var affirmation: String = "Get started by pressing the refresh button!"
    var body: some View {
        NavigationStack() {
            ZStack {
                Color(red: 250/255, green: 242/255, blue: 247/255)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        NavigationLink {
                            MenuView()
                        } label: {
                            Image(systemName:"line.3.horizontal")
                                .frame(width: 50, height: 50)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title2)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading, 10)
                        Spacer()
                        VStack {
                            Text("UpliftMe")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                            Text("Your daily affirmation companion")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                        }
                        Spacer()
                        NavigationLink{
                            AddView()
                        } label: {
                            Image(systemName:"plus")
                                .frame(width: 50, height: 50)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.trailing, 10)
                    }
                    Spacer()
                    Text(affirmation)
                        .onAppear {
                            Task {
                                let (data, _) = try
                                await
                                URLSession.shared
                                    .data(from:
                                            URL(string: "https://www.affirmations.dev")!)
                                let decodedResponse = try? JSONDecoder().decode(Affirmation.self, from: data)
                                affirmation = decodedResponse?.affirmation ?? ""
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
                            //make a call to our affirmation API
                            Task {
                                let (data, _) = try
                                await
                                URLSession.shared
                                    .data(from:
                                            URL(string: "https://www.affirmations.dev")!)
                                let decodedResponse = try? JSONDecoder().decode(Affirmation.self, from: data)
                                affirmation = decodedResponse?.affirmation ?? ""
                            }
                        } label: {
                            //refresh affirmation button
                            Image(systemName:"arrow.clockwise")
                                .frame(width: 50, height: 50)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.leading, 10)
                        Spacer()
                        Button {
                            print("Favorite Button")
                        } label: {
                            //favorite affirmation button
                            Image(systemName: "heart")
                                .frame(width: 50, height: 50)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
        }
    }
}

struct Affirmation: Codable {
    let affirmation: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

