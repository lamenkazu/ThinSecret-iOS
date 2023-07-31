import Foundation

struct BodyInfo {
    enum DietType {
        case lowCarb
        case midCarb
        case highCarb
    }

    enum ActLevel {
        case sedentary
        case lowActive
        case active
        case highActive
        case extremeActive

        var metBasal: Double {
            switch self {
            case .sedentary:
                return 1.2
            case .lowActive:
                return 1.375
            case .active:
                return 1.55
            case .highActive:
                return 1.725
            case .extremeActive:
                return 1.9
            }
        }
    }

    enum DietGoal {
        case loss
        case keep
        case gain

        var stringGoal: String {
            switch self {
            case .loss:
                return "Perder Peso"
            case .keep:
                return "Manter Peso"
            case .gain:
                return "Ganhar Peso"
            }
        }
    }

    enum Sex {
        case masculino
        case feminino
        case nulo
    }

    var age: Int?
    var weight: Int?
    var height: Int?
    var gender: Sex?
    var goal: DietGoal?
    var actLevel: ActLevel?
    var diet: DietType?
    var IMC: Double?
    var IDR: Double?
}
