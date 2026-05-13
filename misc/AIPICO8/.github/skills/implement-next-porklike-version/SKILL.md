---
name: implement-next-porklike-version
description: Implement next version of porklike
tools:
  - semantic_search
  - grep_search
  - read_file
---

## Process

1. **Find the latest generated version**
   - Detect the newest existing `codevX.X.X.lua` file in `/progress/porklike/`

2. **Extract Version Description**
   - Search README.md for the version number and its description

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
   - Create `codevX.X.X.lua` in `/progress/porklike/`
   - Include comments
   - Maintain code structure and formatting

6. **Validate**
   - Verify that only the intended features are included
   - Ensure the generated code has proper Lua syntax
   - Fix any Lua syntax issues

## Example Output

```lua
-- porklike: wurst comes to worst
-- by krystian majewski, lazy devs

function _init()
end

function _update60()
end

function _draw()
end
```