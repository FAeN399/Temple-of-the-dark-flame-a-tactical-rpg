# Temple of the Dark Flame - Project Summary

## Current Status
1. **Project Structure**:
   - Folder structure is well-organized and follows Godot's best practices.
   - Key folders include `Scenes`, `Scripts`, `Resources`, and `addons`.

2. **Implemented Features**:
   - **Dark Forge**:
     - Hexagonal layout with 6 slots.
     - Rotating center merkaba with glow effects.
     - Drag-and-drop functionality for placing gems.
     - Visual states for hex slots (empty, filled, hover, drop target).
   - **Temple Scene**:
     - Main temple layout with room management.
     - Initial integration of the Forge Room.

3. **Resources**:
   - Basic gem and shard resources created.
   - Test resources for debugging (e.g., `test_fire_shard.tres`).

4. **Development Environment**:
   - GitHub repository set up: [GitHub Repo](https://github.com/FAeN399/Temple-of-the-dark-flame-a-tactical-rpg)
   - VS Code configured with extensions for Godot development.
   - Godot 4.2.1 is being used for compatibility.

---

## Concerns
1. **Resource Design**:
   - Placeholder assets (e.g., `merkaba.svg`, `hex_slot.svg`) need to be replaced with final designs.
   - Shader effects for glow and animations are basic and may need refinement.

2. **Room Transitions**:
   - Currently, there is no navigation system between rooms (e.g., Forge, Inventory, Altar).
   - Need to implement smooth transitions and UI for room selection.

3. **Testing**:
   - Test gems and shards are hardcoded for debugging.
   - Need a proper system for dynamically loading resources.

4. **Performance**:
   - Rotating merkaba and hex slot animations are simple but may need optimization for larger scenes.

5. **Gameplay Integration**:
   - No gameplay logic for combining gems or shards beyond basic functionality.
   - Need to define rules for crafting and resource interactions.

---

## Next Steps
1. **Finalize Dark Forge**:
   - Add animations for successful forging.
   - Implement crafting logic for combining gems and shards.
   - Create polished assets for hex slots and the merkaba.

2. **Expand Temple**:
   - Add additional rooms (Inventory, Altar, Library).
   - Implement a navigation system for switching between rooms.

3. **UI and UX**:
   - Design a consistent UI theme for the entire game.
   - Add tooltips and feedback for player actions.

4. **Testing and Debugging**:
   - Create automated tests for crafting logic.
   - Add debug tools for testing room transitions and resource interactions.

5. **Documentation**:
   - Update `Demitree.md` with detailed implementation notes for new features.
   - Write a README for the GitHub repository to onboard new developers.

---

## Questions for the Boss
1. What is the priority for room development (e.g., Forge vs. Inventory)?
2. Should we focus on gameplay mechanics or visual polish first?
3. Are there any specific design guidelines for assets (e.g., color palette, style)?
4. What is the deadline for the next milestone?

---

## Summary
The project is progressing well, with the Dark Forge and Temple structure in place. However, we need to address resource design, room transitions, and gameplay integration to move forward effectively. Clear priorities and deadlines will help streamline development.

---

# Boss Feedback and Response Plan

## Boss Feedback Summary
1. **What’s Working**:
   - Dark Forge is functional but lacks polish.
   - Folder structure and GitHub setup are solid.

2. **What’s Not Working**:
   - Room transitions are missing.
   - Gameplay logic for crafting is incomplete.
   - Visual polish is basic, especially for the merkaba glow and forge slots.
   - Testing is insufficient, relying on hardcoded debug gems.

3. **Priority Orders**:
   - Fix hex_nodes logic in DarkForge.gd.
   - Complete drag-and-drop feedback loop.
   - Create a test scene for the forge.
   - Improve shaders and animations for the merkaba.
   - Implement basic room navigation.
   - Develop crafting logic v1 with rules and outcomes.

4. **Questions**:
   - When will the first playable loop (forge → fuse → result) be ready?
   - What’s the visual target for the merkaba glow?
   - Which room is next after Forge?
   - How many shard types will be supported at launch?

---

## Response Plan

### ✅ Core Features to Complete
1. **Gameplay Mechanics**:
   - Implement crafting logic v1 with basic rules for combining shards.
   - Add success/failure outcomes for crafting.
   - Output a functional FusedGemResource.

2. **Rooms**:
   - Add Inventory, Altar, and Library rooms.
   - Implement basic navigation between rooms.

3. **Transitions**:
   - Create a minimalist navigation system for switching rooms.
   - Add visual feedback for room transitions.

4. **Feedback Systems**:
   - Improve drag-and-drop feedback for invalid drops and invalid gems.
   - Add animations for forge success (e.g., glow pulse, tremors).
   - Enhance the merkaba glow with dynamic shaders.

---

### 🎨 Assets to Create/Replace
1. **SVGs**:
   - Replace placeholder assets (e.g., merkaba.svg, hex_slot.svg) with polished designs.

2. **Shaders**:
   - Create a dynamic glow shader for the merkaba.
   - Add pulse and highlight effects for forge slots.

3. **UI Elements**:
   - Design a consistent UI theme for the game.
   - Add tooltips and feedback for player actions.

---

### 🧠 Systems to Build
1. **Resource Loading**:
   - Dynamically load gems and shards from the Resources folder.

2. **Gem/Shard Management**:
   - Create a system for managing gem and shard inventories.

3. **Testing Tools**:
   - Build a test scene (`Scenes/Forge/test_forge.tscn`) with:
     - Buttons for adding shards.
     - Trigger for forging.
     - UI output showing results.

4. **Debug Tools**:
   - Add toggles for testing room transitions and crafting logic.

5. **Navigation System**:
   - Implement a basic system for moving between rooms.

---

### 🧪 Testing & Debugging Tasks
1. **Crafting**:
   - Test shard combinations for success/failure outcomes.
   - Verify FusedGemResource outputs are functional.

2. **Room Transitions**:
   - Test navigation between Forge, Inventory, and Altar rooms.

3. **Forge Functionality**:
   - Ensure hex_nodes logic is fixed and slots communicate properly.

---

### 📚 Documentation to Finish
1. **Resources.md**:
   - Document gem and shard types, including their properties and effects.

2. **Crafting Logic Doc**:
   - Write a flowchart for crafting rules and outcomes.

3. **Internal Workflow Notes**:
   - Add notes for testing and debugging tools.

4. **Demitree.md**:
   - Update with new features and implementation details.

---

### 🎯 Deadlines
1. **First Playable Loop**:
   - Forge → Fuse → Result: **3 days**
   - Owner: Me

2. **Room Navigation**:
   - Basic transitions between rooms: **5 days**
   - Owner: Me

3. **Visual Polish**:
   - Merkaba glow and forge slot animations: **7 days**
   - Owner: Me

4. **Documentation**:
   - Resources.md and Crafting Logic Doc: **7 days**
   - Owner: Me

---

## Answers to Boss Questions
1. **First Playable Loop**:
   - Expected in **3 days**.

2. **Visual Target for Merkaba Glow**:
   - Reference 1: [Dynamic Glow Shader Example](https://example.com/glow1)
   - Reference 2: [Pulse Animation Example](https://example.com/pulse2)

3. **Next Room After Forge**:
   - Inventory Room (to manage gems and shards).

4. **Total Shard Types at Launch**:
   - **5 types**: Fire, Water, Earth, Air, and Light.

---

## Closing Notes
We’ve broken down the tasks into actionable steps with clear deadlines. The focus is on delivering a functional forge cycle and room navigation system first, followed by visual polish and documentation. Let’s make it burn.

