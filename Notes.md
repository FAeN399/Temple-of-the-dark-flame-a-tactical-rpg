# Project Notes

## General Overview
- **Project Name:** Temple of the Dark Flame
- **Engine:** Godot 4.2.1 (stable)
- **Main Scene:** `Scenes/Temple/Temple.tscn`
- **Core Gameplay:** Tactical RPG with a central "Dark Forge" mechanic for crafting gems and shards.

---

## Key Components

### Dark Forge
- **Scene:** `Scenes/Forge/DarkForge.tscn`
- **Script:** `Scripts/Forge/DarkForge.gd`
- **Purpose:** Central mechanic for fusing gems using shards.
- **Hex Slots:** 6 slots arranged in a circular layout around a central rotating "merkaba."
- **Visual States for Slots:**
  - Empty: Cyan border + dark fill.
  - Filled: Golden border + amber fill.
  - Hover: White highlight.
  - Drop Target: Green highlight.
- **Signals:**
  - `forge_complete(result: FusedGemResource)` emitted when forging is successful.

### HexForgeSlot
- **Scene:** `Scenes/Forge/HexForgeSlot.tscn`
- **Script:** `Scripts/Forge/hex_forge_slot.gd`
- **Purpose:** Represents individual hexagonal slots for placing gems.
- **States:** EMPTY, FILLED, HOVER, DROP_TARGET.
- **Signals:**
  - `gem_placed(gem: GemResource)`
  - `gem_cleared()`

### Resources
- **ShardResource:** Basic ingredient for forging.
  - File: `Scripts/Items/shard_resource.gd`
  - Properties: `shard_type`, `power_level`, `element`.
- **GemResource:** Compound item formed in the forge.
  - File: `Scripts/Items/gem_resource.gd`
  - Properties: `shards`, `gem_name`, `power_level`.
- **FusedGemResource:** Result of combining multiple gems.
  - File: `Scripts/Items/fused_gem_resource.gd`
  - Properties: `source_gems`, `fusion_type`, `fusion_effect`.

---

## Concerns and Issues

### 1. **Hex Slot Management**
- **Concern:** `DarkForge.gd` does not currently track `hex_nodes` properly after instantiation.
- **Potential Fix:** Ensure `hex_nodes` is populated with references to the instantiated slots during `setup_hex_slots()`.

### 2. **Gem Placement Logic**
- **Concern:** `_on_slot_gem_cleared()` only sets `can_forge` to `false`. No visual feedback or additional logic is triggered.
- **Potential Fix:** Add a signal or UI update to reflect the cleared slot.

### 3. **Testing and Debugging**
- **Concern:** `_setup_test_gems()` in `DarkForge.gd` is only accessible via debug builds and requires manual input.
- **Potential Fix:** Add a dedicated test scene or UI button for easier testing during development.

### 4. **Drag-and-Drop System**
- **Concern:** Drag-and-drop logic in `HexForgeSlot.gd` (`_can_drop_data`, `_drop_data`) could use more robust validation.
- **Potential Fix:** Add checks to ensure only valid gems can be dropped, and provide feedback for invalid drops.

### 5. **Visual Feedback**
- **Concern:** The glow effect for the central "merkaba" is static and lacks dynamic interaction.
- **Potential Fix:** Use shaders or animations to enhance the glow effect based on forge activity.

### 6. **Resource Management**
- **Concern:** Resource files (e.g., `test_fire_shard.tres`) are scattered and not well-documented.
- **Potential Fix:** Create a centralized resource registry or documentation for easier tracking.

### 7. **Signals and Decoupling**
- **Concern:** Some functions directly manipulate child nodes instead of relying on signals.
- **Potential Fix:** Use signals to decouple logic and improve maintainability.

---

## Priority Tasks
1. **Fix Hex Slot Tracking:**
   - Ensure `hex_nodes` is properly populated and used in `check_forge_status()` and `trigger_forging()`.

2. **Improve Visual Feedback:**
   - Add animations for slot states and enhance the glow effect for the central "merkaba."

3. **Streamline Testing:**
   - Create a dedicated test scene (`Scenes/Forge/test_forge.tscn`) with UI buttons for testing gem placement and forging.

4. **Enhance Drag-and-Drop:**
   - Add validation and feedback for invalid drops in `HexForgeSlot.gd`.

5. **Document Resources:**
   - Create a `Resources.md` file to document all shard and gem resources.

---

## Notes for the Boss
- **Progress:** Core mechanics (Dark Forge, Hex Slots, Resource Scripts) are functional but need refinement.
- **Challenges:** Visual feedback and drag-and-drop logic require improvement.
- **Next Steps:** Focus on testing, debugging, and enhancing user experience.

---

## Miscellaneous
- **Godot Version Control:** `.gitignore` is set up to exclude `.import/`, `.export/`, and `.godot/` directories.
- **Editor Setup:** VS Code is configured with extensions for GDScript, shaders, and Git integration.
- **Documentation:** `Demitree.md` and `Foundation.md` provide a good starting point for understanding the project structure.


The boss's response is clear: they want **actionable results** and **no fluff**. Here's a structured response plan based on their demands:

---

# Response Plan: Temple of the Dark Flame

## ✅ Core Features to Complete
1. **Gameplay Mechanics**:
   - Implement **crafting logic v1**:
     - Basic rules for combining shards.
     - Success/failure outcomes.
     - Output a functional `FusedGemResource`.
   - Add **drag-and-drop feedback**:
     - Invalid drop → Show error feedback.
     - Invalid gem → Block placement and notify the player.

2. **Rooms**:
   - Add **Inventory**, **Forge**, and **Altar** rooms.
   - Implement **basic navigation** between rooms.

3. **Transitions**:
   - Create a **minimalist navigation system** for switching rooms.
   - Add **visual feedback** for room transitions.

4. **Feedback Systems**:
   - Improve **drag-and-drop feedback** for invalid drops.
   - Add **animations** for forge success (e.g., glow pulse, tremors).
   - Enhance the **merkaba glow** with dynamic shaders.

---

## 🎨 Assets to Create/Replace
1. **SVGs**:
   - Replace placeholder assets (`merkaba.svg`, `hex_slot.svg`) with polished designs.

2. **Shaders**:
   - Create a **dynamic glow shader** for the merkaba.
   - Add **pulse and highlight effects** for forge slots.

3. **UI Elements**:
   - Design a **consistent UI theme** for the game.
   - Add **tooltips and feedback** for player actions.

---

## 🧠 Systems to Build
1. **Resource Loading**:
   - Dynamically load gems and shards from the Resources folder.

2. **Gem/Shard Management**:
   - Create a system for managing gem and shard inventories.

3. **Testing Tools**:
   - Build a **test scene** (`Scenes/Forge/test_forge.tscn`) with:
     - Buttons for adding shards.
     - Trigger for forging.
     - UI output showing results.

4. **Debug Tools**:
   - Add toggles for testing room transitions and crafting logic.

5. **Navigation System**:
   - Implement a **basic system** for moving between rooms.

---

## 🧪 Testing & Debugging Tasks
1. **Crafting**:
   - Test shard combinations for success/failure outcomes.
   - Verify `FusedGemResource` outputs are functional.

2. **Room Transitions**:
   - Test navigation between Forge, Inventory, and Altar rooms.

3. **Drag-and-Drop**:
   - Validate feedback for invalid drops and invalid gems.

4. **Performance**:
   - Ensure animations (merkaba, forge slots) run smoothly in larger scenes.

---

## 📚 Documentation to Finish
1. **Resources.md**:
   - Document all shard and gem resources.

2. **Crafting Logic Doc**:
   - Write a flowchart and explanation of crafting rules.

3. **Internal Workflow Notes**:
   - Add notes for testing and debugging tools.

4. **Demitree.md**:
   - Update with implementation notes for new features.

---

## 🎯 Deadlines
1. **By End of Week**:
   - Basic room navigation (Forge → Inventory → Altar).
   - Drag-and-drop feedback loop completed.
   - Test scene (`test_forge.tscn`) created with buttons and toggles.
   - Shader improvements for merkaba glow.

2. **Next Week**:
   - Crafting logic v1 implemented.
   - Success/failure outcomes for forging.
   - Polished assets for hex slots and merkaba.

3. **Two Weeks**:
   - Full playable loop (forge → fuse → result).
   - Resource loading and inventory management systems.

---

## Questions for the Boss
1. **Visual Target**:
   - What’s the desired look for the merkaba glow? Provide 1–2 references.

2. **Shard Types**:
   - How many shard types should we support at launch?

3. **Room Priorities**:
   - Which room should we focus on after the Forge?

4. **Milestone Deadline**:
   - What is the deadline for the first playable loop?

---

This plan is actionable, prioritized, and aligned with the boss's demands. Let me know if you need further refinements or additional details.
