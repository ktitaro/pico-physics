-- Separating Axis Theorem (or SAT)
-- algorithm for 2d convex polygons.
-- Used to find collisions between
-- two convex polygons.

sat2={}

-- Checks if two projections
-- are overlapping each other.
function sat2:overlap(p1,p2)
  local mn1,mx1=p1[1],p1[2]
  local mn2,mx2=p2[1],p2[2]
  return mx1>=mn2 and mx2>=mn1
end

-- Projects polygon onto axis and
-- returns min & max projections.
function sat2:project(p,a)
  local mn,mx=(1/0),-(1/0)
  for _,v in ipairs(p) do
    local d=vec2.dot(v,a)
    mn=min(mn,d)
    mx=max(mx,d)
  end
  return {mn,mx}
end

-- Tests separation along the
-- axes of a given polygon #1.
function sat2:test(p1,p2)
  for i=1,#p1 do
    local n=i%(#p1)+1
    local edge=p1[n]-p1[i]
    local norm=edge:perp()
    return not sat2:overlap(
      sat2:project(p1,norm),
      sat2:project(p2,norm))
  end
end

-- Checks if two convex polygons
-- are colliding with each other.
function sat2:check(p1,p2)
  if (sat2:test(p1,p2)) return false
  if (sat2:test(p2,p1)) return false
  return true
end
