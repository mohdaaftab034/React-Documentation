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

1. [React Fundamentals and Mental Model](#topic-1-react-fundamentals-and-mental-model)
2. [JSX in Depth](#topic-2-jsx-in-depth)
3. [Components in Depth](#topic-3-components-in-depth)
4. [Props in Depth](#topic-4-props-in-depth)
5. [State in Depth](#topic-5-state-in-depth)
6. [Events in React](#topic-6-events-in-react)
7. [Lifecycle and Rendering Cycle](#topic-7-lifecycle-and-rendering-cycle)
8. [Hooks (useState, useEffect, useMemo, useRef, useCallback)](#topic-8-hooks-in-depth)
9. [Conditional Rendering](#topic-9-conditional-rendering)
10. [Lists and Keys](#topic-10-lists-and-keys)
11. [Forms (Controlled and Uncontrolled)](#topic-11-forms-controlled-and-uncontrolled)
12. [State Lifting and Shared State](#topic-12-state-lifting-and-shared-state)
13. [Context API](#topic-13-context-api)
14. [React Router Basics](#topic-14-react-router-basics)
15. [API Calls and Async Patterns](#topic-15-api-calls-and-async-patterns)
16. [Error Handling and UI States](#topic-16-error-handling-and-ui-states)
17. [Performance Optimization](#topic-17-performance-optimization)
18. [Folder Structure and Project Architecture](#topic-18-folder-structure-and-project-architecture)
19. [Testing Basics (Conceptual)](#topic-19-testing-basics-conceptual)
20. [Interview Preparation (Theory + Practical)](#topic-20-interview-preparation-deep-section)
21. [30-Day Study Plan](#topic-21-30-day-study-plan)

---

<a id="topic-1-react-fundamentals-and-mental-model"></a>

## 1) React Fundamentals and Mental Model

### What is React?

React is a JavaScript library used to build interactive user interfaces.

React helps you:

- Break UI into reusable components
- Connect UI to data (state)
- Update only what changed

### Deep Theory: How React Changes The Way You Think

Before React, developers often wrote UI code as a sequence of instructions:

- find element
- update text
- hide/show node
- sync multiple elements manually

This style becomes fragile as applications grow, because each new feature adds more manual synchronization work.

React introduces a state-driven model:

- UI is a function of state
- if state changes, UI should naturally recalculate

This mental model reduces hidden side effects. Instead of asking "which DOM node should I edit now?", you ask "what should the UI look like for this state?".

At a higher level, React gives three major engineering advantages:

1. Predictability: same input state gives same UI output
2. Reusability: components can be reused across pages and products
3. Maintainability: teams can reason in isolated components instead of one giant DOM script

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

Important clarification:

- Virtual DOM is not automatically "always fast"
- It is a strategy to reduce expensive direct DOM operations
- Real performance depends on component design, state structure, and rendering patterns

In interviews, explain both benefit and limitation. Strong candidates avoid absolute claims like "Virtual DOM is always faster" and instead discuss practical tradeoffs.

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

<a id="topic-2-jsx-in-depth"></a>

## 2) JSX in Depth

### What is JSX?

JSX is syntax that looks like HTML inside JavaScript.

Important:

- JSX is not HTML
- JSX gets transformed into JavaScript calls

### Why JSX?

- Makes component UI easier to read
- Keeps markup and logic in one place

### Deep Theory: JSX as a UI Description Language

JSX is best understood as syntax sugar for building element objects.

When you write:

```jsx
<h1>Hello</h1>
```

the build tool transforms it into function calls that describe element type, props, and children.

This means JSX is not a template engine in the traditional sense. It is JavaScript-friendly UI notation.

Benefits of this design:

- full JavaScript power in rendering logic
- easier refactoring because UI and logic share one language
- excellent editor tooling (linting, autocomplete, type hints in TS projects)

Common beginner confusion:

- "Why can we use JavaScript in HTML?"

Better framing:

- You are not writing JavaScript inside HTML.
- You are writing a JavaScript expression that looks like HTML.

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

<a id="topic-3-components-in-depth"></a>

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

### Deep Theory: Component Boundaries and Responsibility

A component boundary is where you decide:

- what data comes in
- what UI goes out
- what logic stays internal

Good component design follows single responsibility:

- one component should solve one clear UI problem

Signs a component is too large:

- too many unrelated states
- very long render block
- repeated conditional branches
- difficult to reuse outside one page

Refactoring approach:

1. Identify repeated UI pattern
2. Extract into child component
3. Pass minimum required props
4. Keep side effects near data ownership

This theory is important in interviews because architecture quality is often judged through component decomposition.

### Interview Quick Notes

- Components are building blocks of React apps
- Composition is preferred over inheritance in React

---

<a id="topic-4-props-in-depth"></a>

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

### Deep Theory: Data Contract Between Components

Props represent a contract.

Parent promises:

- to provide required data in expected shape

Child promises:

- to render UI based on given props without mutating them

Why immutability matters:

- predictable updates
- easier debugging
- safer component reuse

Advanced practical idea:

- think of props as "configuration + data".
- configuration props: variant, size, disabled
- data props: user, product, count

This distinction helps design cleaner APIs for reusable components.

### Interview Quick Notes

- Props are immutable in child
- Data generally flows parent to child

---

<a id="topic-5-state-in-depth"></a>

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

### Deep Theory: State Granularity and Source of Truth

State should represent the smallest meaningful set of changing data.

Two common mistakes:

1. Over-storing state: storing values that can be derived from existing state
2. Under-structuring state: splitting tightly related values in confusing places

Rule of thumb:

- if you can compute a value during render from existing state/props, do not store it as separate state

Example:

- store raw items list
- compute filtered list from search query

Why this matters:

- fewer bugs from out-of-sync values
- simpler update logic
- easier reasoning during interviews and debugging

### Interview Quick Notes

- State is internal mutable data
- Props are external read-only inputs

---

<a id="topic-6-events-in-react"></a>

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

### Deep Theory: Event Flow and UI Intent

An event handler translates user intent into state transition.

Conceptually:

- user clicks button -> handler executes -> state changes -> UI re-renders

This makes events the bridge between interaction and state-driven rendering.

Design advice:

- keep handlers focused on one action
- move complex business logic to helper functions or custom hooks
- name handlers by intent: handleSubmit, handleDelete, handleFilterChange

In interviews, clean event naming and focused handlers signal maturity.

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

<a id="topic-7-lifecycle-and-rendering-cycle"></a>

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

### Deep Theory: Render vs Commit

React work is commonly understood in two broad stages:

1. Render stage: React calculates what should change
2. Commit stage: React applies actual DOM updates

Effects (useEffect) run after commit, which is why they are suitable for side effects like logging, subscriptions, or API operations.

Key insight:

- Rendering is calculation
- Effects are synchronization with external world

Keeping these concerns separate leads to cleaner components.

---

<a id="topic-8-hooks-in-depth"></a>

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

### Deep Theory: Why Hook Rules Exist

React tracks hook state by call order.

If hook calls happen conditionally, order can change between renders and React can no longer match previous hook state correctly.

That is why these rules are strict.

Custom hooks theory:

- custom hook is a reusable stateful logic unit
- it is not a special React feature in runtime; it is a function that uses hooks consistently
- naming with `use` prefix helps lint rules and team conventions

When to create a custom hook:

- same effect/state logic repeats across components
- component becomes hard to read due to logic noise

### Interview Quick Notes

- Most asked hook: useEffect
- Explain dependency array and cleanup clearly

---

<a id="topic-9-conditional-rendering"></a>

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

### Deep Theory: UI as a Set of States

A robust UI is usually a finite set of clear states:

- loading
- success
- empty
- error
- unauthorized

Conditional rendering should explicitly map each state to UI.

This approach prevents ambiguous screens and missing edge cases.

In real projects, state modeling quality directly affects user trust and usability.

---

<a id="topic-10-lists-and-keys"></a>

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

### Deep Theory: Identity vs Position

React needs identity, not position, to preserve component instances correctly.

If you use index as key and list order changes:

- React may attach previous state to wrong item
- input values can appear in incorrect rows
- animations and focus behavior can break

Therefore, always choose keys tied to stable business identity (id, slug, uuid).

---

<a id="topic-11-forms-controlled-and-uncontrolled"></a>

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

### Deep Theory: Form Architecture and Validation Strategy

Forms are state machines in practice.

Each field can be:

- untouched
- touched
- valid
- invalid

Better form UX comes from tracking not only values but also validation/touched state.

Validation strategies:

- immediate validation (onChange)
- delayed validation (onBlur)
- submit-time validation

Production recommendation:

- show helpful error messages
- keep validation rules consistent between client and server
- never trust only frontend validation for security

---

<a id="topic-12-state-lifting-and-shared-state"></a>

## 12) State Lifting and Shared State

### Why lift state?

When sibling components need same data, move state to nearest common parent.

Pattern:

1. Parent owns state
2. Parent passes data and handlers as props
3. Children become controlled by parent state

### Interview Quick Notes

- Lifting state keeps data synchronized

### Deep Theory: Choosing State Location

A frequent architecture decision is "Where should this state live?"

Use this hierarchy:

1. Keep state local if only one component needs it
2. Lift state to nearest common parent if siblings need it
3. Use context/global store only when many distant components need shared access

This minimizes unnecessary coupling and improves maintainability.

---

<a id="topic-13-context-api"></a>

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

### Deep Theory: Context and Re-render Behavior

When context value changes, all consumers using that context can re-render.

Implications:

- large frequently changing context values can hurt performance
- separating context by concern can reduce unnecessary updates

Practical pattern:

- split read-heavy static values and frequently updated values into separate contexts
- memoize provider value objects when necessary

Context is a transport mechanism for shared values, not a full state management strategy by itself.

---

<a id="topic-14-react-router-basics"></a>

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

### Deep Theory: URL as Application State

Routing is not only page switching; URL itself is state.

Why this matters:

- users can bookmark/share exact app location
- browser back/forward works naturally
- deep linking improves UX and SEO-related discoverability in broader architectures

A good route design is predictable and semantic:

- `/products` for list
- `/products/:id` for detail
- `/account/settings` for nested sections

---

<a id="topic-15-api-calls-and-async-patterns"></a>

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

### Deep Theory: Async Consistency and Race Conditions

Async UI can fail in subtle ways when multiple requests overlap.

Example race:

- user types query A
- request A starts
- user types query B
- request B starts and finishes first
- request A finishes later and overwrites newer data

Solutions include request cancellation or stale-response guards.

Also separate these concerns clearly:

- fetching data
- mapping/normalizing data
- presenting data in UI

Clear separation keeps components readable and testable.

---

<a id="topic-16-error-handling-and-ui-states"></a>

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

### Deep Theory: Trustworthy Interfaces

Users trust apps that explain what is happening.

Error handling is not only technical correctness; it is communication design.

Good error UX includes:

- clear message in plain language
- optional retry action
- preserved context (do not lose user work)
- actionable next step when possible

From engineering perspective, model errors by category:

- network errors
- validation errors
- permission/auth errors
- server/internal errors

Each category should map to meaningful UI behavior.

---

<a id="topic-17-performance-optimization"></a>

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

### Deep Theory: Performance as a Product Concern

Performance is user experience, not only technical score.

Users care about:

- time to first useful content
- responsiveness after interaction
- smooth scrolling and transitions

Optimization order of priority:

1. avoid unnecessary re-renders through clean state design
2. split heavy UI into smaller components
3. memoize only proven hotspots
4. reduce network and bundle overhead

In interviews, the strongest answer includes measurement tools, bottleneck identification, and targeted optimization rather than generic tips.

---

<a id="topic-18-folder-structure-and-project-architecture"></a>

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

### Deep Theory: Architecture as a Scaling Tool

Folder structure is not just organization; it controls how easily a codebase grows.

Poor structure creates hidden costs:

- duplicated logic across pages
- hard-to-find business rules
- mixed responsibilities in one file

Good structure enforces boundaries:

- UI layer: rendering and interaction
- data layer: API calls and transformations
- logic layer: hooks and reusable state behavior

As teams grow, architecture quality directly affects onboarding speed and bug rate.

Practical guideline:

- organize by feature when project becomes large
- keep shared primitives in common folders
- avoid over-engineering early; evolve structure with product complexity

---

<a id="topic-19-testing-basics-conceptual"></a>

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

### Deep Theory: Confidence Through Behavior Testing

Testing in React should mimic user behavior, not internal implementation details.

Weak test style:

- checking internal state variables directly
- coupling tests to component internals

Strong test style:

- render component
- perform user action
- assert visible outcome

This keeps tests resilient during refactoring.

Testing pyramid in frontend context:

1. Unit tests for utility logic
2. Component tests for UI behavior
3. Integration tests for user flows

A balanced strategy provides confidence without slowing development.

---

<a id="topic-20-interview-preparation-deep-section"></a>

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

### F) Deep Theory: What Interviewers Actually Measure

Interviews usually evaluate three layers simultaneously:

1. Conceptual depth: do you understand why React patterns exist?
2. Implementation clarity: can you convert theory into clean code?
3. Engineering judgment: can you choose the right tradeoff under constraints?

High-quality answers usually include:

- clear mental model
- concrete example from practice
- limitations or caveats

Example of mature answer style:

- "I use context for widely shared values like auth/theme, but if updates are frequent and complex, I consider a dedicated state solution to avoid over-rendering and improve maintainability."

This style demonstrates both practical and theoretical understanding.

---

<a id="topic-21-30-day-study-plan"></a>

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

### Deep Theory: Why This Study Plan Works

This plan is designed around active learning principles.

Reading alone creates recognition, not mastery.

Coding adds application, and explanation practice builds recall and interview fluency.

Learning loop each day:

1. Input: read and understand concept
2. Output: implement example from memory
3. Reflection: explain concept aloud in simple words

If you can explain a topic clearly without looking at notes, your understanding is deep.

Weekly retrospective questions:

- Which concept still feels confusing?
- Which bug pattern repeated this week?
- Which interview question took too long to answer?

Use answers to adjust next week priorities.

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
