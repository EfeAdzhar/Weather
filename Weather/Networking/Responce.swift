//
//  Responses.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import OrderedCollections

final class Responce {
    
    private final let response: OrderedDictionary = [
        200: "OK",
        403: "Forbidden",
        404: "Not Found",
    ]
    
    public func responseStatus(_ status : Int) -> String? {
        var iterator = response.makeIterator()
        if(iterator.next()?.key == status) {
            return response[status]
        }
        return nil
    }
}
