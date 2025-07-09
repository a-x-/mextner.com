---
title: "TypeScript Life Hacks for React Developers"
date: 2024-03-22T14:00:00Z
draft: false
linkedin_url: https://www.linkedin.com/posts/frontdev_typescript-react-webdevelopment-activity-7295473720951795713-Kl_f
image: "/images/blog/typescript-blog-image.jpeg"
---

TypeScript is a powerhouse when combined with React, but sometimes its full potential is underused. Here are a few lesser-known TypeScript hacks that will boost your development workflow and ensure better, safer code.

### 1. as const for Defining Hook Types 🪝

When defining custom React hooks, you might often return a tuple (like an array with multiple different values) and need to define the exact types for those values. Without as const, TypeScript will infer them as more general types, like number | boolean[] instead of exact types.

Without as const, you’d need to manually define the return type of the hook:

```typescript
function useStateWithTypes() {
  return [0, false]; // TypeScript will infer this as (number | boolean)[]
}

// Manual type definition
function useStateWithTypes(): [number, boolean] {
  return [0, false];
}
```

However, with as const, TypeScript can automatically infer the exact types, making your code cleaner and safer:

```typescript
function useStateWithTypes() {
  return [0, false] as const; // TypeScript infers the exact tuple type: [0, false]
}
```

Now, useStateWithTypes returns exactly a tuple of [number, boolean], which is what you intended.

This approach is not only useful for custom React hooks but also for any function that returns a tuple, ensuring that TypeScript infers the exact types rather than a broader, less accurate type. This makes your code more predictable and reduces the risk of runtime errors.

### 2. Template Literal Types 🔠

TypeScript allows you to create types based on string patterns, and it’s an incredibly powerful feature. Use template literal types when you need structured strings (like class names or action types) with guaranteed consistency.

Example:

```typescript
type ButtonSize = 'small' | 'medium' | 'large';
type ButtonClass = `btn-${ButtonSize}`;
// ButtonClass is now 'btn-small' | 'btn-medium' | 'btn-large'
```

This ensures that strings like class names or action types always follow the correct pattern.

### 3. useRef with TypeScript ⚙️

One of the easiest ways to improve your React code is by correctly typing useRef. TypeScript’s generic typing allows you to define the exact type of the element being referenced, making DOM manipulation more predictable.

Example:

```typescript
const inputRef = useRef<HTMLInputElement>(null);
// Now TypeScript knows inputRef is of type HTMLInputElement, not just 'null | undefined'
```

This adds a layer of safety and helps avoid errors when interacting with the DOM.

By using as const, template literal types, and typing useRef correctly, you can ensure your React code is both safer and more maintainable. These small adjustments can make a huge impact on your TypeScript experience!

What TypeScript tricks do you find most helpful in your React projects? Let’s chat in the comments! 👇
