const flatten = (array) => {
  let newArr = [];
  array.forEach(el => {
    if (el instanceof Array) {
      newArr = newArr.concat(flatten(el));
    } else {
      newArr.push(el);
    }
  });
  return newArr;
};

const arr = [1,[2],[3,[4]], [5,6]];

flatten(arr);
