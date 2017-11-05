// The goal of this exercise is to convert a string to a new string where each character in the new string is '(' if that character appears only once in the original string, or ')' if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.
//
// Examples:
// "din" => "((("
// "recede" => "()()()"
// "Success" => ")())())"
// "(( @" => "))(("

function duplicateEncode(word){
    // ...
    const hash = {};
    const wordArr = word.toLowerCase().split("");
    wordArr.forEach((ch) => {
      if (hash[ch]) {
        hash[ch] += 1;
      } else {
        hash[ch] = 1;
      }
    });
    return wordArr.map((ch) => {
      if (hash[ch] > 1) {
        return ")";
      } else {
        return "(";
      }
    }).join("");
}

function duplicateEncode2(word){
    // ...
    return word.toLowerCase().split("").map((ch, i, arr) => {
      return arr.indexOf(ch) === arr.lastIndexOf(ch) ? "(" : ")";
    }).join("");
}

console.log(duplicateEncode("din") === "(((");
console.log(duplicateEncode("recede") === "()()()");
console.log(duplicateEncode("Success") === ")())())");
console.log(duplicateEncode("(( @") === "))((");
console.log(duplicateEncode2("din") === "(((");
console.log(duplicateEncode2("recede") === "()()()");
console.log(duplicateEncode2("Success") === ")())())");
console.log(duplicateEncode2("(( @") === "))((");
