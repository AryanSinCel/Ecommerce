import SwiftUI

//MARK: Home Code
// Home.swift

struct Home: View {
    @State private var selectedCategory = "All"
    @Namespace private var categoryAnimation
    @EnvironmentObject var cartManager: CartManager
    @State var showSideMenu: Bool = false
    @Binding var showCart: Bool
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        //MARK: Navigation Title
                        
                        HStack {
                            Text("Order From the Best of **Snacks**")
                                .font(.system(size: 36))
                                .padding(.trailing)
                            
                            Spacer()
                            
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showSideMenu.toggle()
                                        showCart = false
                                    }
                                }
                        }
                        .padding(30)

                        //MARK: Category List
                        
                        categoryListView
                        
                        //MARK: Product Collection
                        
                        HStack {
                            Text("Cookies **Collections**")
                                .font(.system(size: 24))
                            Spacer()
                            NavigationLink(destination:
                                CollectionView()
                                    .environmentObject(cartManager)
                            ) {
                                Image(systemName: "arrow.right")
                                    .imageScale(.large)
                            }
                            .foregroundStyle(Color.black)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(filteredProducts, id: \.id) { item in
                                    ProductCard(product: item)
                                        .transition(.opacity.combined(with: .scale))
                                        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: selectedCategory)
                                }
                            }
                        }
                    }
                }
            }
            .blur(radius: showSideMenu ? 8 : 0)
            
            //For showing sidemenu
            //MARK: SideMenu
            if showSideMenu {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showSideMenu.toggle()
//                            showCart = true
                        }
                    }
            }
            
            SideMenuView(showSideMenu: $showSideMenu, showKart: $showCart)
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.3), value: showSideMenu)
        }
    }
    
    //For filtering of product
    var filteredProducts: [ProductModel] {
        productList.filter { product in
            selectedCategory == "All" || product.category == selectedCategory
        }
    }
    
    //Category list
    var categoryListView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categoryList, id: \.id) { item in
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            selectedCategory = item.title
                        }
                    } label: {
                        HStack {
                            if item.title != "All" {
                                Image(item.icon)
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(selectedCategory == item.title ? Color.yellow : Color.black)
                            }
                            Text(item.title)
                                .matchedGeometryEffect(id: item.title, in: categoryAnimation)
                        }
                        .padding(20)
                        .background(
                            selectedCategory == item.title
                                ? Color.black
                                : Color.gray.opacity(0.1)
                        )
                        .foregroundStyle(selectedCategory != item.title ? .black : .white)
                        .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}


#Preview {
    Home(showCart: .constant(true))
        .environmentObject(CartManager())
}
