# Lab 1: HTML5 Document Structure and Semantics

**Course:** CSC4035 Web Programming and Technologies
**Estimated Time:** 1.5–2 hours
**Weight:** 1% of final grade

---

## Purpose

This lab introduces you to creating well-structured, semantic HTML5 documents. You will build a personal portfolio page that demonstrates proper document structure, semantic elements, and accessibility fundamentals.

---

## Learning Outcomes

By completing this lab, you will be able to:

1. Create a valid HTML5 document with correct doctype, head, and body structure
2. Apply semantic HTML5 elements (`<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<footer>`) appropriately
3. Implement accessible form elements with proper labels and attributes
4. Validate HTML documents using W3C validation tools
5. Structure content hierarchically using appropriate heading levels

---

## Your Assignment

Build a **personal portfolio page** that showcases your skills as a developer. Follow the tasks below to create a well-structured, semantic HTML5 document.

---

## Prerequisites

1. **Text Editor:** VS Code with "Live Server" extension
2. **Browser:** Google Chrome (latest version)
3. **Validation Tool:** https://validator.w3.org/

---

## Tasks

### Task 1: Document Structure (15 minutes)

1. Open `index.html` in VS Code
2. Add the HTML5 doctype declaration: `<!DOCTYPE html>`
3. Create the basic structure: `<html>`, `<head>`, `<body>`
4. Set `lang="en"` on the `<html>` element
5. Add meta tags:
   - `<meta charset="UTF-8">`
   - `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
6. Add a meaningful `<title>`

### Task 2: Semantic Header and Navigation (20 minutes)

1. Create a `<header>` with:
   - Your name in an `<h1>`
   - A tagline in a `<p>`
2. Create a `<nav>` with an unordered list containing 4+ links:
   - About (`#about`)
   - Skills (`#skills`)
   - Projects (`#projects`)
   - Contact (`#contact`)

### Task 3: Main Content Sections (30 minutes)

Create a `<main>` element with these sections:

**About (`id="about"`):**
- `<h2>` heading
- 2+ paragraphs
- One `<img>` with `alt` text

**Skills (`id="skills"`):**
- `<h2>` heading
- Unordered list with 6+ skills
- Use `<strong>` or `<em>` for emphasis

**Projects (`id="projects"`):**
- `<h2>` heading
- 2+ `<article>` elements, each with:
  - `<h3>` title
  - `<p>` description
  - Link (can use `#` as placeholder)

### Task 4: Contact Form (25 minutes)

In the Contact section (`id="contact"`):

1. Create a `<form action="#" method="post">`
2. Add these fields with proper `<label>` elements:
   - Name (text input, required)
   - Email (email input, required)
   - Subject (select with 3+ options)
   - Message (textarea, required)
   - Submit button
3. Each input needs:
   - `id` attribute
   - `name` attribute
   - Matching `<label for="...">`

### Task 5: Footer (10 minutes)

Create a `<footer>` with:
- Copyright notice (e.g., "© 2026 Your Name")
- Unordered list with 3+ social media links

### Task 6: Validation (15 minutes)

1. Go to https://validator.w3.org/
2. Use "Validate by Direct Input"
3. Paste your HTML and fix ALL errors
4. Take a screenshot showing "no errors"
5. Save as `validation-screenshot.png`

---

## Required Deliverables

| File | Description |
|------|-------------|
| `index.html` | Your completed portfolio page |
| `validation-screenshot.png` | Screenshot showing W3C validation with no errors |
| `reflection.txt` | 3-5 sentences on what you learned (20+ words) |

---

## Grading

Your grade is calculated from:
- **Visible Tests (40%):** Run automatically on every push
- **Hidden Tests (30%):** Run after the deadline
- **Code Quality (20%):** Manual review
- **Plagiarism Check:** High similarity may result in penalties

Check your visible test results in the "Actions" tab of your repository.

---

## Submission

1. Complete all tasks
2. Commit your changes: `git add . && git commit -m "Complete Lab 1"`
3. Push to GitHub: `git push`
4. Verify tests pass in the Actions tab

---

## Academic Integrity

- **Allowed:** Course materials, MDN, W3Schools
- **Allowed:** Discussing concepts with classmates
- **NOT Allowed:** Copying code from others
- **NOT Allowed:** Using AI to generate solutions

All submissions are checked with plagiarism detection tools.

---

## Resources

- [MDN HTML Reference](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [W3C HTML Validator](https://validator.w3.org/)
- [HTML5 Semantic Elements](https://developer.mozilla.org/en-US/docs/Glossary/Semantics#semantics_in_html)
