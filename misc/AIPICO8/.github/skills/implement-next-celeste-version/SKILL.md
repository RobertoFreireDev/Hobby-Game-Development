---
name: implement-next-celeste-version
description: Implement next version of celeste
tools:
  - semantic_search
  - grep_search
  - read_file
---

## Process

1. **Find the latest generated version**
   - Detect the newest existing `codevX.X.X.lua` file in `/progress/celeste/`

2. **Extract Version Description**
   - Search README.md for the version number and its description
   - Example: "v0.1.1 – Globals variables (`room`, `objects`, `types`, flags...)"

3. **Identify Components**
   - Parse the description to determine what feature and code should be included
   - Map component names to locations in completecode.lua

4. **Extract From Source**
   - Read completecode.lua
   - Extract only the components listed for that version
   - **No Partial Features**: Complete functions/systems only, no incomplete code
   - **Accumulative**: Each version includes all previous versions
   - Remove any components from later versions

5. **Create Version File**
   - Create `codevX.X.X.lua` in `/progress/celeste/`
   - Include comments
   - Maintain code structure and formatting

6. **Validate**
   - Verify that only the intended features are included
   - Ensure the generated code has proper Lua syntax
   - Fix any Lua syntax issues

## Example Output

```lua
-- ~celeste~
-- matt thorson + noel berry

-- globals --
-------------

room = { x=0, y=0 }
objects = {}
types = {}
freeze=0
shake=0
will_restart=false
delay_restart=0
got_fruit={}
has_dashed=false
sfx_timer=0
has_key=false
pause_player=false
flash_bg=false
music_timer=0

-- input constants --
--------------------

k_left=0
k_right=1
k_up=2
k_down=3
k_jump=4
k_dash=5
```