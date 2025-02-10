//
//  SmallProductCard.swift
//  Ecommerce
//
//  Created by Celestial on 05/02/25.
//

import SwiftUI

struct SmallProductCard: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product : ProductModel
    
    var body: some View {
        
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack{
                VStack(alignment:.leading){
                    Text("\(product.name)")
                        .font(.system(size: 18,weight: .semibold))
                        .frame(width: 70)
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height:40)
                                .background(Color.black)
                                .clipShape(Capsule())
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding(.trailing,-12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                }
            }
            .padding(20)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(Color(product.colorValue).opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading,10)
    }
}
