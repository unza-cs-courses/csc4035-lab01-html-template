#!/bin/bash
# Lab 1 Visible Tests - Auto-Grading Script
# CSC4035 Web Programming and Technologies
# These tests run on every push via GitHub Actions

echo "=========================================="
echo "Lab 1: HTML5 Document Structure - Visible Tests"
echo "=========================================="

SCORE=0
MAX_SCORE=100

# Check if index.html exists
if [ ! -f "index.html" ]; then
    echo "FAIL: index.html not found"
    echo "FINAL SCORE: 0 / $MAX_SCORE"
    exit 1
fi

echo ""
echo "=== Document Structure (15 points) ==="

# Check 1: Doctype present
if grep -qi "<!DOCTYPE html>" index.html; then
    echo "PASS: HTML5 doctype present (+3)"
    SCORE=$((SCORE + 3))
else
    echo "FAIL: HTML5 doctype missing"
fi

# Check 2: Lang attribute
if grep -q 'lang="en"' index.html || grep -q "lang='en'" index.html; then
    echo "PASS: Language attribute present (+3)"
    SCORE=$((SCORE + 3))
else
    echo "FAIL: Language attribute missing"
fi

# Check 3: Meta charset
if grep -qi 'charset.*utf-8' index.html; then
    echo "PASS: Meta charset UTF-8 present (+3)"
    SCORE=$((SCORE + 3))
else
    echo "FAIL: Meta charset missing"
fi

# Check 4: Viewport meta
if grep -qi 'viewport' index.html; then
    echo "PASS: Viewport meta tag present (+3)"
    SCORE=$((SCORE + 3))
else
    echo "FAIL: Viewport meta tag missing"
fi

# Check 5: Title element
if grep -q '<title>' index.html && grep -q '</title>' index.html; then
    echo "PASS: Title element present (+3)"
    SCORE=$((SCORE + 3))
else
    echo "FAIL: Title element missing"
fi

echo ""
echo "=== Semantic Elements (25 points) ==="

# Check semantic elements
declare -A SEMANTIC_ELEMENTS=(
    ["header"]=4
    ["nav"]=4
    ["main"]=5
    ["section"]=4
    ["article"]=4
    ["footer"]=4
)

for elem in "${!SEMANTIC_ELEMENTS[@]}"; do
    points=${SEMANTIC_ELEMENTS[$elem]}
    if grep -qi "<$elem" index.html; then
        echo "PASS: <$elem> found (+$points)"
        SCORE=$((SCORE + points))
    else
        echo "FAIL: <$elem> not found"
    fi
done

echo ""
echo "=== Heading Hierarchy (15 points) ==="

# Check for h1
if grep -q '<h1>' index.html; then
    H1_COUNT=$(grep -o '<h1>' index.html | wc -l | tr -d ' ')
    if [ "$H1_COUNT" -eq 1 ]; then
        echo "PASS: Single h1 element present (+5)"
        SCORE=$((SCORE + 5))
    else
        echo "WARN: Multiple h1 elements found ($H1_COUNT) - should be 1 (+2)"
        SCORE=$((SCORE + 2))
    fi
else
    echo "FAIL: No h1 element found"
fi

# Check for h2
if grep -q '<h2>' index.html; then
    echo "PASS: h2 elements present (+5)"
    SCORE=$((SCORE + 5))
else
    echo "FAIL: No h2 elements found"
fi

# Check for h3 in projects
if grep -q '<h3>' index.html; then
    echo "PASS: h3 elements present (+5)"
    SCORE=$((SCORE + 5))
else
    echo "FAIL: No h3 elements found"
fi

echo ""
echo "=== Form Implementation (20 points) ==="

# Check form element
if grep -q '<form' index.html; then
    echo "PASS: Form element present (+4)"
    SCORE=$((SCORE + 4))
else
    echo "FAIL: Form element missing"
fi

# Check labels
if grep -q '<label' index.html; then
    LABEL_COUNT=$(grep -o '<label' index.html | wc -l | tr -d ' ')
    if [ "$LABEL_COUNT" -ge 3 ]; then
        echo "PASS: Labels present ($LABEL_COUNT found) (+4)"
        SCORE=$((SCORE + 4))
    else
        echo "WARN: Only $LABEL_COUNT labels found (need 3+) (+2)"
        SCORE=$((SCORE + 2))
    fi
else
    echo "FAIL: No labels found"
fi

# Check for attribute on labels
if grep -q 'for="' index.html; then
    echo "PASS: Label 'for' attributes present (+4)"
    SCORE=$((SCORE + 4))
else
    echo "FAIL: Label 'for' attributes missing"
fi

# Check required inputs
if grep -q 'type="email"' index.html; then
    echo "PASS: Email input type present (+4)"
    SCORE=$((SCORE + 4))
else
    echo "FAIL: Email input type missing"
fi

# Check required attribute
if grep -q 'required' index.html; then
    echo "PASS: Required attribute used (+4)"
    SCORE=$((SCORE + 4))
else
    echo "FAIL: Required attribute not found"
fi

echo ""
echo "=== Required Files (15 points) ==="

# Check for validation screenshot
if [ -f "validation-screenshot.png" ] || [ -f "validation-screenshot.PNG" ] || [ -f "validation-screenshot.jpg" ] || [ -f "validation-screenshot.jpeg" ]; then
    echo "PASS: Validation screenshot present (+10)"
    SCORE=$((SCORE + 10))
else
    echo "FAIL: Validation screenshot missing (validation-screenshot.png)"
fi

# Check for reflection
if [ -f "reflection.txt" ]; then
    WORD_COUNT=$(wc -w < reflection.txt | tr -d ' ')
    if [ "$WORD_COUNT" -ge 20 ]; then
        echo "PASS: Reflection present ($WORD_COUNT words) (+5)"
        SCORE=$((SCORE + 5))
    else
        echo "WARN: Reflection too short ($WORD_COUNT words, need 20+) (+2)"
        SCORE=$((SCORE + 2))
    fi
else
    echo "FAIL: Reflection file missing (reflection.txt)"
fi

echo ""
echo "=== Section IDs (10 points) ==="

# Check sections by ID
SECTIONS=("about" "skills" "projects" "contact")
SECTION_POINTS=0

for section in "${SECTIONS[@]}"; do
    if grep -q "id=\"$section\"" index.html || grep -q "id='$section'" index.html; then
        echo "PASS: Section #$section found (+2)"
        SECTION_POINTS=$((SECTION_POINTS + 2))
    else
        echo "FAIL: Section #$section not found"
    fi
done

# Add remaining points for completeness
if [ $SECTION_POINTS -eq 8 ]; then
    SECTION_POINTS=10
fi
SCORE=$((SCORE + SECTION_POINTS))

echo ""
echo "=========================================="
echo "FINAL SCORE: $SCORE / $MAX_SCORE"
echo "=========================================="

# Output grade
if [ $SCORE -ge 90 ]; then
    echo "Grade: A - Excellent work!"
elif [ $SCORE -ge 80 ]; then
    echo "Grade: B - Good job!"
elif [ $SCORE -ge 70 ]; then
    echo "Grade: C - Satisfactory"
elif [ $SCORE -ge 60 ]; then
    echo "Grade: D - Needs improvement"
else
    echo "Grade: F - Please review requirements"
fi

echo ""
echo "Note: This is your visible test score (40% of final grade)."
echo "Additional hidden tests will run after the deadline."

exit 0
