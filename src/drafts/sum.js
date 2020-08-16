// sums the individual digits in a multi-digit number
const sumOfDigits = (num, sum = 0) => (num === 0) ? sum : sumOfDigits(Math.floor(num / 10), sum + num % 10)

// return the number whose sum of its digits is largest
const greatestSum = (nums) => nums.reduce((a, b) => sumOfDigits(a) > sumOfDigits(b) ? a : b)

const numbers = [7205551706, 3035559252, 3035556963, 7205551236]
numbers.map(sumOfDigits) // -> [ 38, 40, 47, 39 ]
greatestSum(numbers) // -> 3035556963

