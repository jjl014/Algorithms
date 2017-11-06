const a = "23+5/6*3+15";

const numbers = a.split(/[\+\-\*\/]/);
const ops = a.split(/(\d+)/).filter((el) => el !== "");

// console.log(/\d+/.test(ops[0]));

const stack1 = [];
const stack2 = [];

const precedence = (op1, op2) => {
  if ( (op1 == "*" || op1 === "/") && (op2 === "+" || op2 === "-")) {
    return false;
  }
  return true;
};

for (let i = 0; i < ops.length; i++) {
  console.log(`current: ${ops[i]}`);
  if (/\d+/.test(ops[i])) {
    stack1.push(ops[i]);
  } else if (stack2.length !== 0 && precedence(ops[i], stack2[stack2.length - 1])){
    let val2 = stack1.pop();
    let val1 = stack1.pop();
    let op = stack2.pop();
    stack1.push(eval(val1 + op + val2));
    stack2.push(ops[i]);
  } else {
    stack2.push(ops[i]);
  }
  console.log(`-----stack1: ${stack1}`);
  console.log(`-----stack2: ${stack2}`);
}

while (stack2.length > 0) {
  let val2 = stack1.pop();
  let val1 = stack1.pop();
  let op = stack2.pop();
  stack1.push(eval(val1 + op + val2));
}

console.log(stack1[0]);
