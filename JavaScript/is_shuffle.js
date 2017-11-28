// Given three strings, return whether the third is an interleaving of the first two. Interleaving means it only contains characters from the other two, no more no less, and preserves their character ordering. "abdecf" is an interleaving of "abc" and "def". Note that the first two strings needn't be in alphabetical order like these.

// You may assume that the first two strings do not contain any characters in common.

// Next, relax the assumption that the first two strings contain no overlap. Analyze the time-complexity of your solution. You may wish to view this problem recursively.

// # time: O(n), space: O(1)
function isShuffle(str1, str2, str3) {
  if ((str1.length + str2.length) !== str3.length) {
    return false;
  }

  let idx1 = 0, idx2 = 0, idx3 = 0;

  while (idx3 < str3.length) {
    if (str1[idx1] === str3[idx3]) {
      idx1 += 1;
      idx3 += 1;
    }
    else if (str2[idx2] === str3[idx3]) {
      idx2 += 1;
      idx3 += 1;
    }
    else {
      return false;
    }
  }

  return true;
}

console.log(isShuffle("hello", "abcde", "habelcldoe"));
console.log(isShuffle("pizza", "pie", "false"));
