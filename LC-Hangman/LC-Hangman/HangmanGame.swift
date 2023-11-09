import Foundation

struct HangmanGame {
    var word: String
    var attempedLetters: Set<Character> = []
    var maxAttempts: Int
    var currentAttempts: Int = 0
    
    var maskedWord: String {
        var result = ""
        for letter in word {
            if attempedLetters.contains(letter) {
                result.append(letter)
            } else {
                result.append(" _ ")
            }
        }
        return result
    }
    
    var status: GameStatus {
        if maskedWord == word {
            return .won
        } else if currentAttempts >= maxAttempts {
            return .lost
        } else {
            return .ongoing
        }
    }
    
    init(word: String, maxAttemps: Int) {
        self.word = word.uppercased()
        self.maxAttempts = maxAttemps
    }
    
    mutating func guess(letter: Character) {
        let uppercasedLetter = letter.uppercased().first!
        if !attempedLetters.contains(uppercasedLetter) {
            attempedLetters.insert(uppercasedLetter)
            
            if !word.contains(uppercasedLetter) {
                currentAttempts += 1
            }
        }
    }
}
