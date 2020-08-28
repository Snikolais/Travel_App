import SwiftUI


struct ContentView: View {
    
    @State private var selectedCategoryIndex: Int = 0
    @State private var selectedCardIndex: Int = 0
    @State private var selectedCardWithFoodIndex: Int = 0
    
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
                    
                    cards
                }
                .padding(.leading, 30)
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                
                Text("Japanese Food")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding(.leading, 30)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                            
                           cardsWithFood
                        }
                    .padding(.leading, 30)
                    .padding(.bottom, 60)
                }
                
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
    
    private var cards: some View {
        let cards = [["Mountain1", "Mount Fuji", "Fujinomiya, Japan"],
                    ["Mountain2", "Mount Fuji", "Shibuya-ku, Japan"],
                    [ "Mountain1", "Mount Fuji", "Fujinomiya, Japan"]]
        
        
        
        return ForEach(0..<cards.count, id: \.self) { info in
            CardView(imageName: cards[info][0], name: cards[info][1], someInfo: cards[info][2], isSelected: .init(get:
                               {self.selectedCardIndex == info}, set: {_ in}))
                .onTapGesture(perform: {self.selectedCardIndex = info})

            
        }
    }
    
    private var cardsWithFood: some View {
        let cards = [["Sushi1", "Sushi"],
                     ["Roman", "Roman"],
                     ["Sushi2", "Sushi"]]
        
        return ForEach(0..<cards.count, id: \.self) {info in
            CardWithFoodView(imageName: cards[info][0], nameFood: cards[info][1], isSelected: .init(get: {self.selectedCardWithFoodIndex == info}, set: {_ in}))
                .onTapGesture(perform: {self.selectedCardWithFoodIndex = info})
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

struct CardView: View  {
    
    let imageName: String
    let name: String
    let someInfo: String
    
    @Binding var isSelected: Bool
    
     var body: some View {
           ZStack {
               Image(imageName)
                   .resizable()
                   .frame(width: 250, height: 350)
                   .cornerRadius(20)
                .opacity(!isSelected ? 0.5 : 1)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 5)
                    .opacity(!isSelected ? 0 : 1))
                
               VStack(alignment: .leading) {
                    Text(name)
                       .foregroundColor(Color.white)
                       .font(.system(size: 22, weight: .bold, design: .rounded))
                   
                    Text(someInfo)
                       .foregroundColor(.white)
                       .font(.system(size: 16, weight: .medium, design: .rounded))
                       .padding(.top, 5)
                
               }
               .offset(x: -20, y: 120)
            
           }
           .frame(width: 255, height: 355)
           
       }
}


struct CardWithFoodView: View {
    
    let imageName: String
    let nameFood: String
    
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
            }
            .frame(width: 100, height: 140)
            .background(Color("ShadowColorForCardWithFood"))
            .cornerRadius(20)
            .shadow(color: Color(.black).opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: 8)
            .opacity(isSelected ? 1 : 0)
            
            VStack {
                
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(30)
                Text(nameFood)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.top, 10)
            }
            .frame(width: 100, height: 140)
            .background(Color.white)
            .cornerRadius(20)
            
        }
        

    }
}

