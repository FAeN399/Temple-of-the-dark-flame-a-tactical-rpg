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
├── .git/                      # Git repository data
├── .gitignore                 # Git ignore rules
│
├── Scenes/
│   └── Forge/                # All Forge-related scenes
│       ├── DarkForge.tscn    # Main forge scene
│       ├── HexForgeSlot.tscn # Hex slot prefab
│       └── Effects/          # Visual effects
│           └── MysticGlow.tscn
│
├── Scripts/
│   └── Forge/               # All Forge-related scripts
│       ├── DarkForge.gd
│       ├── hex_forge_slot.gd
│       ├── center_circle.gd
│       └── Types/
│           └── forge_types.gd
│
├── Resources/
│   ├── Textures/            # All game textures
│   │   ├── merkaba.svg
│   │   └── hex_slot.svg
│   │
│   ├── Materials/           # Shader materials
│   │   └── glow_material.tres
│   │
│   ├── Gems/
│   │   ├── gem_data.tres
│   │   ├── fire_gem.tres
│   │   └── water_gem.tres
│   │
│   ├── Shards/
│   │   ├── shard_data.tres
│   │   ├── fire_shard.tres
│   │   └── water_shard.tres
│   │
│   └── Themes/
│       └── dark_theme.tres
│
├── addons/
│   └── forge_tools/
│       ├── plugin.cfg        # Plugin configuration
│       └── forge_editor.gd   # Editor integration
│
└── project.godot            # Godot project file
```

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
1. Initialize and commit:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```
2. Set up remote and fetch:
   ```bash
   git branch -M main
   git remote add origin https://github.com/FAeN399/Temple-of-the-dark-flame-a-tactical-rpg
   git pull origin main --allow-unrelated-histories
   ```
3. Push merged changes:
   ```bash
   git push -u origin main
   ```

### Development Setup
1. Godot Setup:
   - Download Godot 4.2.1 (stable)
   - DO NOT use newer versions to avoid compatibility issues
   - Project Settings > General > Advanced:
     - Set "Force Compatibility" to your version (4.2)

2. VS Code Extensions:
   - godot-tools.godot-tools (Godot GDScript support)
   - geequlim.godot-tools (Godot Tools)
   - ms-vscode.cpptools (C/C++ for GDExtension)
   - eamodio.gitlens (Enhanced Git features):
     - Inline blame annotations
     - File and line history
     - Branch/tag comparison
     - Repository visualization
     - Commit exploring without leaving editor
   - pkief.material-icon-theme (Better file icons)
   - slevesque.shader (Shader syntax)
   - wayou.vscode-todo-highlight (TODO highlighting)

3. Workspace Settings:
   ```json
   {
     "editor.formatOnSave": true,
     "files.autoSave": "afterDelay",
     "godot_tools.gdscript_lsp_server_port": 6008
   }
   ```

4. Godot Editor Configuration:
   1. Open Godot Editor Settings
   2. Navigate to Text Editor > External
   3. Enable "Use External Editor"
   4. Set Exec Path:
      - Windows: `C:\Users\<username>\AppData\Local\Programs\Microsoft VS Code\Code.exe`
      - macOS: `/Applications/Visual Studio Code.app/Contents/MacOS/Electron`
   5. Set Exec Flags: `{project} --goto {file}:{line}:{col}`

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
