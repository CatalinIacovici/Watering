# Watering

This project was generated using [Angular CLI](https://github.com/angular/angular-cli) version 20.3.10.

## Development server

To start a local development server, run:

```bash
ng serve
```

Once the server is running, open your browser and navigate to `http://localhost:4200/`. The application will automatically reload whenever you modify any of the source files.

## Code scaffolding

Angular CLI includes powerful code scaffolding tools. To generate a new component, run:

```bash
ng generate component component-name
```

For a complete list of available schematics (such as `components`, `directives`, or `pipes`), run:

```bash
ng generate --help
```

## Building

To build the project run:

```bash
ng build
```

This will compile your project and store the build artifacts in the `dist/` directory. By default, the production build optimizes your application for performance and speed.

## Running unit tests

To execute unit tests with the [Karma](https://karma-runner.github.io) test runner, use the following command:

```bash
ng test
```

## Running end-to-end tests

For end-to-end (e2e) testing, run:

```bash
ng e2e
```

Angular CLI does not come with an end-to-end testing framework by default. You can choose one that suits your needs.

## Component Architecture & Best Practices

This project follows a strict component architecture pattern to ensure consistency and maintainability:

### Component Standards

All components in this project **MUST** follow these guidelines:

#### 1. Standalone Components
- ✅ All components must be standalone (no NgModules)
- Use `standalone: true` (default in Angular 20+)

#### 2. File Structure
- ✅ **Separate files** for template, styles, and TypeScript
- ❌ No inline templates or inline styles
- Structure: `component-name.ts`, `component-name.html`, `component-name.scss`

#### 3. Change Detection
- ✅ Always use `ChangeDetectionStrategy.OnPush`
- Improves performance and enforces immutability patterns

#### 4. View Encapsulation
- ✅ Explicitly declare `ViewEncapsulation.Emulated` (default)
- Ensures style isolation between components

#### 5. Styling
- ✅ Use SCSS for all component styles
- Leverage global CSS variables defined in `src/styles.scss`
- Follow BEM naming convention for CSS classes

### Component Generation Command

```bash
ng generate component components/<component-name> \
  --standalone \
  --inline-template=false \
  --inline-style=false \
  --style=scss \
  --skip-tests
```

### Example Component Structure

```typescript
import { Component, ChangeDetectionStrategy, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'app-example',
  imports: [],
  templateUrl: './example.html',
  styleUrl: './example.scss',
  changeDetection: ChangeDetectionStrategy.OnPush,
  encapsulation: ViewEncapsulation.Emulated
})
export class ExampleComponent {
  // Component logic here
}
```

### Global Styles

Global CSS variables and utilities are available in `src/styles.scss`:
- Color scheme: `--primary-color`, `--text-primary`, etc.
- Shadows: `--card-shadow`, `--card-shadow-hover`
- Utility classes: `.container`, `.text-center`, margin utilities

## Additional Resources

For more information on using the Angular CLI, including detailed command references, visit the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.
