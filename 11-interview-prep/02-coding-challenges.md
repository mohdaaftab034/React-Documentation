# Coding Challenges

Language: English

1. Counter with step.
2. Search filter list.
3. Fetch users list.
4. Theme toggle with context.
5. Shopping cart reducer.

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
## Quick Revision
- Break problems into small tasks.
- Define state shape first.
- Build minimal solution first.
- Handle edge cases.
- Add tests.

## Interview Questions
1. How do you start a challenge?
Answer: Clarify requirements then define state.
2. What matters most?
Answer: Correct behavior and readable code.
3. How to stand out?
Answer: Mention tradeoffs and testing.




