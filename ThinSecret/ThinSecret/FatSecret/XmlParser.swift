import Foundation

class XmlParser: NSObject, XMLParserDelegate {
    private var searchResults: [FoodDetails] = []
    private var currentFoodDetails: FoodDetails?
    private var currentServing: Serving?
    private var currentElement: String?
    private var currentServingElement: String?
    
    func parseFoodSearchResults(xmlData: String) -> [FoodDetails] {
        searchResults = []
        
        if let data = xmlData.data(using: .utf8) {
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        
        return searchResults
    }
    
    func parseFoodDetails(xmlData: String) -> FoodDetails? {
        currentFoodDetails = nil
        
        if let data = xmlData.data(using: .utf8) {
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        
        return currentFoodDetails
    }
    
    private func parseDoubleValue(element: String?) -> Double {
        guard let value = element, let doubleValue = Double(value) else {
            return 0.0
        }
        return doubleValue
    }
    
    private func parseIntValue(element: String?) -> Int {
        guard let value = element, let intValue = Int(value) else {
            return 0
        }
        return intValue
    }
    
    // MARK: - XMLParserDelegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == "food" {
            currentFoodDetails = FoodDetails(foodId: "", foodName: "", brandName: "", foodType: "", foodUrl: "", servings: [])
        } else if elementName == "serving" {
            currentServing = Serving(servingId: "", servingDescription: "", servingUrl: "", metricServingAmount: 0.0, metricServingUnit: "", numberOfUnits: 0.0, measurementDescription: "", calories: 0, carbohydrate: 0.0, protein: 0.0, fat: 0.0, saturatedFat: 0.0, monounsaturatedFat: 0.0, transFat: 0.0, cholesterol: 0, sodium: 0, potassium: 0, fiber: 0.0, sugar: 0.0, calcium: 0, iron: 0)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !trimmedString.isEmpty {
            if currentElement == "food_id" {
                currentFoodDetails?.foodId = trimmedString
            } else if currentElement == "food_name" {
                currentFoodDetails?.foodName = trimmedString
            } else if currentElement == "brand_name" {
                currentFoodDetails?.brandName = trimmedString
            } else if currentElement == "food_type" {
                currentFoodDetails?.foodType = trimmedString
            } else if currentElement == "food_url" {
                currentFoodDetails?.foodUrl = trimmedString
            } else if currentElement == "serving_id" {
                currentServing?.servingId = trimmedString
            } else if currentElement == "serving_description" {
                currentServing?.servingDescription = trimmedString
            } else if currentElement == "serving_url" {
                currentServing?.servingUrl = trimmedString
            } else if currentElement == "metric_serving_amount" {
                currentServing?.metricServingAmount = parseDoubleValue(element: trimmedString)
            } else if currentElement == "metric_serving_unit" {
                currentServing?.metricServingUnit = trimmedString
            } else if currentElement == "number_of_units" {
                currentServing?.numberOfUnits = parseDoubleValue(element: trimmedString)
            } else if currentElement == "measurement_description" {
                currentServing?.measurementDescription = trimmedString
            } else if currentElement == "calories" {
                currentServing?.calories = parseIntValue(element: trimmedString)
            } else if currentElement == "carbohydrate" {
                currentServing?.carbohydrate = parseDoubleValue(element: trimmedString)
            } else if currentElement == "protein" {
                currentServing?.protein = parseDoubleValue(element: trimmedString)
            } else if currentElement == "fat" {
                currentServing?.fat = parseDoubleValue(element: trimmedString)
            } else if currentElement == "saturated_fat" {
                currentServing?.saturatedFat = parseDoubleValue(element: trimmedString)
            } else if currentElement == "monounsaturated_fat" {
                currentServing?.monounsaturatedFat = parseDoubleValue(element: trimmedString)
            } else if currentElement == "trans_fat" {
                currentServing?.transFat = parseDoubleValue(element: trimmedString)
            } else if currentElement == "cholesterol" {
                currentServing?.cholesterol = parseIntValue(element: trimmedString)
            } else if currentElement == "sodium" {
                currentServing?.sodium = parseIntValue(element: trimmedString)
            } else if currentElement == "potassium" {
                currentServing?.potassium = parseIntValue(element: trimmedString)
            } else if currentElement == "fiber" {
                currentServing?.fiber = parseDoubleValue(element: trimmedString)
            } else if currentElement == "sugar" {
                currentServing?.sugar = parseDoubleValue(element: trimmedString)
            } else if currentElement == "calcium" {
                currentServing?.calcium = parseIntValue(element: trimmedString)
            } else if currentElement == "iron" {
                currentServing?.iron = parseIntValue(element: trimmedString)
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "food" {
            if let foodDetails = currentFoodDetails {
                searchResults.append(foodDetails)
                currentFoodDetails = nil
            }
        } else if elementName == "serving" {
            if let serving = currentServing {
                currentFoodDetails?.servings.append(serving)
                currentServing = nil
            }
        }
        
        currentElement = nil
    }
}

// Uso do XmlParser
let xmlString = "<xml>...</xml>"
let xmlParser = XmlParser()
let foodSearchResults = xmlParser.parseFoodSearchResults(xmlData: xmlString)
let foodDetails = xmlParser.parseFoodDetails(xmlData: xmlString)
