import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategoryIndex: Int = 0
    
    var body: some View {
        VStack {
            Header()
            
            HStack {
                categories
                    .padding(.leading, 30)
                    .animation(.linear(duration: 0.05))
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    Card1()
                    
                    Card2()
                    
                    Card3()
                    
                }
                .padding(.leading, 30)
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                
                Text("Japanese Food")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding(.leading, 30)
                
                
                    HStack (spacing: 20) {
                        CardWithFood1()
                        CardWithFood2()
                        CardWithFood3()
                    }
                    .padding(.leading, 30)
                
            }
            .padding(.top, 30)
        }
    }
    
    private var categories: some View {
        let titles = ["Popular", "Rating", "Recent"]
        
        return ForEach(0..<titles.count, id: \.self) { i in
            CategoryView(title: titles[i], isSelected: .init(get: {self.selectedCategoryIndex == i}, set: { _ in }))
                .onTapGesture { self.selectedCategoryIndex = i }
        }
    }
}

private struct CategoryView: View {
    
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(isSelected ? Color.orange : Color.gray)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 20, height: 6)
                .foregroundColor(Color.orange)
                .opacity(isSelected ? 1 : 0)
                .padding(.top, -3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private struct Header: View {
    var body: some View {
        HStack {
            Text("Discover")
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .padding(.leading, 30)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .font(.system(size: 28, weight: .light))
                .padding(.trailing, 20)
        }
      
    }
}

struct Card1: View {
    var body: some View {
        ZStack {
            Image("Mountain1")
                .resizable()
                .frame(width: 250, height: 350)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Mount Fuji")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                
                Text("Fujinomiya, Japan")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.top, 5)
            }
            .offset(x: -20, y: 120)
        }
    }
}

struct Card2: View {
    var body: some View {
        ZStack {
            Image("Mountain2")
                .resizable()
                .frame(width: 250, height: 350)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Mount Fuji")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                
                Text("Shibuya-ku, Japan")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.top, 5)
            }
            .offset(x: -20, y: 120)
        }
    }
}

struct Card3: View {
    
    var body: some View {
        ZStack {
            Image("Mountain1")
                .resizable()
                .frame(width: 250, height: 350)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Mount Fuji")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                
                Text("Fujinomiya, Japan")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.top, 5)
            }
            .offset(x: -20, y: 120)
        }
    }
}

struct CardWithFood1: View {
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
            }
            .frame(width: 100, height: 140)
            .background(Color(#colorLiteral(red: 0.8443396688, green: 0.8482480645, blue: 0.8577985168, alpha: 1)))
            .cornerRadius(20)
            .shadow(color: Color(.black).opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: 8)
            
            VStack {
                Image("Sushi1")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Sushi")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.top, 10)
            }
            .frame(width: 100, height: 140)
            .background(Color.white)
            .cornerRadius(20)
            
        }
    }
}

struct CardWithFood2: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(#colorLiteral(red: 0.8901960784, green: 0.8823529412, blue: 0.8941176471, alpha: 1)))
            VStack {
                Image("Roman")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                Text("Romen")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.top, 9)
            }
            
        }
        .frame(width: 110, height: 140)
    }
}

struct CardWithFood3: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(#colorLiteral(red: 0.8901960784, green: 0.8823529412, blue: 0.8941176471, alpha: 1)))
            VStack {
                Image("Sushi2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                
                Text("Sushi")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.top, 9)
            }
            
        }
        .frame(width: 110, height: 140)
    }
}
