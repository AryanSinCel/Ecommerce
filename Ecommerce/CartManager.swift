import SwiftUI

class CartManager: ObservableObject {
    @Published var products: [ProductModel] = [] { // Array of product item in cart
        didSet {
            saveCartData()
        }
    }
    
    @Published var total: Int = 0 // Total amount for purchase
    
    init() {
        loadCartData()
    }
    
    // Function to add product to cart
    func addToCart(product: ProductModel) {
        products.append(product)
        total += product.price
    }
    
    // Function to remove product from cart
    func removeFromCart(product: ProductModel) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    // Function to save cart to UserDefaults
    func saveCartData() {
        if let encoded = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encoded, forKey: "cartData")
        }
    }
    
    // Function to get data from UserDefaults
    func loadCartData() {
        if let savedData = UserDefaults.standard.data(forKey: "cartData") {
            if let decodedData = try? JSONDecoder().decode([ProductModel].self, from: savedData) {
                products = decodedData
                calculateTotal()
            }
        }
    }
    
    // Function to calculate the total price based on the products in the cart
    func calculateTotal() {
        total = products.reduce(0) { $0 + $1.price }
    }
    
    
}
