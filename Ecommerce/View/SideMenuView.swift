import SwiftUI


//MARK: SideMenu Code
// SideMenuView.swift
struct SideMenuView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var cartManager: CartManager
    @Binding var showKart:Bool
    var body: some View {
        ZStack {
            Color.pink.opacity(0.7)
                .frame(width: 266)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            VStack {
                UserImage(showSideMenu: $showSideMenu, showCart: $showKart)
                
                Button {
                    // Log Out functionality
                } label: {
                    Image(systemName: "power")
                        .fontWidth(.standard)
                    Text("Logout")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(Color.white)
                .padding()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .offset(x: showSideMenu ? 0 : 300)
        .opacity(showSideMenu ? 1 : 0)
        .animation(.easeInOut(duration: 0.3), value: showSideMenu)
    }
}

//MARK: UserImage Code
// UserImage.swift
struct UserImage: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var cartManager: CartManager
    @Binding var showCart: Bool
    var body: some View {
        VStack(alignment: .trailing) {
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showSideMenu.toggle()
                    showCart = true
                }
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 60, height: 80)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(1))
                    .padding(.top, 80)
                    .foregroundStyle(Color.white)
            }

            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 75, height: 75)
                        .foregroundStyle(Color.white)

                    VStack {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 100, height: 14)
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 80, height: 7)
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 52, height: 7)
                            .opacity(0.5)
                    }
                }
                .frame(maxWidth: 200)
                .foregroundStyle(Color.white)
                .padding(.top, 60)
                .padding(.bottom, 50)


                NavigationLink(destination: CartView().environmentObject(cartManager)) {
                    HStack {
                        Image(systemName: "cart")
                            .font(.title)
                        Text("Your Cart")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding()
                }
                .foregroundStyle(Color.white)

                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SideMenuView(showSideMenu: .constant(true), showKart: .constant(false))
        .environmentObject(CartManager()) // Ensure CartManager is always present
}
