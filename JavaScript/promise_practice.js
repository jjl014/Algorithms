const successfulPromise = new Promise((resolve, reject) => {
    setTimeout(resolve, 1000);
  });

const prom1 = new Promise((resolve, reject) => {
  setTimeout(resolve(1), 1000);
});

const prom2 = new Promise((resolve, reject) => {
  setTimeout(resolve(2), 2000);
});

successfulPromise
  .then(() => console.log('done'));

const failedPromise = new Promise((resolve, reject) => reject('promise failed'));

failedPromise
  .catch(err => console.error(err))

let promiseArray = [prom1, prom2, successfulPromise];

function promiseDotAll (promiseArray) {
  let counter = 0;
  let arr = [];
    return new Promise((resolve, reject) => {
      for (let i = 0; i < promiseArray.length; i++) {
        promiseArray[i]
          .then((val) => {
            counter++;
            arr.push(val);
            if (counter === promiseArray.length) {
              resolve(arr);
            }
          })
          .catch((err) => reject(err));
      }
    });
}

promiseDotAll(promiseArray).then((arr) => console.log(arr)).catch(err => console.log(err));


// const promiseDotAll = promiseArray =>
// return a promise that:
// - if/once all promises in the promiseArray resolve successfully, resolves successfully
// - if/once at least one promise in the promiseArray fails, rejects

// should be able to do something like this:
// promiseDotAll(promiseArray).then(() => console.log("All promises have resolved!"))

