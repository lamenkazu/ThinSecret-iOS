import Foundation

struct FoodDetails : Identifiable{
    var id: UUID = UUID()
    var foodId: String
    var foodName: String
    var brandName: String
    var foodType: String
    var foodUrl: String
    var servings: [Serving]
    
    func foodToString() -> String {
        return """
        FoodDetails{
            foodId: \(foodId)
            foodName: \(foodName)
            brandName: \(brandName)
            foodType: \(foodType)
            foodUrl: \(foodUrl)
            servings: \(servings)
        }
        """
    }
}

extension FoodDetails: CustomStringConvertible {
    var description: String {
        return foodToString()
    }
}
