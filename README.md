# React Documentation (Beginner to Interview Mastery)

This README is a complete, in-depth guide for learning React from scratch.

Goal of this document:

- Explain every concept in simple language
- Go deep enough for interviews
- Show both theory and code
- Clarify common mistakes and best practices

How to use this guide:

1. Read one major section at a time.
2. Rewrite all code examples manually.
3. Explain each section in your own words.
4. Build mini examples after each topic.
5. Revisit interview notes at the end of each week.

---

## Navigation (Topic Tabs / Study Index)

1. React Fundamentals and Mental Model
2. JSX in Depth
3. Components in Depth
4. Props in Depth
5. State in Depth
6. Events in React
7. Lifecycle and Rendering Cycle
8. Hooks (useState, useEffect, useMemo, useRef, useCallback)
9. Conditional Rendering
10. Lists and Keys
11. Forms (Controlled and Uncontrolled)
12. State Lifting and Shared State
13. Context API
14. React Router Basics
15. API Calls and Async Patterns
16. Error Handling and UI States
17. Performance Optimization
18. Folder Structure and Project Architecture
19. Testing Basics (Conceptual)
20. Interview Preparation (Theory + Practical)
21. 30-Day Study Plan

---

## 1) React Fundamentals and Mental Model

### What is React?

React is a JavaScript library used to build interactive user interfaces.

React helps you:

- Break UI into reusable components
- Connect UI to data (state)
- Update only what changed

### React vs Vanilla JavaScript

Without React:

- You manually query DOM nodes
- You manually update text/content/classes
- Complex UI becomes harder to maintain

With React:

- You describe what UI should look like for a state
- React handles DOM updates for you

### Declarative UI (Most Important Concept)

Imperative style says:

- "Find this button, set this text, hide this box"

Declarative style says:

- "If user is logged in, show dashboard; otherwise show login"

React is declarative.

### Virtual DOM (Interview Core)

React creates a lightweight in-memory representation of UI called Virtual DOM.

Process:

1. State changes
2. React creates new Virtual DOM tree
3. React compares old tree vs new tree (diff)
4. React updates only changed parts in real DOM

Why useful:

- Faster updates
- Cleaner programming model

### Example

```jsx
function Welcome() {
  return <h1>Welcome to React</h1>
}

export default Welcome
```

### Common Mistakes

- Thinking React is a full backend framework
- Trying to manipulate DOM directly inside components

### Interview Quick Notes

- React is a library focused on UI
- React follows one-way data flow
- React uses component architecture

---

## 2) JSX in Depth

### What is JSX?

JSX is syntax that looks like HTML inside JavaScript.

Important:

- JSX is not HTML
- JSX gets transformed into JavaScript calls

### Why JSX?

- Makes component UI easier to read
- Keeps markup and logic in one place

### JSX Rules

1. Return a single root element
2. Close all tags
3. Use className (not class)
4. Use camelCase event names (onClick, onChange)
5. JavaScript expression inside {}

### Example

```jsx
function Greeting() {
  const name = 'Aftab'
  const isMorning = true

  return (
    <section>
      <h2>Hello {name}</h2>
      <p>{isMorning ? 'Good morning' : 'Good evening'}</p>
    </section>
  )
}
```

### Interview Quick Notes

- Browser does not understand JSX directly
- Build tools compile JSX to JavaScript

---

## 3) Components in Depth

### What is a Component?

A component is a reusable function that returns UI.

Good component traits:

- Small and focused
- Reusable
- Easy to test
- Predictable output from input

### Types of Components

- Presentational component: mostly UI
- Container component: handles logic/data

### Example

```jsx
function UserBadge() {
  return <span>Frontend Learner</span>
}
```

### Component Composition

You can combine small components into larger pages.

### Interview Quick Notes

- Components are building blocks of React apps
- Composition is preferred over inheritance in React

---

## 4) Props in Depth

### What are Props?

Props are read-only data passed from parent to child.

Think of props like function arguments.

### Why Props?

- Reuse same component with different data
- Keep data flow clean

### Example

```jsx
function UserCard({ name, role }) {
  return (
    <article>
      <h3>{name}</h3>
      <p>{role}</p>
    </article>
  )
}

function App() {
  return (
    <div>
      <UserCard name="Aisha" role="Frontend Developer" />
      <UserCard name="Ravi" role="React Intern" />
    </div>
  )
}
```

### Props Rules

- Child should not mutate props
- Parent controls prop values

### Interview Quick Notes

- Props are immutable in child
- Data generally flows parent to child

---

## 5) State in Depth

### What is State?

State is mutable data owned by a component.

When state changes:

- React re-renders component
- UI reflects latest state

### useState Hook

useState returns:

- current value
- setter function

### Example

```jsx
import { useState } from 'react'

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount((prev) => prev + 1)}>Increment</button>
    </div>
  )
}
```

### State Best Practices

- Never mutate state directly
- Keep state minimal
- If next value depends on previous, use functional setter

### Interview Quick Notes

- State is internal mutable data
- Props are external read-only inputs

---

## 6) Events in React

### What are Events?

Events are user interactions:

- click
- input change
- form submit
- key press

### Event Handling Pattern

- Pass function reference to event prop
- Update state inside handler

### Example

```jsx
function Toggle() {
  const [isOn, setIsOn] = useState(false)

  function handleToggle() {
    setIsOn((prev) => !prev)
  }

  return <button onClick={handleToggle}>{isOn ? 'ON' : 'OFF'}</button>
}
```

### Interview Quick Notes

- Use camelCase event names
- Do not call handler directly in JSX unless intentionally passing args

---

## 7) Lifecycle and Rendering Cycle

### Functional Lifecycle View

In modern React (function components), lifecycle is understood through render and effects.

Main phases:

1. Mount (first render)
2. Update (re-render due to state/props change)
3. Unmount (component removed)

### Render Trigger Sources

- State change
- Parent re-render
- Context value change

### Important Clarification

Re-render does not mean full page reload.

It means React recalculates component output and updates changed parts.

---

## 8) Hooks in Depth

### 8.1 useState

Purpose:

- local mutable state

### 8.2 useEffect

Purpose:

- side effects (API calls, subscriptions, timers)

Dependency behavior:

- No dependency array: runs after every render
- Empty array: runs once after initial mount
- With dependencies: runs when dependency changes

Example:

```jsx
useEffect(() => {
  console.log('Runs after mount')
}, [])
```

Cleanup pattern:

```jsx
useEffect(() => {
  const timer = setInterval(() => console.log('tick'), 1000)

  return () => clearInterval(timer)
}, [])
```

### 8.3 useMemo

Purpose:

- cache expensive computed values

```jsx
const filteredUsers = useMemo(() => {
  return users.filter((u) => u.active)
}, [users])
```

### 8.4 useRef

Purpose:

- store mutable value without causing re-render
- access DOM node

```jsx
const inputRef = useRef(null)

function focusInput() {
  inputRef.current?.focus()
}
```

### 8.5 useCallback

Purpose:

- memoize function reference
- useful for child optimization scenarios

```jsx
const handleSave = useCallback(() => {
  console.log('saved')
}, [])
```

### Hook Rules

1. Call hooks at top level
2. Call hooks only in React functions/custom hooks
3. Do not call hooks conditionally

### Interview Quick Notes

- Most asked hook: useEffect
- Explain dependency array and cleanup clearly

---

## 9) Conditional Rendering

### What is it?

Showing different UI based on conditions.

Patterns:

- if statement
- ternary operator
- logical AND
- early return

### Example

```jsx
function Status({ isLoggedIn }) {
  if (!isLoggedIn) return <p>Please login</p>
  return <p>Welcome back</p>
}
```

### Interview Quick Notes

- Conditional rendering is core in declarative UI

---

## 10) Lists and Keys

### Why keys matter?

Keys help React identify list items across renders.

Good key:

- unique
- stable
- tied to item identity (id)

Bad key:

- array index (if list order changes)

### Example

```jsx
function TodoList({ todos }) {
  return (
    <ul>
      {todos.map((todo) => (
        <li key={todo.id}>{todo.title}</li>
      ))}
    </ul>
  )
}
```

### Interview Quick Notes

- Wrong keys can cause subtle UI bugs and wrong state mapping

---

## 11) Forms (Controlled and Uncontrolled)

### Controlled Components

Input value comes from React state.

Pros:

- easy validation
- easy conditional behavior
- predictable flow

```jsx
function Form() {
  const [email, setEmail] = useState('')

  return <input value={email} onChange={(e) => setEmail(e.target.value)} />
}
```

### Uncontrolled Components

Input value managed by DOM itself, often read via ref.

Use when:

- simple form handling
- integrating non-React code

### Interview Quick Notes

- Controlled inputs are commonly preferred in React apps

---

## 12) State Lifting and Shared State

### Why lift state?

When sibling components need same data, move state to nearest common parent.

Pattern:

1. Parent owns state
2. Parent passes data and handlers as props
3. Children become controlled by parent state

### Interview Quick Notes

- Lifting state keeps data synchronized

---

## 13) Context API

### What problem does Context solve?

Prop drilling (passing props through many layers).

### Typical Context use cases

- Auth user
- Theme
- Locale

### Example

```jsx
import { createContext, useContext } from 'react'

const ThemeContext = createContext('light')

function Toolbar() {
  const theme = useContext(ThemeContext)
  return <p>Theme: {theme}</p>
}

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  )
}
```

### Interview Quick Notes

- Context is useful, but avoid putting everything in one global context

---

## 14) React Router Basics

### Why routing?

Map URL paths to UI screens without full page reload.

Core pieces:

- BrowserRouter
- Routes
- Route
- Link

### Example

```jsx
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom'

function App() {
  return (
    <BrowserRouter>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
      </nav>

      <Routes>
        <Route path="/" element={<h1>Home</h1>} />
        <Route path="/about" element={<h1>About</h1>} />
      </Routes>
    </BrowserRouter>
  )
}
```

### Interview Quick Notes

- Link prevents full browser reload in SPA navigation
- Dynamic route example: /users/:id

---

## 15) API Calls and Async Patterns

### Typical Flow

1. Show loading state
2. Call API
3. Show data on success
4. Show error on failure

### Example

```jsx
function Products() {
  const [items, setItems] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    fetch('/api/products')
      .then((res) => res.json())
      .then((data) => setItems(data))
      .catch(() => setError('Failed to load products'))
      .finally(() => setLoading(false))
  }, [])

  if (loading) return <p>Loading...</p>
  if (error) return <p>{error}</p>

  return items.map((item) => <p key={item.id}>{item.title}</p>)
}
```

### Interview Quick Notes

- Always mention loading/error states
- Mention cleanup for long-running requests when relevant

---

## 16) Error Handling and UI States

Every data-driven screen should consider:

- Loading state
- Error state
- Empty state
- Success state

Example design logic:

1. If loading: show spinner/text
2. Else if error: show retry option
3. Else if no data: show empty message
4. Else: show content

This is a strong interview signal.

---

## 17) Performance Optimization

### First Principle

Do not optimize blindly. Measure first.

### Common Optimization Tools

- React.memo
- useMemo
- useCallback
- Code splitting and lazy loading
- List virtualization for very large lists

### Interview Quick Notes

- Explain trade-off: optimization can add complexity

---

## 18) Folder Structure and Project Architecture

Simple starter structure:

- src/components
- src/pages
- src/hooks
- src/services
- src/context
- src/utils

Basic guidance:

- Keep reusable UI in components
- Keep API calls in services
- Keep custom hooks in hooks folder

---

## 19) Testing Basics (Conceptual)

What to test in React apps:

- Component rendering
- User interactions
- Conditional UI
- Async behavior

Testing mindset:

- Test behavior, not implementation details

Common tools:

- Vitest or Jest
- React Testing Library

---

## 20) Interview Preparation (Deep Section)

### A) Most Common Theory Questions

1. What is React and why use it?
2. Difference between state and props?
3. What is Virtual DOM?
4. What are hooks and why introduced?
5. When does useEffect run?
6. Why keys are important in lists?
7. Controlled vs uncontrolled components?
8. How does Context API help?
9. How to optimize React performance?
10. Difference between React and Angular/Vue at high level?

### B) Strong Answer Framework

For each answer:

1. Definition (1 line)
2. Why important (1-2 lines)
3. Real example
4. Common pitfall

### C) Coding Round Expectations

Interviewers evaluate:

- Component decomposition
- Naming clarity
- State management
- Edge cases
- Loading/error handling
- Communication while coding

### D) Coding Round Checklist

1. Clarify requirements
2. Build component skeleton
3. Add state and handlers
4. Add conditional states
5. Refactor repeated logic
6. Explain tradeoffs

### E) Behavioral + Project Questions

Prepare stories for:

- Bug you solved in React app
- Performance improvement you implemented
- Refactor from large component to smaller components
- Team collaboration and code review handling

---

## 21) 30-Day Study Plan

Week 1:

- Fundamentals
- JSX
- Components
- Props
- State

Week 2:

- Events
- Conditional rendering
- Lists and keys
- Forms
- Lifting state

Week 3:

- Hooks in depth
- API calls
- Context
- Routing

Week 4:

- Performance
- Testing basics
- Interview Q and A practice
- 2 mock coding rounds

Daily routine suggestion:

1. 45 min reading
2. 45 min coding
3. 20 min explanation practice

---

## How To Run This Project

Install dependencies:

```bash
npm install
```

Start development:

```bash
npm run dev
```

Create production build:

```bash
npm run build
```

---

## Project Files

- src/App.jsx: tabbed React documentation content
- src/App.css: documentation UI styling
- src/index.css: global root setup

---

## Final Revision Checklist

- Can you explain React in simple words?
- Can you build reusable components with props?
- Can you manage state confidently?
- Can you use useEffect correctly with dependencies?
- Can you render lists with proper keys?
- Can you handle loading, empty, and error states?
- Can you explain optimization tradeoffs?
- Can you answer React basics without memorized scripts?

If all answers are yes, you are in a strong position for beginner-to-intermediate React interviews.
