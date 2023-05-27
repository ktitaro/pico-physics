math={}

-- Rounds a number to the
-- nearest integer value.
function math.round(v)
  if (v<0) return flr(v)
  if (v>0) return ceil(v)
  return v
end
