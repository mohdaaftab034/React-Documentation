# What Is React?

## ðŸ” What is it?
React is a JavaScript library for building UI with reusable components.

## ðŸ¤” Why do we need it?
Big apps become messy in plain JS and DOM updates. React brings structure.

## ðŸ  Real-life analogy
React is like LEGO blocks for UI.

## âš™ï¸ How does it work?
- Split UI into components.`n- Components return JSX.`n- State/props changes trigger rerender.`n- React updates only changed DOM parts.

## ðŸ—ºï¸ Diagram
`mermaid
graph LR
  Input[Input / Event] --> React[React Logic]
  React --> VDOM[Virtual DOM]
  VDOM --> Diff[Diffing]
  Diff --> DOM[Real DOM Update]
  DOM --> Output[Visual Output]
`

## ðŸ’» Code Example (Wrong then Right)
### âŒ Wrong Way
`jsx
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
`

### âœ… Right Way
`jsx
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
`

## ðŸ”´ Common Mistakes
Treating React like a full framework instead of a UI library.

## âœ… Best Practices
Use small reusable components and clear data flow.

## ðŸ§  When to use it?
Use it for interactive apps with reusable UI.

## ðŸ”— Related concepts
- [02-how-react-works.md](02-how-react-works.md)`n- [04-jsx-explained.md](04-jsx-explained.md)

## ðŸ’¡ Pro Tip
Build the smallest possible example first. Then add one small improvement.

## âš ï¸ Watch Out
Don't panic! If this feels hard, run the sample and read logs one line at a time.

## ðŸ“ Quick Revision
- This concept solves a real React problem.
- We compared wrong and right approaches.
- The sample is copy-paste ready.
- Visual output and logs confirm behavior.
- Small components are easier to maintain.

## ðŸŽ¯ Interview Questions
1. What problem does this concept solve?
Answer: It improves structure, predictability, and UI reliability.
2. What is one beginner mistake here?
Answer: Mixing concerns and not following React flow.
3. When should you avoid overusing this concept?
Answer: When a simpler approach already solves the problem.
4. How do you verify it works?
Answer: Check browser output and console.log behavior.
