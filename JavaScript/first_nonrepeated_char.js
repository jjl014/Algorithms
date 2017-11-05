function firstNonRepeatedCharacter(string) {
  for (var i = 0; i < string.length; i++) {
    var c = string.charAt(i);
    if (string.indexOf(c) == i && string.indexOf(c, i + 1) == -1) {
      return c;
    }
  }
  return null;
}

function firstNonRepeatedCharacter2(string) {
  for(let i = 0; i < string.length; i++) {
    let c = string.charAt(i);
    if (string.indexOf(c) === i && string.lastIndexOf(c) === i) {
      return c;
    }
  }
  return null;
}

console.log(firstNonRepeatedCharacter("aabccd") === "b");
console.log(firstNonRepeatedCharacter("aabcbcd") === "d");
console.log(firstNonRepeatedCharacter2("aabccd") === "b");
console.log(firstNonRepeatedCharacter2("aabcbcd") === "d");
