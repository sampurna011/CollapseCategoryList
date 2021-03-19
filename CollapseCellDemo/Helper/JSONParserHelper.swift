//
//  JSONParserHelper.swift
//  CollapseCellDemo
//
//  Created by Deepu Mishra on 18/03/21.
//

import Foundation

struct JSONParserHelper {
    static func readLocalFile() -> ListModelData? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "menu",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(ListModelData.self,
                                                           from: jsonData)
                return decodedData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
