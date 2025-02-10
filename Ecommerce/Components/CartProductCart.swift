//
//  CartProductCart.swift
//  Ecommerce
//
//  Created by Celestial on 05/02/25.
//

import SwiftUI

//cart product view
struct CartProductCard: View {
    
    
    var product : ProductModel
    var body: some View {
        HStack(alignment:.center, spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text("\(product.name)")
                    .font(.headline)
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            }
            Spacer()
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
