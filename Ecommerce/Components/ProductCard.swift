//
//  ProductCard.swift
//  Ecommerce
//
//  Created by Celestial on 05/02/25.
//

import SwiftUI

// Product Card View
struct ProductCard: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: ProductModel
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .padding(.trailing, -100)
                .rotationEffect(Angle(degrees: 36))
            
            VStack(alignment: .leading) {
                Text("\(product.name)")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 140)
                
                Text(product.category)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Text("$\(product.price).0")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 90, height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundStyle(.white)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.8))
                .clipShape(Capsule())
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .padding(30)
        .frame(width: 330, height: 422)
        .background(Color(product.colorValue).opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}

