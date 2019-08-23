import UIKit

struct Quote{
    var quote: String!
    var author: String!
}

class Quotes{
    var collection = [
        Quote(quote: "Don't be afraid to give up the good to go for the great.", author: "John D. Rockefeller")
        ,Quote(quote: "Work hard in silence, let your success be your noise.", author: "Frank Ocean"
        )]
    
    
    func PickQuote(displayQuote: UILabel, displayAuthor: UILabel){
        
        var pickedRandomQuote = Int()
        
        pickedRandomQuote = Int.random(in: 0..<collection.count)
        
        displayQuote.text = collection[pickedRandomQuote].quote
        
        displayAuthor.text = "-" + collection[pickedRandomQuote].author
        
    }
}



