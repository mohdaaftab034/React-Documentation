# 01-why-test

Language: English

## What is it?
A core React concept explained in simple language for beginners.

## Why do we need it?
This solves common confusion and makes real app code easier to maintain.

## Real-life analogy
Like organizing tools in labeled boxes so you can find things fast.

## How does it work?
- Start with the problem.
- Understand the React idea.
- See wrong and right code.
- Use logs and visual output to verify.
- Practice with tiny examples.

## Diagram
```mermaid
graph LR
  Input[Input / Event] --> React[React Logic]
  React --> VDOM[Virtual DOM]
  VDOM --> Diff[Diffing]
  Diff --> DOM[Real DOM Update]
  DOM --> Output[Visual Output]
```
## Code Example
### Wrong Way
```jsx
import { useState } from "react"; // import hook

const Demo = () => { // component
  let count = 0; // plain variable

  const handleClick = () => { // click handler
    count = count + 1; // React will not track this change reliably
    console.log("Wrong count:", count); // debug output
  }; // end handler

  return <button onClick={handleClick}>Count: {count}</button>; // UI
}; // end component

export default Demo; // export
```
### Right Way
```jsx
import { useState } from "react"; // import hook

const Demo = () => { // component
  const [count, setCount] = useState(0); // state

  const handleClick = () => { // click handler
    setCount((prev) => prev + 1); // safe update
    console.log("Count will update on next render"); // debug output
  }; // end handler

  return ( // return UI
    <section> {/* wrapper */}
      <h2>Counter Demo</h2> {/* title */}
      <p>Current count: {count}</p> {/* visual output */}
      <button onClick={handleClick}>Increase</button> {/* action */}
    </section> // end wrapper
  ); // end return
}; // end component

export default Demo; // export
```
## Common Mistakes
Skipping fundamentals and copying code blindly.

## Best Practices
Read, run, modify, and observe outcomes.

## When to use it?
Use this whenever building similar UI or data flow patterns.

## Related concepts
- [../README.md](../README.md)

## Pro Tip
Build the smallest possible example first. Then add one small improvement.

## Watch Out
Don't panic! If this feels hard, run the sample and read logs one line at a time.

## Quick Revision
- This concept solves a real React problem.
- We compared wrong and right approaches.
- The sample is copy-paste ready.
- Visual output and logs confirm behavior.
- Small components are easier to maintain.

## Interview Questions
1. What problem does this concept solve?
Answer: It improves structure, predictability, and UI reliability.
2. What is one beginner mistake here?
Answer: Mixing concerns and not following React flow.
3. When should you avoid overusing this concept?
Answer: When a simpler approach already solves the problem.
4. How do you verify it works?
Answer: Check browser output and console.log behavior.




