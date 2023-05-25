-- Converts a number or an
-- array of numbers into its
-- binary representation.
function tobin(v)
  local b=0
  if (type(v)=="table") then
    for i=1,#v do b+=1<<v[i] end
  elseif (type(v)=="number") then
    b=1<<v
  end
  return b
end
