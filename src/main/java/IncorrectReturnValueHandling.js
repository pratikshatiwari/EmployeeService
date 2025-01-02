// Function that returns a number
function calculateSum(a, b) {
    if (typeof a !== 'number' || typeof b !== 'number') {
        return null; // Returns null for invalid inputs
    }
    return a + b;
}

// Function that returns an object
function getUserDetails(userId) {
    if (userId !== 1) {
        return null; // Returns null if the user is not found
    }
    return { id: 1, name: "Alice", age: 30 };
}

// Main code demonstrating incorrect return value handling
try {
    // Correct usage of calculateSum
    const sum = calculateSum(10, 20);
    console.log("Sum:", sum);

    // Incorrect handling of null return value
    const invalidSum = calculateSum("10", 20);
    console.log("Invalid Sum Result:", invalidSum.toFixed(2)); // Error: Cannot read property 'toFixed' of null

    // Correct usage of getUserDetails
    const user = getUserDetails(1);
    console.log("User:", user.name);

    // Incorrect handling of null return value
    const missingUser = getUserDetails(2);
    console.log("Missing User:", missingUser.name); // Error: Cannot read property 'name' of null

    // Assuming a function always returns an array
    const result = getUserDetails(1); // Returns an object, not an array
    console.log("First Element:", result[0]); // Error: result[0] is undefined

} catch (error) {
    console.error("Error:", error.message);
}
