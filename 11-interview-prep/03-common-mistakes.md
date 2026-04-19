# Common Mistakes

- Mutating state directly.
- Missing useEffect dependencies.
- No key in list items.
- Overusing global state.
- Skipping loading/error states.
- Huge components.
- Premature optimization.
- No tests.
- Prop drilling everywhere.
- Ignoring accessibility.

## Code Example
### Wrong Way
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

### Right Way
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

## Quick Revision
- Most bugs come from a few patterns.
- Immutable updates are critical.
- Effects need proper dependencies.
- Keep components focused.
- Test user behavior.

## Interview Questions
1. Biggest React bug source?
Answer: State and effect misuse.
2. How prevent prop drilling?
Answer: Composition, Context, or store.
3. Fast review checklist?
Answer: State immutability, hooks, loading/error.
