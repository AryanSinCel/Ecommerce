import SwiftUI

//MARK: ContentView.swift

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State var showCart: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                //MARK: Home Screen
                Home(showCart: $showCart)
                    .environmentObject(cartManager)
                
                //MARK: Cart View
                if cartManager.products.count > 0 {
                    if(showCart){
                        ExtractedView()
                            .environmentObject(cartManager)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}


struct ExtractedView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
            NavigationLink(destination:
                CartView()
                    .environmentObject(cartManager)
            ) {
                HStack(spacing: 30) {
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundStyle(Color.black)
                    
                    VStack(alignment: .leading) {
                        Text("Cart")
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("\(cartManager.products.count) Item\(cartManager.products.count > 1 ? "s" : "")")
                            .font(.system(size: 26))
                    }
                    Spacer()
                    
                    ForEach(cartManager.products.prefix(5), id: \.id) { product in
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.leading, -60)
                    }
                }
                .padding(30)
                .frame(height: 120)
                .background(.black)
                .clipShape(.rect(topLeadingRadius: 60, topTrailingRadius: 60))
                .foregroundStyle(Color.white)
            }
    }
}
