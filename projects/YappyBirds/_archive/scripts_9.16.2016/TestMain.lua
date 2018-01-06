function tostring_r ( t )
  local print_r_cache={}
  local function sub_print_r(str, t, indent)
    if (print_r_cache[tostring(t)]) then
      -- print(indent.."*"..tostring(t))
      str = str .. "\t" .. indent.."*"..tostring(t) .. "\n"
    else
      print_r_cache[tostring(t)]=true
      if (type(t)=="table") then
        for pos,val in pairs(t) do
          if (type(val)=="table") then
            -- print(indent.."["..pos.."] => "..tostring(t).." {")
            str = str .. "\t" .. indent.."["..pos.."] => "..tostring(t).." {" .. "\n"
            str = sub_print_r(str, val,indent..string.rep(" ",string.len(pos)+8))
            -- print(indent..string.rep(" ",string.len(pos)+6).."}")
            str = str .. "\t" .. indent..string.rep(" ",string.len(pos)+6).."}" .. "\n"
          elseif (type(val)=="string") then
            -- print(indent.."["..pos..'] => "'..val..'"')
            str = str .. "\t" .. indent.."["..pos..'] => "'..val..'"' .. "\n"
          else
            -- print(indent.."["..pos.."] => "..tostring(val))
            str = str .. "\t" .. indent.."["..pos.."] => "..tostring(val) .. "\n"
          end
        end
      else
        -- print(indent..tostring(t))
        str = str .. "\t" .. indent .. tostring(t) .. "\n"
      end
    end

    return str
  end
  local indent = "\t"
  local str = ""
  if (type(t)=="table") then
    -- print(tostring(t).." {")
    str = tostring(t).."\t{" .. "\n"
    -- sub_print_r(t," ")
    str = sub_print_r(str, t, indent)
    -- print("}")
    str = str .. "\t}"

  else
    str = sub_print_r(str, t, indent)
    -- sub_print_r(t," ")
  end
  return str .. "\n"
  -- print()
end

--local TestBaseClass = require "TestBaseClass"

--local base = TestBaseClass()
--print(tostring(base))
--base = nil

--collectgarbage()

local TestDerivedClass = require "TestDerivedClass"

local derived = TestDerivedClass()
print(tostring(derived))
derived = nil

collectgarbage()
