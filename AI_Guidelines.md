# AI Assistant Guidance & Tooling

This file will help you and your team consistently guide your AI assistant while working in the project.

This document outlines strategies and tools to get the most out of your in-editor AI assistant. Use these guidelines to structure your prompts and integrate AI workflow improvements.

---

## 1. Precise Code Selection

- **Highlight Specific Blocks:**  
  Only select the functions or code regions that need improvement.
- **Keep Context Nearby:**  
  Include only nearby related functions or class structure if needed.

---

## 2. Context Mechanisms

- **Referencing Files and Symbols:**  
  Use direct references (e.g., `@HexPanel`, `@Scripts/Forge/DarkForge.gd`) in your prompts.
- **Keep Relevant Files Open:**  
  Open related documents in your editor to help the assistant collate context.

---

## 3. Structured Prompting

- **Clear Goals:**  
  *Example:* “Refactor the selected function to optimize performance by replacing nested loops with a dictionary lookup.”
- **Define Inputs & Outputs:**  
  *Example:* “Create `calculate_damage(attacker, defender)` that takes two dictionaries and returns an integer.”
- **Constraints & Style:**  
  Specify domain rules (use GDScript style, do not change signatures).
- **Break Down Tasks:**  
  Handle complex tasks in steps: First, build the basic structure; then add detailed functionality.

---

## 4. Code Comment Guidance

- **Explanatory Comments:**  
  Leave notes on why a piece of code behaves a certain way.
- **Temporary AI Directives:**  
  Use block comments (e.g., `# AI TODO: ...`) to direct the AI where to focus, then clean them up.

---

## 5. Workflow Integration

- **Review Diff Views:**  
  Always inspect changes before merging.
- **Iterative Conversations:**  
  Use back-and-forth interaction for complex changes.
- **Automated Testing & Formatting:**  
  Rerun linters/formatters and tests after incorporating AI-generated changes.

---

## 6. The Right Mindset

- **Assistant, Not Authority:**  
  Use the AI as a helper. Verify and test its suggestions.
- **Understand Limitations:**  
  Clearly specify project goals to prevent misinterpretation.

---

## 7. Implementing In-Editor Tools

- **VS Code Snippets/Extensions:**  
  • Create custom snippets for common AI instructions.  
  • Use commands to open a side panel with these guidelines.

- **Godot Editor Plugins:**  
  • Create an EditorPlugin that opens a dock with these AI tips for quick reference.
  
Example snippet for a VS Code command palette entry:
```json
{
  "command": "extension.showAIGuidance",
  "title": "Show AI Assistant Guidelines"
}
```

# AI: Refactor the following section to use signals instead of direct calls.
# The target node is expected to be the parent.
# Ensure the signal carries the 'damage_amount' payload.
# --- Start AI Focus ---
get_parent().take_damage(damage_amount)
# --- End AI Focus ---