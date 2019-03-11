//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum ChessFiguresColor : String {
    case Black = "Black"
    case White = "White"
}

enum ChessFigures {
    case Korol(color: ChessFiguresColor, column: String, row: Int)
    case Ferz(color: ChessFiguresColor, column: String, row: Int)
    case Tura(color: ChessFiguresColor, column: String, row: Int)
    case Kon(color: ChessFiguresColor, column: String, row: Int)
    case Slon(color: ChessFiguresColor, column: String, row: Int)
    case Peshka(color: ChessFiguresColor, column: String, row: Int)
}

var blackKorol = ChessFigures.Korol(color: .Black, column: "F", row: 8)
var whiteKorol = ChessFigures.Korol(color: .White, column: "B", row: 1)
var whiteTura = ChessFigures.Tura(color: .White, column: "D", row: 8)
var whiteTura2 = ChessFigures.Tura(color: .White, column: "D", row: 7)

var chessFiguresArray = [blackKorol, whiteKorol, whiteTura, whiteTura2]
//print(chessFiguresArray)

//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название.
// Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
enum figureNames : String {
    case Korol = "King"
    case Ferz = "Queen"
    case Tura = "Rook"
    case Kon = "Knight"
    case Slon = "Bishop"
    case Peshka = "Pawn"
}
//print(chessFiguresArray[0])
/*
func printFiguresArray(figuresArray: [ChessFigures]) {
    for figure in figuresArray {
        switch figure {
        case .Ferz(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Ferz.rawValue) at \(column)\(row)")
        case .Korol(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Korol.rawValue) at \(column)\(row)")
        case .Tura(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Tura.rawValue) at \(column)\(row)")
        case .Kon(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Kon.rawValue) at \(column)\(row)")
        case .Slon(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Slon.rawValue) at \(column)\(row)")
        case .Peshka(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Peshka.rawValue) at \(column)\(row)")
        }
    }
}
 */
//func printAllFigures(figuresArray: [ChessFigures]) {
//    for i in figuresArray {
//        print(i)
//        switch i {
//        case .Korol(color: let color, column: let column, row: let row):
//            print("\(color) \(figureNames.Korol.rawValue) \(column)\(row)")
//
//        case .Tura(color: let color, column: let column, row: let row):
//            print("\(color) \(figureNames.Tura.rawValue) \(column)\(row)")
//        default: break
//        }
//    }
//}

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

func printFiguresArray(figuresArray: [ChessFigures], chessFiguresArray: [ChessFigures]) {
    var tuple : (color: ChessFiguresColor, column: String,row: Int)  = (.Black , " ", 0)
    var columnsArray = [String]()
    var rowsArray = [Int]()
    var columnsDict = [String : String]()
    
    func coord(figure: ChessFigures) -> (coords: String, color: String, name: String) {
        
        switch figure {
        case .Korol(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Korol.rawValue) at \(column)\(row)")
            
            if color == .White {
                columnsDict["WhiteKing"] = column
                print("white")
                columnsArray.append(column)
            }
            else if color == .Black{
                columnsDict["BlackKing"] = column
                columnsArray.append(column)
                print("black")
            }
            return (column + String(row), color.rawValue, figureNames.Korol.rawValue)
            
        case .Tura(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Tura.rawValue) at \(column)\(row)")
            return (column + String(row), color.rawValue, figureNames.Tura.rawValue)
            
            //            if color == .White {
//                columnsDict["WhiteRook"] = column
//                columnsArray.append(column)
//            }
//            else if color == .Black{
//                columnsDict["BlackRook"] = column
//                columnsArray.append(column)
//            }
            
        case .Ferz(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Ferz.rawValue) at \(column)\(row)")
            return (column + String(row), color.rawValue, figureNames.Korol.rawValue)

//            if color == .White {
//                columnsDict["WhiteQueen"] = column
//                columnsArray.append(column)
//            }
//            else if color == .Black{
//                columnsDict["BlackQueen"] = column
//                columnsArray.append(column)
//            }
            
        case .Kon(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Kon.rawValue) at \(column)\(row)")
            return (column + String(row), color.rawValue, figureNames.Korol.rawValue)

//            if color == .White {
//                columnsDict["WhiteKnight"] = column
//                columnsArray.append(column)
//            }
//            else if color == .Black{
//                columnsDict["BlackKnight"] = column
//                columnsArray.append(column)
//            }
            
        case .Slon(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Slon.rawValue) at \(column)\(row)")
            return (column + String(row), color.rawValue, figureNames.Korol.rawValue)

//            if color == .White {
//                columnsDict["WhiteBishop"] = column
//                columnsArray.append(column)
//            }
//            else if color == .Black{
//                columnsDict["BlackBishop"] = column
//                columnsArray.append(column)
//            }
            
        case .Peshka(color: let color, column: let column, row: let row):
            print("\(color) \(figureNames.Peshka.rawValue) at \(column)\(row)")
            return (column + String(row), color.rawValue, figureNames.Korol.rawValue)

//            if color == .White {
//                columnsDict["WhitePawn"] = column
//                columnsArray.append(column)
//            }
//            else if color == .Black{
//                columnsDict["BlackPawn"] = column
//                columnsArray.append(column)
//            }
        }
    }
    
    
    let black = "\u{2b1b}"
    let white = "\u{2b1c}"
    let blackKing = "♚"
    let whiteKing = "♔"
    let whiteRook = "♖"
    let whiteRook2 = "♖"

    let row = ["A","B","C","D","E","F","G","H"]
    var keyValueDictionary = [String:String]()
    
    ///////////////////// chessboard + figures \\\\\\\\\\\\\\\\\\\\\\
    
    for r in stride(from: row.count, to: 0, by: -1) {
        print(r, terminator: " ")
        
        for (var key,value) in row.enumerated() {
            key += 1

            if key == 4 && r == 7 {
                print(whiteRook2, terminator: " ")
                keyValueDictionary[String(r) + value] = whiteRook2
                
            } else if key == 4 && r == 8 {
                print(whiteRook, terminator: " ")
                keyValueDictionary[String(r) + value] = whiteRook
                
            } else if key == 2 && r == 1 {
                print(whiteKing, terminator: " ")
                keyValueDictionary[String(r) + value] = whiteKing
                
            } else if key == 8 && r == 8 {
                print(blackKing, terminator: " ")
                keyValueDictionary[String(r) + value] = blackKing
                
            } else if key % 2 == r % 2 {
                print(black, terminator: " ")
                keyValueDictionary[String(r) + value] = black
                
            } else {
                print(white, terminator: " ")
                keyValueDictionary[String(r) + value] = white
            }
        }
        print("")
    }
}


printFiguresArray(figuresArray: chessFiguresArray, chessFiguresArray: [])

























//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

