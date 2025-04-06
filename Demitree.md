# Dark Forge Visual Layout
```ascii
                    Hex 1
                   /     \
             Hex 6         Hex 2
                  |     |
             Hex 5    O    Hex 3
                   \     /
                    Hex 4
```

## Components

### Center (O)
- Rotating mystical circle/merkaba
- Glowing cyan/blue effect
- Size: ~100px diameter

### Hex Panels (1-6)
- Regular hexagons
- Size: ~120px diameter
- Orbit Radius: ~200px from center
- States:
  - Empty: Cyan border + dark fill
  - Filled: Golden border + amber fill
  - Hover: White highlight
  - Drop Target: Green highlight

### Background
- Radial gradient
- Center: Deep purple (#1A002A)
- Edge: Black (#000000)

## Animation
```ascii
    t=0                 t=1
    H1                H6  H1
  H6  H2    ->     H5      H2
  H5  H3           H4      H3
    H4                H4
```
- Center: Constant clockwise rotation
- Hexes: Optional slow orbit (configurable)

## Interaction Zones
```ascii
  ┌────────────────────────┐
  │    Drag & Drop Zone    │
  │  ┌──────────────┐     │
  │  │  Hex Layout  │     │
  │  │     Area     │     │
  │  └──────────────┘     │
  │                       │
  └────────────────────────┘
```
- Full window drag-drop enabled
- Right-click hex to clear
- Hover effects on valid targets

# Dark Forge Project Structure
```ascii
Temple/
├── Scenes/
│   └── Forge/
│       ├── DarkForge.tscn       # Main forge scene with radial background
│       ├── HexForgeSlot.tscn    # Individual hex slot prefab
│       └── Effects/             # VFX for forge animations
│           └── MysticGlow.tscn
│
├── Scripts/
│   └── Forge/
│       ├── DarkForge.gd         # Main forge logic & hex positioning
│       ├── hex_forge_slot.gd    # Hex slot behavior & gem handling
│       └── center_circle.gd     # Rotating merkaba visualization
│
├── Resources/
│   ├── Forge/
│   │   ├── forge_gradient.tres  # Radial background resource
│   │   └── merkaba.svg         # Center shape graphic
│   │
│   ├── Gems/                   # Gem definitions
│   │   ├── fire_gem.tres
│   │   ├── water_gem.tres
│   │   └── ...
│   │
│   └── Shards/                 # Basic shard resources
│       ├── fire_shard.tres
│       ├── water_shard.tres
│       └── ...
│
└── addons/                     # Optional editor plugins
    └── forge_tools/           # Custom forge editing tools

## Key Components

### DarkForge Scene
- Central merkaba (O)
- 6 hex slots arranged in circle
- Radial gradient background
```ascii
    [1]
 [6]   [2]
[5] (O) [3]
    [4]
```

### Hex Forge Slots
- Drag & Drop Zones
- Visual States:
  🔵 Empty (Cyan)
  🟡 Filled (Gold)
  ⚪ Hover (White)
  🟢 Valid Drop (Green)

### Resources
- Gems: Compound items formed in forge
- Shards: Basic ingredients for forging

## Implementation Notes

### GitHub Setup
1. Create a new GitHub repository and link it to this project.
2. Add a .gitignore tailored for Godot projects (exclude .import, .godot, etc.).
3. Follow branching guidelines for feature development and integration.

### Priority Tasks
1. Create base scene layout (DarkForge.tscn)
2. Implement hex slot component (HexForgeSlot.tscn)
3. Setup drag-drop system
4. Add visual states and animations

### Technical Considerations
- Use Area2D for drag-drop zones
- Implement hex positioning using polar coordinates
- Consider using shader for merkaba glow effect
- Use signals for hex state changes
