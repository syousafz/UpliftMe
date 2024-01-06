import SwiftUI

struct ContentView: View {
    @State private var affirmation: String = "Get started by pressing the refresh button!"
    var body: some View {
        ZStack {
            Color(red: 250/255, green: 242/255, blue: 247/255)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                        //view menu button
                        print("Button")
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
                    Button {
                        //add affirmation button
                        print("Button")
                    } label: {
                        Image(systemName:"plus")
                            .frame(width: 50, height: 50)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title2)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.trailing, 10)
                }
                Spacer()
                Text(affirmation)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    .multilineTextAlignment(.center)
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
                            affirmation = decodedResponse?.value ?? ""
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
                        print("Button")
                    } label: {
                        //favorite affirmation button
                        Text("💗")
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

struct Affirmation: Codable {
    let value: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

