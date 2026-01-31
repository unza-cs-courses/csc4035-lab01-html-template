/**
 * Lab 1: HTML5 Document Structure - Visible Test Suite
 * CSC4035 Web Programming and Technologies
 *
 * These tests run on every push via GitHub Actions.
 * Additional hidden tests will run after the deadline.
 *
 * DO NOT MODIFY THIS FILE
 * Run with: npm test
 */

const fs = require('fs');
const path = require('path');

// Test counter
let passed = 0;
let failed = 0;

function test(name, fn) {
    try {
        fn();
        console.log(`  PASS: ${name}`);
        passed++;
    } catch (e) {
        console.log(`  FAIL: ${name}`);
        console.log(`        Error: ${e.message}`);
        failed++;
    }
}

function assertTrue(value, message = '') {
    if (value !== true) {
        throw new Error(`Expected true. ${message}`);
    }
}

function assertFalse(value, message = '') {
    if (value !== false) {
        throw new Error(`Expected false. ${message}`);
    }
}

function assertEqual(actual, expected, message = '') {
    if (actual !== expected) {
        throw new Error(`Expected "${expected}", got "${actual}". ${message}`);
    }
}

function assertGreaterOrEqual(actual, expected, message = '') {
    if (actual < expected) {
        throw new Error(`Expected at least ${expected}, got ${actual}. ${message}`);
    }
}

// Read HTML file
const htmlPath = path.join(__dirname, '../../index.html');
let htmlContent = '';

try {
    htmlContent = fs.readFileSync(htmlPath, 'utf8');
} catch (e) {
    console.error('ERROR: Cannot read index.html');
    console.log('FINAL SCORE: 0 / 100');
    process.exit(1);
}

const htmlLower = htmlContent.toLowerCase();

console.log('\n==========================================');
console.log('Lab 1: HTML5 Document Structure');
console.log('Visible Test Suite (Node.js)');
console.log('==========================================\n');

// ============================================
// Document Structure Tests (15 points)
// ============================================
console.log('--- Document Structure (15 points) ---');

test('HTML5 doctype should be present', () => {
    assertTrue(htmlLower.includes('<!doctype html>'), 'Missing <!DOCTYPE html>');
});

test('HTML element should have lang="en" attribute', () => {
    const hasLang = htmlContent.includes('lang="en"') || htmlContent.includes("lang='en'");
    assertTrue(hasLang, 'Missing lang="en" on html element');
});

test('Meta charset UTF-8 should be present', () => {
    assertTrue(htmlLower.includes('charset') && htmlLower.includes('utf-8'), 'Missing charset UTF-8');
});

test('Viewport meta tag should be present', () => {
    assertTrue(htmlLower.includes('viewport'), 'Missing viewport meta tag');
});

test('Title element should be present', () => {
    assertTrue(htmlLower.includes('<title>') && htmlLower.includes('</title>'), 'Missing title element');
});

// ============================================
// Semantic Elements Tests (25 points)
// ============================================
console.log('\n--- Semantic Elements (25 points) ---');

test('Header element should be present', () => {
    assertTrue(htmlLower.includes('<header'), 'Missing <header> element');
});

test('Nav element should be present', () => {
    assertTrue(htmlLower.includes('<nav'), 'Missing <nav> element');
});

test('Main element should be present', () => {
    assertTrue(htmlLower.includes('<main'), 'Missing <main> element');
});

test('Section elements should be present', () => {
    assertTrue(htmlLower.includes('<section'), 'Missing <section> element');
});

test('Article element should be present', () => {
    assertTrue(htmlLower.includes('<article'), 'Missing <article> element');
});

test('Footer element should be present', () => {
    assertTrue(htmlLower.includes('<footer'), 'Missing <footer> element');
});

// ============================================
// Heading Hierarchy Tests (15 points)
// ============================================
console.log('\n--- Heading Hierarchy (15 points) ---');

test('Single h1 element should be present', () => {
    const h1Count = (htmlLower.match(/<h1/g) || []).length;
    assertEqual(h1Count, 1, 'Should have exactly one h1 element');
});

test('h2 elements should be present', () => {
    const h2Count = (htmlLower.match(/<h2/g) || []).length;
    assertGreaterOrEqual(h2Count, 1, 'Should have at least one h2 element');
});

test('h3 elements should be present', () => {
    const h3Count = (htmlLower.match(/<h3/g) || []).length;
    assertGreaterOrEqual(h3Count, 1, 'Should have at least one h3 element');
});

// ============================================
// Form Implementation Tests (20 points)
// ============================================
console.log('\n--- Form Implementation (20 points) ---');

test('Form element should be present', () => {
    assertTrue(htmlLower.includes('<form'), 'Missing <form> element');
});

test('At least 3 label elements should be present', () => {
    const labelCount = (htmlLower.match(/<label/g) || []).length;
    assertGreaterOrEqual(labelCount, 3, 'Should have at least 3 labels');
});

test('Labels should have for attributes', () => {
    assertTrue(htmlContent.includes('for="'), 'Labels should have for="" attributes');
});

test('Email input type should be present', () => {
    assertTrue(htmlContent.includes('type="email"'), 'Missing email input type');
});

test('Required attribute should be used', () => {
    assertTrue(htmlLower.includes('required'), 'Missing required attribute on form inputs');
});

// ============================================
// Section IDs Tests (10 points)
// ============================================
console.log('\n--- Section IDs (10 points) ---');

const requiredSections = ['about', 'skills', 'projects', 'contact'];

requiredSections.forEach(section => {
    test(`Section #${section} should be present`, () => {
        const hasId = htmlContent.includes(`id="${section}"`) || htmlContent.includes(`id='${section}'`);
        assertTrue(hasId, `Missing section with id="${section}"`);
    });
});

// ============================================
// Accessibility Tests (10 points)
// ============================================
console.log('\n--- Accessibility (10 points) ---');

test('Images should have alt attributes', () => {
    // Check if any img tags exist without alt
    const imgTags = htmlContent.match(/<img[^>]*>/gi) || [];
    if (imgTags.length > 0) {
        const hasAlt = imgTags.every(tag => tag.includes('alt='));
        assertTrue(hasAlt, 'All images should have alt attributes');
    } else {
        assertTrue(true, 'No images found to check');
    }
});

test('Links should have meaningful text', () => {
    // Check that there are no empty links
    const emptyLinks = (htmlContent.match(/<a[^>]*>\s*<\/a>/gi) || []).length;
    assertEqual(emptyLinks, 0, 'Links should not be empty');
});

// ============================================
// Additional Structure Tests (5 points)
// ============================================
console.log('\n--- Additional Structure (5 points) ---');

test('Unordered list should be present for navigation', () => {
    assertTrue(htmlLower.includes('<ul'), 'Missing <ul> element');
});

test('List items should be present', () => {
    const liCount = (htmlLower.match(/<li/g) || []).length;
    assertGreaterOrEqual(liCount, 4, 'Should have at least 4 list items');
});

// Summary
console.log('\n==========================================');
console.log(`Results: ${passed} passed, ${failed} failed`);
const score = Math.round((passed / (passed + failed)) * 100);
console.log(`Score: ${score}%`);
console.log('==========================================\n');

console.log('Note: This is your visible test score (40% of final grade).');
console.log('Additional hidden tests will run after the deadline.\n');

if (failed > 0) {
    process.exit(1);
}
