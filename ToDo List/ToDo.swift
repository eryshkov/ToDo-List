//
//  ToDo.swift
//  ToDo List
//
//  Created by Evgeniy Ryshkov on 22/10/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        return [
            ToDo(title: "Дело 1", isComplete: false, dueDate: Date(), notes: "Заметка 1"),
            ToDo(title: "Дело 2", isComplete: false, dueDate: Date(), notes: "Заметка 2"),
            ToDo(title: "Дело 3", isComplete: false, dueDate: Date(), notes: "Заметка 3"),
            ToDo(title: "Дело 4", isComplete: false, dueDate: Date(), notes: "Заметка 4"),
        ]
    }
}
