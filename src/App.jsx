import { useMemo, useState } from 'react'
import './App.css'

const sections = [
  {
    id: 'what-is-react',
    tab: 'What Is React?',
    title: '1) What Is React and Why It Is Popular',
    theory: [
      'React is a JavaScript library for building user interfaces. It helps you split a UI into reusable components and update only the parts that change.',
      'The big idea is declarative UI. You describe how the UI should look for a given state, and React handles updating the real browser DOM efficiently.',
      'React is used heavily in industry because component reuse improves maintainability, and the ecosystem (routing, state tools, testing) is mature.',
    ],
    interview: [
      'React is a library, not a full framework. It focuses on the view layer.',
      'React uses a Virtual DOM to compare old and new UI trees before applying minimal updates to the real DOM.',
      'The core pattern is one-way data flow: parent passes data down to child through props.',
    ],
    codeLabel: 'Minimal React component',
    code: `function Welcome() {
  return <h1>Hello, React learner!</h1>
}

export default Welcome`,
  },
  {
    id: 'jsx',
    tab: 'JSX',
    title: '2) JSX: Writing UI in JavaScript',
    theory: [
      'JSX is a syntax extension that lets you write HTML-like code inside JavaScript. It is not HTML; it gets compiled into React.createElement calls.',
      'You can embed JavaScript inside JSX using curly braces {}. This is how dynamic values appear in your UI.',
      'Every JSX tag must be properly closed, and components must return a single parent element (or a fragment).',
    ],
    interview: [
      'Browsers do not understand JSX directly; tools like Vite/Babel transform it.',
      'Use className instead of class in JSX.',
      'Inline styles in JSX are objects, for example style={{ color: "tomato" }}.',
    ],
    codeLabel: 'JSX with JavaScript expression',
    code: `function Greeting() {
  const name = 'Aftab'
  const isMorning = true

  return (
    <p>
      Good {isMorning ? 'morning' : 'evening'}, {name}
    </p>
  )
}`,
  },
  {
    id: 'components-props',
    tab: 'Components & Props',
    title: '3) Components and Props in Detail',
    theory: [
      'A component is a reusable piece of UI logic. You can create small components and combine them into larger pages.',
      'Props (properties) are read-only inputs passed from parent to child. Think of props as function arguments for components.',
      'Good component design means each component has a single clear responsibility and predictable inputs/outputs.',
    ],
    interview: [
      'Props are immutable inside child components. If data must change, parent updates and sends new props.',
      'Use descriptive prop names and default values to reduce bugs.',
      'Children prop allows nesting UI inside reusable wrapper components.',
    ],
    codeLabel: 'Parent to child data flow with props',
    code: `function UserCard({ name, role }) {
  return (
    <article>
      <h3>{name}</h3>
      <p>{role}</p>
    </article>
  )
}

function App() {
  return <UserCard name="Aisha" role="Frontend Developer" />
}`,
  },
  {
    id: 'state-events',
    tab: 'State & Events',
    title: '4) State and Event Handling',
    theory: [
      'State is component-owned data that changes over time and triggers re-rendering.',
      'The useState Hook gives you a state value and a setter function. Calling the setter schedules a UI update.',
      'Events in React (onClick, onChange, onSubmit) are how users interact with stateful UI.',
    ],
    interview: [
      'setState in React is asynchronous from your perspective; do not assume state changed immediately in the same line.',
      'If next state depends on previous state, use functional updates: setCount((prev) => prev + 1).',
      'Controlled inputs bind value to state and update via onChange.',
    ],
    codeLabel: 'State update based on previous value',
    code: `import { useState } from 'react'

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount((prev) => prev + 1)}>
        Increment
      </button>
    </div>
  )
}`,
  },
  {
    id: 'hooks-effects',
    tab: 'Hooks & Effects',
    title: '5) Hooks: useEffect, useMemo, useRef',
    theory: [
      'Hooks let functional components use features like state, side effects, memoization, and refs.',
      'useEffect runs side effects (API calls, subscriptions, timers) after rendering. Dependency arrays control when effects re-run.',
      'useMemo memoizes expensive computed values; useRef stores mutable values that do not trigger re-renders.',
    ],
    interview: [
      'Missing dependencies in useEffect can create stale values and bugs.',
      'Cleanup functions in useEffect prevent memory leaks (for example clearInterval or unsubscribe).',
      'useMemo is a performance optimization, not a correctness tool.',
    ],
    codeLabel: 'Fetching data with useEffect and cleanup pattern',
    code: `import { useEffect, useState } from 'react'

function Users() {
  const [users, setUsers] = useState([])

  useEffect(() => {
    let isMounted = true

    async function loadUsers() {
      const response = await fetch('https://jsonplaceholder.typicode.com/users')
      const data = await response.json()
      if (isMounted) setUsers(data)
    }

    loadUsers()
    return () => {
      isMounted = false
    }
  }, [])

  return users.map((user) => <p key={user.id}>{user.name}</p>)
}`,
  },
  {
    id: 'rendering-lists',
    tab: 'Rendering & Lists',
    title: '6) Conditional Rendering and Lists',
    theory: [
      'Conditional rendering means showing different UI based on state or props. Common patterns are if statements, ternary operators, and logical &&.',
      'Lists are rendered with map(). Each list item needs a stable key so React can track which item changed, moved, or was removed.',
      'Never use array index as key if list order can change. It can cause UI bugs and incorrect state preservation.',
    ],
    interview: [
      'A key should uniquely identify an item across renders, ideally from database id.',
      'Conditional rendering keeps UI declarative and reduces direct DOM manipulation.',
      'Returning null from a component means render nothing for that branch.',
    ],
    codeLabel: 'Render list items with stable keys',
    code: `function TodoList({ todos }) {
  if (!todos.length) return <p>No tasks yet.</p>

  return (
    <ul>
      {todos.map((todo) => (
        <li key={todo.id}>{todo.title}</li>
      ))}
    </ul>
  )
}`,
  },
  {
    id: 'forms',
    tab: 'Forms',
    title: '7) Forms in React (Controlled Inputs)',
    theory: [
      'A controlled input means React state is the single source of truth for input value.',
      'You read input changes through onChange and update state, which re-renders the input with the latest value.',
      'This pattern is predictable and ideal for validation, formatting, and conditional UI behavior.',
    ],
    interview: [
      'Controlled inputs are easier to validate and debug than uncontrolled inputs.',
      'Use one state object for larger forms to keep related fields together.',
      'Always prevent default form submission when handling submit in client-side apps.',
    ],
    codeLabel: 'Simple controlled form example',
    code: `import { useState } from 'react'

function SignupForm() {
  const [form, setForm] = useState({ name: '', email: '' })

  function handleChange(event) {
    const { name, value } = event.target
    setForm((prev) => ({ ...prev, [name]: value }))
  }

  function handleSubmit(event) {
    event.preventDefault()
    console.log('Submitted:', form)
  }

  return (
    <form onSubmit={handleSubmit}>
      <input name="name" value={form.name} onChange={handleChange} />
      <input name="email" value={form.email} onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  )
}`,
  },
  {
    id: 'context',
    tab: 'Context API',
    title: '8) Context API for Shared Data',
    theory: [
      'Context helps share data across many components without manually passing props through every level (prop drilling).',
      'Typical use cases: authenticated user, theme, language, and app-wide preferences.',
      'Use context carefully. Very frequent updates in a global context can cause unnecessary re-renders.',
    ],
    interview: [
      'Context is not a full replacement for all state management needs.',
      'Split contexts by concern (for example AuthContext and ThemeContext) for better performance.',
      'Custom hooks around useContext improve readability and enforce provider usage.',
    ],
    codeLabel: 'Creating and consuming context',
    code: `import { createContext, useContext } from 'react'

const ThemeContext = createContext('light')

function Toolbar() {
  const theme = useContext(ThemeContext)
  return <p>Active theme: {theme}</p>
}

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  )
}`,
  },
  {
    id: 'routing',
    tab: 'Routing',
    title: '9) Client-Side Routing with React Router',
    theory: [
      'Routing maps URLs to components so users can navigate between pages without full browser reload.',
      'React Router is the most common routing library in React projects.',
      'You define route paths and corresponding elements, then use Link for navigation.',
    ],
    interview: [
      'Difference: Link prevents full page refresh unlike a normal anchor tag in SPA routes.',
      'Dynamic routes like /users/:id capture URL parameters.',
      'Nested routes help structure layouts and child pages cleanly.',
    ],
    codeLabel: 'Basic route setup',
    code: `import { BrowserRouter, Routes, Route, Link } from 'react-router-dom'

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
}`,
  },
  {
    id: 'performance',
    tab: 'Performance',
    title: '10) Performance Basics for React Apps',
    theory: [
      'Performance starts with component design: keep components focused and avoid unnecessary re-renders.',
      'React.memo can skip re-rendering when props are unchanged.',
      'Use code splitting and lazy loading to reduce initial bundle size for faster first load.',
    ],
    interview: [
      'Measure first, optimize second. Use React DevTools profiler.',
      'Premature memoization can add complexity and hurt readability.',
      'Large lists should use virtualization techniques.',
    ],
    codeLabel: 'Memoized child component',
    code: `import { memo, useState } from 'react'

const Greeting = memo(function Greeting({ name }) {
  return <p>Hello, {name}</p>
})

function App() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <Greeting name="Learner" />
      <button onClick={() => setCount((c) => c + 1)}>Count {count}</button>
    </div>
  )
}`,
  },
  {
    id: 'interview-prep',
    tab: 'Interview Prep',
    title: '11) React Interview Preparation Guide',
    theory: [
      'Interviewers usually test clarity of fundamentals: component thinking, state management, rendering behavior, and real-world debugging.',
      'A strong answer structure: define the concept, explain why it matters, give one practical example, and mention one common mistake.',
      'Practice speaking in simple language. If you can teach a concept to a beginner, your interview answer becomes stronger.',
    ],
    interview: [
      'Common questions: difference between state and props, when useEffect runs, key prop importance, controlled vs uncontrolled inputs.',
      'Behavioral angle: explain one project decision where you split a large component into smaller reusable parts.',
      'Coding round tip: communicate before coding, create small components, and handle loading/error states.',
    ],
    codeLabel: 'Interview-friendly component with loading and error states',
    code: `function ProductList() {
  const [products, setProducts] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    fetch('/api/products')
      .then((res) => res.json())
      .then((data) => setProducts(data))
      .catch(() => setError('Could not load products'))
      .finally(() => setLoading(false))
  }, [])

  if (loading) return <p>Loading...</p>
  if (error) return <p>{error}</p>

  return products.map((item) => <p key={item.id}>{item.title}</p>)
}`,
  },
]

function App() {
  const [activeSectionId, setActiveSectionId] = useState(sections[0].id)

  const activeSection = useMemo(
    () => sections.find((section) => section.id === activeSectionId) ?? sections[0],
    [activeSectionId],
  )

  return (
    <div className="page">
      <header className="hero">
        <p className="eyebrow">React Learning Hub</p>
        <h1>React Documentation for Absolute Beginners</h1>
        <p className="hero-text">
          Learn React step by step with simple theory, clear code examples, and
          interview-friendly explanations.
        </p>
      </header>

      <nav className="tabs" aria-label="Documentation sections">
        {sections.map((section) => (
          <button
            key={section.id}
            type="button"
            className={section.id === activeSection.id ? 'tab active' : 'tab'}
            onClick={() => setActiveSectionId(section.id)}
          >
            {section.tab}
          </button>
        ))}
      </nav>

      <main className="content" aria-live="polite">
        <article className="card">
          <h2>{activeSection.title}</h2>
          <h3>Theory (Simple Explanation)</h3>
          <ul>
            {activeSection.theory.map((point) => (
              <li key={point}>{point}</li>
            ))}
          </ul>

          <h3>Code Example</h3>
          <p className="code-label">{activeSection.codeLabel}</p>
          <pre>
            <code>{activeSection.code}</code>
          </pre>

          <h3>Interview Notes</h3>
          <ul>
            {activeSection.interview.map((point) => (
              <li key={point}>{point}</li>
            ))}
          </ul>
        </article>

        <aside className="card quick-guide">
          <h2>Quick Revision Checklist</h2>
          <ul>
            <li>Can you explain React in one sentence?</li>
            <li>Do you know when to use state vs props?</li>
            <li>Can you explain useEffect dependencies clearly?</li>
            <li>Do you always use stable keys in lists?</li>
            <li>Can you show loading, error, and success UI states?</li>
          </ul>

          <h3>Practice Prompt</h3>
          <p>
            Build a small Todo app with add, delete, and filter features. While
            building, explain each React concept aloud as if teaching a beginner.
          </p>
        </aside>
      </main>

      <footer className="footer">
        <p>
          Tip: Spend 30 minutes daily reviewing one tab and rewriting one code
          example from memory.
        </p>
      </footer>
    </div>
  )
}

export default App
