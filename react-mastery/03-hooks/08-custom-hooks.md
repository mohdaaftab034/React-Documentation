# 08-custom-hooks

## ðŸ” What is it?
A core React concept explained in simple language for beginners.

## ðŸ¤” Why do we need it?
This solves common confusion and makes real app code easier to maintain.

## ðŸ  Real-life analogy
Like organizing tools in labeled boxes so you can find things fast.

## âš™ï¸ How does it work?
- Start with the problem.
- Understand the React idea.
- See wrong and right code.
- Use logs and visual output to verify.
- Practice with tiny examples.

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
Skipping fundamentals and copying code blindly.

## âœ… Best Practices
Read, run, modify, and observe outcomes.

## ðŸ§  When to use it?
Use this whenever building similar UI or data flow patterns.

## ðŸ”— Related concepts
- [../README.md](../README.md)

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

## ðŸ§± Custom Hook: useFetch
```jsx
import { useEffect, useState } from "react"; // imports

const useFetch = (url) => { // custom hook
  const [data, setData] = useState(null); // data
  const [loading, setLoading] = useState(true); // loading
  const [error, setError] = useState(null); // error

  useEffect(() => { // effect
    const run = async () => { // async task
      try { // try block
        setLoading(true); // loading start
        const response = await fetch(url); // request
        const json = await response.json(); // parse
        setData(json); // save data
      } catch (err) { // catch
        setError(err.message); // save error
      } finally { // finally
        setLoading(false); // loading end
      }
    }; // end run

    run(); // execute
  }, [url]); // dependency

  return { data, loading, error }; // return values
};

export default useFetch; // export
```
