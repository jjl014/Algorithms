function inArray(array1,array2){
  let new_arr = [];
  for(let i = 0; i < array1.length; i++) {
    for (let j = 0; j < array2.length; j++) {
      if (array2[j].includes(array1[i])) {
        new_arr.push(array1[i]);
        break;
      }
    }
  }
  return new_arr.sort();
}

function inArray2(arr1, arr2) {
  return arr1.filter(function(needle) {
    return arr2.some(function(haystack) {
      return haystack.indexOf(needle) > -1;
    });
  }).sort();
}

console.log(inArray(["arr", "mar", "it"], ["carr", "lit", "zit", "two"]));
console.log(inArray2(["arr", "mar", "it"], ["carr", "lit", "zit", "two"]));
