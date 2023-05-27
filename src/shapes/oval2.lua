oval2={}
oval2.__index=oval2
setmetatable(oval2,shape2)

-- Creates an instance of an oval2
-- using the provided set of props.
function oval2:new(p)
  return shape2.new(self,p)
end

-- Approximates an oval2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function oval2:get_poly(pt)
  pt=(pt or vec2:new())
  local p={}
  local dx=self.w/2
  local dy=self.h/2
  local s=max(dx,dy)
  local n=mid(8,s,16)
  for i=0,(n-1) do
    local a=(1/n)*i
    local x=dx*cos(a)
    local y=dy*sin(a)
    add(p,vec2:new(
      dx+math.round(x),
      dy+math.round(y)
    )+pt)
  end
  return p
end
