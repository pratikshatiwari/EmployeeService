// vulnerable.js

const userInput = process.argv[2]; // Simulate user input passed as a command-line argument

// Unsafe use of template literals with unescaped user input
const greeting = `Hello, ${userInput}!`;

// Output the potentially unsafe greeting
console.log(greeting);

// password = pass@123; 
