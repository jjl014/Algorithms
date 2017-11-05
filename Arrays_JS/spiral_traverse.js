const snail = function(array) {
  // enjoy
  let k = 0;
  let m = array.length;
  let l = 0;
  let n = array[0].length;
  let arr = [];

  while (k < m && l < n) {
    for (let i = l; i < n; i++) {
      arr.push(array[k][i]);
    }
    k++;
    for (let i = k; i < m; i++) {
      arr.push(array[i][n-1]);
    }
    n--;
    if (k < m) {
      for (let i = n-1; i >= l; i--) {
        arr.push(array[m-1][i]);
      }
      m--;
    }
    if (l < n) {
      for (let i = m-1; i >= k; i--) {
        arr.push(array[i][l]);
      }
      l++;
    }
  }
  return arr;
};

console.log(snail([[1,2,3],[4,5,6],[7,8,9]]));
