//
//  CollectionView.swift
//  Ecommerce
//
//  Created by Celestial on 03/02/25.
//

import SwiftUI

//MARK: Collection of Products

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            
            ScrollView(showsIndicators:false){
                VStack{
                    
                    //MARK: Navigation
                    
                    HStack{
                        Text("Order From The Best of **Snacks**")
                            .font(.system(size: 36))
                            .padding(.trailing)
                        
                        
                        
                        Spacer()
                    
                        
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

                    }    .padding(30)
                    
                    
                    //MARK: Product List
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(productList,id: \.id){item in
                                SmallProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
        
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}

