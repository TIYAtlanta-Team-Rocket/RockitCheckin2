

import Foundation

enum ParseReturnValue {
    case Success(Any)
    case Failure(Error)
}

class JSONParser {
    static func JSONDataToDictionary(data: Data) -> ParseReturnValue {
        let newData: [String: AnyObject]
        do {
            newData = try (JSONSerialization.jsonObject(with: data, options: []) as! [String : AnyObject])
        } catch let thrownerror {
            return ParseReturnValue.Failure(thrownerror)
        }
        return .Success(newData)
    }
    
    static func JSONDataToArray(data: Data) -> ParseReturnValue {
        let newData: [AnyObject]
        do {
            newData = try JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
        } catch let thrownerror {
            return .Failure(thrownerror)
        }
        return .Success(newData)
    }
    
}
