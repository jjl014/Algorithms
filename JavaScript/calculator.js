const solveMathExpr = (expr) => {
  let nums = expr.split(/[\+\/\*\-]/);
  let ops = expr.split(/\d+/).filter(el => el !== "");
  const stack1 = [];
  const stack2 = [];

  const precedence = (op1, op2) => {
    if (( op1 === "/" || op1 === "*") && (op2 === "+" || op2 === "-")) {
      return false;
    }
    return true;
  };

  while (ops.length > 0) {
    let num = nums.shift();
    let op = ops.shift();
    stack1.push(num);
    if (stack2.length !== 0 && precedence(op, stack2[stack2.length - 1])) {
      let num2 = stack1.pop();
      let num1 = stack1.pop();
      let currentOp = stack2.pop();
      stack1.push(eval(num1 + currentOp + num2));
      stack2.push(op);
    } else {
      stack2.push(op);
    }
  }

  nums.forEach((el) => {
    stack1.push(el);
  })

  while (stack2.length !== 0) {
    let num2 = stack1.pop();
    let num1 = stack1.pop();
    let currentOp = stack2.pop();
    stack1.push(eval(num1 + currentOp + num2));
  }

  return stack1[0];
}

console.log(solveMathExpr("23+5/6*3+15"));
