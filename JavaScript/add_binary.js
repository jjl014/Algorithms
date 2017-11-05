function addBinary(a,b) {
  let sum = a + b;
  let binary = "";
  let rem;

  while (sum > 0) {
    rem = sum % 2;
    binary = rem.toString() + binary;
    sum = Math.floor(sum / 2);
  }

  return binary;
}

function addBinary2(a,b) {
  return (a + b).toString(2);
}

console.log(addBinary(1,2));
console.log(addBinary(5,8));
console.log(addBinary2(1,2));
console.log(addBinary2(5,8));
