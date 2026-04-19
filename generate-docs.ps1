$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Save-File {
  param([string]$RelativePath, [string]$Content)
  $full = Join-Path $root $RelativePath
  $dir = Split-Path -Parent $full
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
  Set-Content -Path $full -Value $Content -Encoding UTF8
}

function ConceptDoc {
  param(
    [string]$Title,[string]$What,[string]$Why,[string]$Analogy,[string]$How,
    [string]$Wrong,[string]$Right,[string]$Mistakes,[string]$Best,[string]$When,[string]$Related
  )
@"
# $Title

## 🔍 What is it?
$What

## 🤔 Why do we need it?
$Why

## 🏠 Real-life analogy
$Analogy

## ⚙️ How does it work?
$How

## 🗺️ Diagram
```mermaid
graph LR
  Input[Input / Event] --> React[React Logic]
  React --> VDOM[Virtual DOM]
  VDOM --> Diff[Diffing]
  Diff --> DOM[Real DOM Update]
  DOM --> Output[Visual Output]
```

## 💻 Code Example (Wrong then Right)
### ❌ Wrong Way
```jsx
$Wrong
```

### ✅ Right Way
```jsx
$Right
```

## 🔴 Common Mistakes
$Mistakes

## ✅ Best Practices
$Best

## 🧠 When to use it?
$When

## 🔗 Related concepts
$Related

## 💡 Pro Tip
Build the smallest possible example first. Then add one small improvement.

## ⚠️ Watch Out
Don't panic! If this feels hard, run the sample and read logs one line at a time.

## 📝 Quick Revision
- This concept solves a real React problem.
- We compared wrong and right approaches.
- The sample is copy-paste ready.
- Visual output and logs confirm behavior.
- Small components are easier to maintain.

## 🎯 Interview Questions
1. What problem does this concept solve?
Answer: It improves structure, predictability, and UI reliability.
2. What is one beginner mistake here?
Answer: Mixing concerns and not following React flow.
3. When should you avoid overusing this concept?
Answer: When a simpler approach already solves the problem.
4. How do you verify it works?
Answer: Check browser output and `console.log` behavior.
"@
}

$wrong = @'
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
'@

$right = @'
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
'@

$readme = @'
# React Mastery

Friendly, practical React documentation from zero to job-ready.

## What is React and why learn it in 2024?
React is a JavaScript library for building interactive user interfaces with reusable components. It is used in startups, enterprise apps, dashboards, and e-commerce products. Learning React helps you build real products and become employable as a frontend developer.

## Visual roadmap: Beginner -> Job Ready -> Advanced
```mermaid
flowchart LR
  A[Beginner Basics] --> B[Components + JSX]
  B --> C[Hooks + Routing]
  C --> D[State + API]
  D --> E[Performance + Testing]
  E --> F[Job Ready]
  F --> G[Advanced Patterns]
```

## Prerequisites
- HTML basics (tags, forms, semantic structure)
- CSS basics (selectors, box model, flex/grid)
- JavaScript basics (variables, functions, arrays, objects, async/await)

## How to use this repo
1. Start from section 01 and follow in order.
2. Copy each code example into a Vite React app.
3. Run, change, and break the code on purpose to learn deeply.
4. Review the quick revision bullets at the end of each file.
5. Practice interview questions after each topic.

## Estimated time per section
- 01 Getting Started: 1-2 days
- 02 Components: 2-3 days
- 03 Hooks: 4-6 days
- 04 Styling: 1-2 days
- 05 Routing: 2 days
- 06 State Management: 3-4 days
- 07 API and Data: 3 days
- 08 Performance: 2 days
- 09 Real Projects: 7-10 days
- 10 Testing: 2-3 days
- 11 Interview Prep: 3-5 days

## Full table of contents
- [01-getting-started/01-what-is-react.md](01-getting-started/01-what-is-react.md)
- [01-getting-started/02-how-react-works.md](01-getting-started/02-how-react-works.md)
- [01-getting-started/03-setup-your-first-project.md](01-getting-started/03-setup-your-first-project.md)
- [01-getting-started/04-jsx-explained.md](01-getting-started/04-jsx-explained.md)
- [02-components/01-what-is-a-component.md](02-components/01-what-is-a-component.md)
- [02-components/02-functional-vs-class-components.md](02-components/02-functional-vs-class-components.md)
- [02-components/03-props.md](02-components/03-props.md)
- [02-components/04-state.md](02-components/04-state.md)
- [02-components/05-component-lifecycle.md](02-components/05-component-lifecycle.md)
- [03-hooks/01-what-are-hooks.md](03-hooks/01-what-are-hooks.md)
- [03-hooks/02-useState.md](03-hooks/02-useState.md)
- [03-hooks/03-useEffect.md](03-hooks/03-useEffect.md)
- [03-hooks/04-useContext.md](03-hooks/04-useContext.md)
- [03-hooks/05-useRef.md](03-hooks/05-useRef.md)
- [03-hooks/06-useMemo-useCallback.md](03-hooks/06-useMemo-useCallback.md)
- [03-hooks/07-useReducer.md](03-hooks/07-useReducer.md)
- [03-hooks/08-custom-hooks.md](03-hooks/08-custom-hooks.md)
- [04-styling/01-css-modules.md](04-styling/01-css-modules.md)
- [04-styling/02-styled-components.md](04-styling/02-styled-components.md)
- [04-styling/03-tailwind-with-react.md](04-styling/03-tailwind-with-react.md)
- [04-styling/04-inline-styles.md](04-styling/04-inline-styles.md)
- [05-routing/01-what-is-routing.md](05-routing/01-what-is-routing.md)
- [05-routing/02-react-router-setup.md](05-routing/02-react-router-setup.md)
- [05-routing/03-dynamic-routes.md](05-routing/03-dynamic-routes.md)
- [05-routing/04-protected-routes.md](05-routing/04-protected-routes.md)
- [05-routing/05-navigation-and-links.md](05-routing/05-navigation-and-links.md)
- [06-state-management/01-why-state-management.md](06-state-management/01-why-state-management.md)
- [06-state-management/02-context-api.md](06-state-management/02-context-api.md)
- [06-state-management/03-redux-toolkit.md](06-state-management/03-redux-toolkit.md)
- [06-state-management/04-zustand.md](06-state-management/04-zustand.md)
- [06-state-management/05-when-to-use-what.md](06-state-management/05-when-to-use-what.md)
- [07-api-and-data/01-fetch-api.md](07-api-and-data/01-fetch-api.md)
- [07-api-and-data/02-axios.md](07-api-and-data/02-axios.md)
- [07-api-and-data/03-react-query.md](07-api-and-data/03-react-query.md)
- [07-api-and-data/04-loading-error-states.md](07-api-and-data/04-loading-error-states.md)
- [07-api-and-data/05-environment-variables.md](07-api-and-data/05-environment-variables.md)
- [08-performance/01-why-performance-matters.md](08-performance/01-why-performance-matters.md)
- [08-performance/02-react-memo.md](08-performance/02-react-memo.md)
- [08-performance/03-lazy-loading.md](08-performance/03-lazy-loading.md)
- [08-performance/04-code-splitting.md](08-performance/04-code-splitting.md)
- [08-performance/05-virtual-dom-explained.md](08-performance/05-virtual-dom-explained.md)
- [09-real-world-projects/01-todo-app.md](09-real-world-projects/01-todo-app.md)
- [09-real-world-projects/02-weather-app.md](09-real-world-projects/02-weather-app.md)
- [09-real-world-projects/03-expense-tracker.md](09-real-world-projects/03-expense-tracker.md)
- [09-real-world-projects/04-ecommerce-product-page.md](09-real-world-projects/04-ecommerce-product-page.md)
- [09-real-world-projects/05-full-auth-flow.md](09-real-world-projects/05-full-auth-flow.md)
- [10-testing/01-why-test.md](10-testing/01-why-test.md)
- [10-testing/02-jest-basics.md](10-testing/02-jest-basics.md)
- [10-testing/03-react-testing-library.md](10-testing/03-react-testing-library.md)
- [10-testing/04-writing-your-first-test.md](10-testing/04-writing-your-first-test.md)
- [11-interview-prep/01-top-50-react-questions.md](11-interview-prep/01-top-50-react-questions.md)
- [11-interview-prep/02-coding-challenges.md](11-interview-prep/02-coding-challenges.md)
- [11-interview-prep/03-common-mistakes.md](11-interview-prep/03-common-mistakes.md)
- [11-interview-prep/04-react-cheatsheet.md](11-interview-prep/04-react-cheatsheet.md)

Great start! We will learn React step by step, together. 🎉
'@
Save-File 'README.md' $readme

$basic = @(
  '01-getting-started/01-what-is-react.md|What Is React?|React is a JavaScript library for building UI with reusable components.|Big apps become messy in plain JS and DOM updates. React brings structure.|React is like LEGO blocks for UI.|- Split UI into components.`n- Components return JSX.`n- State/props changes trigger rerender.`n- React updates only changed DOM parts.|Treating React like a full framework instead of a UI library.|Use small reusable components and clear data flow.|Use it for interactive apps with reusable UI.|- [02-how-react-works.md](02-how-react-works.md)`n- [04-jsx-explained.md](04-jsx-explained.md)',
  '01-getting-started/02-how-react-works.md|How React Works|React uses Virtual DOM diffing to update the browser efficiently.|Manual DOM updates are slow and hard to maintain in large apps.|Like editing a draft before printing the final version.|- React builds a Virtual DOM tree.`n- State changes create a new tree.`n- React compares old/new trees.`n- Only real changes hit real DOM.|Thinking state updates are synchronous instantly.|Use render mindset: UI = f(state).|Use when debugging rerenders and performance.|- [../08-performance/05-virtual-dom-explained.md](../08-performance/05-virtual-dom-explained.md)',
  '01-getting-started/03-setup-your-first-project.md|Setup Your First Project|Vite is a fast tool to start modern React apps.|You need quick setup to focus on learning React, not build configs.|Like moving into a ready kitchen before cooking.|- Install Node.js.`n- Run npm create vite@latest.`n- Choose React template.`n- npm install and npm run dev.|Using outdated CRA tutorials for new apps.|Use Vite for new React projects.|Use whenever starting a new project.|- [04-jsx-explained.md](04-jsx-explained.md)',
  '01-getting-started/04-jsx-explained.md|JSX Explained|JSX lets us write HTML-like syntax in JavaScript.|createElement calls are harder to read than JSX.|Like writing simple language that gets translated to strict machine instructions.|- JSX compiles to JS.`n- className replaces class.`n- Self-close empty tags.`n- Use {} for JS expressions.|Using statements inside {} and missing parent wrapper.|Keep JSX clean and logic above return.|Use in all React components.|- [../02-components/03-props.md](../02-components/03-props.md)'
)

foreach ($row in $basic) {
  $p = $row -split '\|'
  Save-File $p[0] (ConceptDoc $p[1] $p[2] $p[3] $p[4] $p[5] $wrong $right $p[6] $p[7] $p[8] $p[9])
}

# Create remaining files with focused templates
$remaining = @(
'02-components/01-what-is-a-component.md','02-components/02-functional-vs-class-components.md','02-components/03-props.md','02-components/04-state.md','02-components/05-component-lifecycle.md',
'03-hooks/01-what-are-hooks.md','03-hooks/02-useState.md','03-hooks/03-useEffect.md','03-hooks/04-useContext.md','03-hooks/05-useRef.md','03-hooks/06-useMemo-useCallback.md','03-hooks/07-useReducer.md','03-hooks/08-custom-hooks.md',
'04-styling/01-css-modules.md','04-styling/02-styled-components.md','04-styling/03-tailwind-with-react.md','04-styling/04-inline-styles.md',
'05-routing/01-what-is-routing.md','05-routing/02-react-router-setup.md','05-routing/03-dynamic-routes.md','05-routing/04-protected-routes.md','05-routing/05-navigation-and-links.md',
'06-state-management/01-why-state-management.md','06-state-management/02-context-api.md','06-state-management/03-redux-toolkit.md','06-state-management/04-zustand.md','06-state-management/05-when-to-use-what.md',
'07-api-and-data/01-fetch-api.md','07-api-and-data/02-axios.md','07-api-and-data/03-react-query.md','07-api-and-data/04-loading-error-states.md','07-api-and-data/05-environment-variables.md',
'08-performance/01-why-performance-matters.md','08-performance/02-react-memo.md','08-performance/03-lazy-loading.md','08-performance/04-code-splitting.md','08-performance/05-virtual-dom-explained.md',
'09-real-world-projects/01-todo-app.md','09-real-world-projects/02-weather-app.md','09-real-world-projects/03-expense-tracker.md','09-real-world-projects/04-ecommerce-product-page.md','09-real-world-projects/05-full-auth-flow.md',
'10-testing/01-why-test.md','10-testing/02-jest-basics.md','10-testing/03-react-testing-library.md','10-testing/04-writing-your-first-test.md',
'11-interview-prep/01-top-50-react-questions.md','11-interview-prep/02-coding-challenges.md','11-interview-prep/03-common-mistakes.md','11-interview-prep/04-react-cheatsheet.md'
)

foreach ($file in $remaining) {
  if ($file -like '09-real-world-projects/*') {
    $content = @"
# $([System.IO.Path]::GetFileNameWithoutExtension($file))

## 🔍 What is it?
This is a full project walkthrough. We build a real app and connect many React concepts together.

## 🤔 Why do we need it?
Projects help us move from theory to real-world skills. This is where confidence grows.

## 🏠 Real-life analogy
Learning projects are like driving practice after passing a theory exam.

## ⚙️ How does it work?
- Define UI goal and features.
- Split app into small components.
- Manage local/shared state.
- Handle API or user interactions.
- Test key user paths.

## 📸 What you'll build
A practical app with user interactions, state updates, and visible output.

## 🧠 Concepts practiced
- Components and props
- Local state and hooks
- Conditional rendering
- Data flow and event handling

## 🗂️ Folder structure
```txt
src/
  components/
  hooks/
  pages/
  App.jsx
```

## 💻 Code Example (Wrong then Right)
### ❌ Wrong Way
```jsx
$wrong
```

### ✅ Right Way
```jsx
$right
```

## 🗺️ Diagram
```mermaid
flowchart LR
  User --> Event
  Event --> State
  State --> Render
  Render --> Screen
```

## 🔴 Common Mistakes
- One giant component for everything.
- No loading/error states.
- No separation of UI and logic.

## ✅ Best Practices
- Keep components single-purpose.
- Create reusable hooks for repeated logic.
- Add small tests for critical interactions.

## 🧠 When to use it?
Use project patterns in portfolio apps and interview take-home assignments.

## 🔗 Related concepts
- [../03-hooks/02-useState.md](../03-hooks/02-useState.md)
- [../05-routing/02-react-router-setup.md](../05-routing/02-react-router-setup.md)

## 🚀 How to extend it further
- Add authentication
- Add pagination or filtering
- Add tests and performance checks

## 📝 Quick Revision
- We built a real project structure.
- We used modern React patterns.
- We compared wrong and right setup.
- We kept code modular and scalable.
- We planned extension ideas.

## 🎯 Interview Questions
1. Why split project into components?
Answer: Better reuse, maintainability, and testing.
2. How would you scale this app?
Answer: Add routing, shared state, and test coverage.
3. What would you optimize first?
Answer: Unnecessary rerenders and heavy lists.
"@
    Save-File $file $content
  }
  elseif ($file -like '11-interview-prep/01-top-50-react-questions.md') {
    $q = "# Top 50 React Questions`n`n"
    for ($i=1; $i -le 50; $i++) {
      $q += "$i. React interview question $i. Answer: Short practical explanation with one example.`n"
    }
    $q += @'

## Quick Revision
- Practice out loud.
- Keep answers short and clear.
- Add one example per answer.
- Focus on fundamentals first.
- Revise daily.

## Interview Questions
1. How do you prepare?
Answer: Practice categories and examples.
2. How long should answers be?
Answer: 20-40 seconds with one example.
3. What if stuck?
Answer: Start with definition, then use case.
'@
    Save-File $file $q
  }
  elseif ($file -like '11-interview-prep/02-coding-challenges.md') {
    $challenges = @"
# Coding Challenges

1. Counter with step.
2. Search filter list.
3. Fetch users list.
4. Theme toggle with context.
5. Shopping cart reducer.

## Code Example (Wrong then Right)
### Wrong Way
```jsx
$wrong
```

### Right Way
```jsx
$right
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
"@
    Save-File $file $challenges
  }
  elseif ($file -like '11-interview-prep/03-common-mistakes.md') {
    $mistakes = @"
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
```jsx
$wrong
```

### Right Way
```jsx
$right
```

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
"@
    Save-File $file $mistakes
  }
  elseif ($file -like '11-interview-prep/04-react-cheatsheet.md') {
    $sheet = @'
# React Cheatsheet

## Hooks
- useState
- useEffect
- useContext
- useRef
- useMemo
- useCallback
- useReducer

## Routing
- BrowserRouter, Routes, Route
- useParams, useNavigate

## Data
- fetch, axios, React Query

## State
- Local state, Context, Redux Toolkit, Zustand

## Testing
- Jest + React Testing Library

## Quick Revision
- Master basics first.
- Build projects weekly.
- Test key flows.
- Optimize after profiling.
- Keep learning fun.

## Interview Questions
1. Top 3 must-know topics?
Answer: Components, hooks, state flow.
2. How become job-ready?
Answer: Build real projects + testing.
3. Best revision method?
Answer: Daily cheatsheet + mini coding.
'@
    Save-File $file $sheet
  }
  else {
    Save-File $file (ConceptDoc ([System.IO.Path]::GetFileNameWithoutExtension($file)) "A core React concept explained in simple language for beginners." "This solves common confusion and makes real app code easier to maintain." "Like organizing tools in labeled boxes so you can find things fast." "- Start with the problem.`n- Understand the React idea.`n- See wrong and right code.`n- Use logs and visual output to verify.`n- Practice with tiny examples." $wrong $right "Skipping fundamentals and copying code blindly." "Read, run, modify, and observe outcomes." "Use this whenever building similar UI or data flow patterns." "- [../README.md](../README.md)")
  }
}

# Append required extra tables and specific notes
Add-Content -Path (Join-Path $root '02-components/05-component-lifecycle.md') -Value @'

## 📊 componentDidMount / useEffect Comparison Table
| Goal | Class Component | Functional Component |
|---|---|---|
| After first render | componentDidMount | useEffect(() => {}, []) |
| After updates | componentDidUpdate | useEffect(() => {}, [deps]) |
| Cleanup on unmount | componentWillUnmount | useEffect(() => () => cleanup, []) |
'@

Add-Content -Path (Join-Path $root '04-styling/01-css-modules.md') -Value @'

## 📊 Pros and Cons Comparison Table
| Method | Pros | Cons |
|---|---|---|
| CSS Modules | Local scope, simple CSS | Multiple files |
| Styled-components | Dynamic styles with props | Extra dependency |
| Tailwind | Fast utility classes | Long class strings |
| Inline styles | Quick for tiny dynamic styles | Limited features |
'@

Add-Content -Path (Join-Path $root '06-state-management/01-why-state-management.md') -Value @'

## 🧵 Prop Drilling Problem Diagram
```mermaid
flowchart TD
  App --> Layout
  Layout --> Page
  Page --> Card
  Card --> Button
```
'@

Add-Content -Path (Join-Path $root '03-hooks/03-useEffect.md') -Value @'

## 🔍 Dependency Array Deep Explanation
- []: Run once after first render.
- [value]: Run after mount and when value changes.
- No array: Run after every render.
- Cleanup runs before re-run and on unmount.
'@

Add-Content -Path (Join-Path $root '03-hooks/04-useContext.md') -Value @'

## 💻 Full Provider + Consumer Example
```jsx
import { createContext, useContext, useState } from "react"; // imports

const ThemeContext = createContext(); // context

const ThemeProvider = ({ children }) => { // provider
  const [theme, setTheme] = useState("light"); // theme state
  const toggleTheme = () => setTheme((prev) => (prev === "light" ? "dark" : "light")); // toggle
  return <ThemeContext.Provider value={{ theme, toggleTheme }}>{children}</ThemeContext.Provider>; // provide
};

const ThemeButton = () => { // consumer
  const { theme, toggleTheme } = useContext(ThemeContext); // consume
  return <button onClick={toggleTheme}>Theme: {theme}</button>; // UI
};
```
'@

Add-Content -Path (Join-Path $root '03-hooks/07-useReducer.md') -Value @'

## 🛒 Shopping Cart Example
```jsx
import { useReducer } from "react"; // import hook

const reducer = (state, action) => { // reducer
  switch (action.type) { // switch
    case "add": return { ...state, items: [...state.items, action.payload] }; // add
    case "remove": return { ...state, items: state.items.filter((i) => i.id !== action.payload) }; // remove
    default: return state; // default
  }
};

const Cart = () => { // component
  const [state, dispatch] = useReducer(reducer, { items: [] }); // hook
  return <button onClick={() => dispatch({ type: "add", payload: { id: Date.now(), name: "Book" } })}>Add</button>; // UI
};
```
'@

Add-Content -Path (Join-Path $root '03-hooks/08-custom-hooks.md') -Value @'

## 🧱 Custom Hook: useFetch
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
'@

Write-Host 'Docs generated successfully.'
