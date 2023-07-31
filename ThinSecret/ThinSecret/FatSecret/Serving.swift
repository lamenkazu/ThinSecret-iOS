import Foundation

struct Serving {
    var servingId: String
    var servingDescription: String
    var servingUrl: String
    var metricServingAmount: Double
    var metricServingUnit: String
    var numberOfUnits: Double
    var measurementDescription: String
    var calories: Int
    var carbohydrate: Double
    var protein: Double
    var fat: Double
    var saturatedFat: Double
    var monounsaturatedFat: Double
    var transFat: Double
    var cholesterol: Int
    var sodium: Int
    var potassium: Int
    var fiber: Double
    var sugar: Double
    var calcium: Int
    var iron: Int
    
    func servingToString() -> String {
        return """
        Serving{
            servingId: \(servingId)
            servingDescription: \(servingDescription)
            servingUrl: \(servingUrl)
            metricServingAmount: \(metricServingAmount)
            metricServingUnit: \(metricServingUnit)
            numberOfUnits: \(numberOfUnits)
            measurementDescription: \(measurementDescription)
            calories: \(calories)
            carbohydrate: \(carbohydrate)
            protein: \(protein)
            fat: \(fat)
            saturatedFat: \(saturatedFat)
            monounsaturatedFat: \(monounsaturatedFat)
            transFat: \(transFat)
            cholesterol: \(cholesterol)
            sodium: \(sodium)
            potassium: \(potassium)
            fiber: \(fiber)
            sugar: \(sugar)
            calcium: \(calcium)
            iron: \(iron)
        }
        """
    }
}

extension Serving: CustomStringConvertible {
    var description: String {
        return servingToString()
    }
}
