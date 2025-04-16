//
//  TodoListView.swift
//  TodoApp
//
//  Created by hanabi on 2025/04/07.
//

import SwiftUI

struct ToDoItem {
     var isChecked: Bool
     var task: String
 }

struct TodoListView: View {
    
    @State var newTask: String = ""
    // tuple型の配列を作る
//   var todoLists: [(isChecked: Bool, task: String)] = [
//       (isChecked: false, task: "読書する"),
//       (isChecked: true, task: "掃除する"),
//      (isChecked: false, task: "散歩する")
       @State var todoLists: [ToDoItem] = [
              ToDoItem(isChecked: false, task: "読書する"),
              ToDoItem(isChecked: true, task: "掃除する"),
              ToDoItem(isChecked: false, task: "散歩する")
   ]
    
    var body: some View {
        VStack {
                   Text("ToDoList")
                       .font(.system(size: 30, weight: .bold, design: .default))
            HStack {
                           TextField("タスクを入力してください", text: $newTask)
                               .textFieldStyle(.roundedBorder)
                               .padding(EdgeInsets(
                                   top: 10,
                                   leading: 20,
                                   bottom: 10,
                                   trailing: 15
                               ))
                Button("追加", action: {
                    if !newTask.isEmpty {
                        todoLists.append(
                            ToDoItem(isChecked: false, task: newTask)
                        )
                    }
                        newTask = ""
                    })
                        .padding(.trailing, 20)
                
                      }
                   ForEach(todoLists.indices, id: \.self) { index in
                      HStack {
                          Button(action: {
                                                 todoLists[index].isChecked.toggle()
                              
                          }, label: {
                              Image(systemName:
                                        todoLists[index].isChecked ? "checkmark.square" : "square"
                              )
                          })
                          todoLists[index].isChecked ? Text(todoLists[index].task).strikethrough(true, color: .red) : Text(todoLists[index].task)
                       }
                       .padding(.top, 1)
                       .padding(.leading, 20)
                       .frame(maxWidth: .infinity, alignment: .leading)
                   }
               }

               Spacer()
    }
    }
