//
//  CollectionView.swift
//  Ecommerce
//
//  Created by Celestial on 03/02/25.
//

import SwiftUI

//MARK: Cart Code

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.dismiss) var dismiss
    
    @State var payment: Bool = false
    
    var body: some View {
        NavigationStack{
            
            ScrollView(showsIndicators:false){
                VStack{
                    //Navigation
                    HStack{
                        Text("Cart")
                            .font(.system(size: 36))
                            .padding(.trailing)
                       
                        
                        Spacer()
                    
                        Button{
                            cartManager.products.removeAll()
                            cartManager.total = 0
                        }label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height:90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundStyle(Color.black)
                        
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70,height:90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundStyle(Color.black)

                    }
                    .padding(30)
                    
                    
                    //MARK: Cart Products
                    //Showing all the selected product on cart
                    
                    VStack(spacing:20){
                        ForEach(cartManager.products,id: \.id){item in
                            
                            CartProductCard(product: item)
                                .onTapGesture {
                                    if let index = cartManager.products.firstIndex(where: { $0.id == item.id }) {
                                        cartManager.products.remove(at: index)
                                        cartManager.total -= item.price
                                    }
                                }

                            
                        }
                    }.padding(.horizontal)
                    
                    //MARK: After Purchase Text
                    if payment{
                        HStack{
                            Text("Thank You For Purchasing from our App We hope you have wonderfull experience.")
                                .font(.title3)
                                .fontWeight(.light)
                                .fontDesign(.rounded)
                        }
                        .padding()
                    }
                   
                    
                    //MARK: Total Amount
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Delivery Amount")
                            Spacer()
                            Text("Free")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        Divider()
                        Text("Total Amount")
                            .font(.system(size: 24))
                        Text("USD \(cartManager.total)")
                            .font(.system(size: 36, weight: .semibold))
                        
                    }.padding(30)
                        .frame(maxWidth: .infinity)
                        .background(.yellow.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 30))
                        .padding()
                    
                    //MARK: Payment
                    //Button to make payment or buy product
                    
                    Button{
                        if cartManager.products.count == 0{
                            // No Product
                        }else{
                            
                            cartManager.products.removeAll()
                            cartManager.total = 0
                            payment = true
                        }
                            
                    }label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}


