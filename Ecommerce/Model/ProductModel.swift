import SwiftUI

// Updated ProductModel with Codable support for Color using String
struct ProductModel: Identifiable, Codable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: String // Storing color as a string
    var price: Int
    
    // Computed property to convert the color string back to Color
    var colorValue: Color {
        switch color {
        case "pink": return .pink
        case "yellow": return .yellow
        case "orange": return .orange
        case "green": return .green
        case "purple": return .purple
        case "red": return .red
        case "blue": return .blue
        case "brown": return .brown
        default: return .black // Default color if no match
        }
    }
}

// Sample Products
var productList = [
    ProductModel(name: "Good Source", category: "Cookies", image: "Good Source", color: "pink", price: 8),
    ProductModel(name: "Unreal Muffins", category: "Cookies", image: "Unreal Muffins", color: "yellow", price: 8),
    ProductModel(name: "Dairy Milk", category: "Chocolates", image: "Dairy Milk", color: "yellow", price: 8),
    ProductModel(name: "Eclaire", category: "Toffees", image: "Eclaire", color: "orange", price: 5),
    ProductModel(name: "Skittles", category: "Chocolates", image: "Skittles", color: "green", price: 9),
    ProductModel(name: "Kitkat", category: "Chocolates", image: "Kitkat", color: "yellow", price: 10),
    ProductModel(name: "Unstopped", category: "Waffles", image: "Unstopped", color: "pink", price: 12),
    ProductModel(name: "Waffle Crisp", category: "Waffles", image: "Waffle Crisp", color: "orange", price: 6),
    ProductModel(name: "Pocky", category: "Chocolates", image: "Pocky", color: "purple", price: 10),
    ProductModel(name: "Grandma Mini Chocolate Chip", category: "Cookies", image: "Grandma", color: "yellow", price: 12),
    ProductModel(name: "Waffle Amour", category: "Waffles", image: "Waffle Amour", color: "pink", price: 9),
    ProductModel(name: "My BonBon", category: "Toffees", image: "My BonBon", color: "orange", price: 15),
    ProductModel(name: "Kisses", category: "Chocolates", image: "Kisses", color: "red", price: 5),
    ProductModel(name: "Twister Chips", category: "Chips", image: "Twister", color: "green", price: 8),
    ProductModel(name: "Twister Chips", category: "Chips", image: "Twister Chipster", color: "red", price: 8),
    ProductModel(name: "Chips Nature", category: "Chips", image: "Chips Nature", color: "blue", price: 8),
    ProductModel(name: "Dark Russet", category: "Chips", image: "Kettle", color: "brown", price: 8),
    ProductModel(name: "Smiths Chips", category: "Chips", image: "Smiths", color: "orange", price: 8),
    ProductModel(name: "Deep River", category: "Chips", image: "Deep River", color: "purple", price: 8),
    ProductModel(name: "Pure Burst", category: "Toffees", image: "Pure Burst", color: "red", price: 5)
]
