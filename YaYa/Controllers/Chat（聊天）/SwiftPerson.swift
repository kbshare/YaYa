//
//  SwiftPerson.swift
//  YaYa
//
//  Created by a58 on 2022/1/17.
//  Copyright © 2022 zyw. All rights reserved.
//

import Foundation

class SwiftPerson : NSObject{
    @objc func getPersonName() -> (String){
        return "swift person name"
    }
}

func swiftTestFunc(_ nickName: String) -> String {
    return nickName + "sssssssss"
}
