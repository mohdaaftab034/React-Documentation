# What Is React?

Language: English

## What is it?
React is a JavaScript library for building UI with reusable components.

## Why do we need it?
Big apps become messy in plain JS and DOM updates. React brings structure.

## Real-life analogy
React is like LEGO blocks for UI.

## How does it work?
- Split UI into components.
- Components return JSX.
- State/props changes trigger rerender.
- React updates only changed DOM parts.

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
Treating React like a full framework instead of a UI library.

## Best Practices
Use small reusable components and clear data flow.

## When to use it?
Use it for interactive apps with reusable UI.

## Related concepts
- [02-how-react-works.md](02-how-react-works.md)
- [04-jsx-explained.md](04-jsx-explained.md)

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




