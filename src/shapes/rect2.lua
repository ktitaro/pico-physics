rect2={}
rect2.__index=rect2
setmetatable(rect2,shape2)

-- Creates an instance of a rect2
-- using the provided set of props.
function rect2:new(p)
  return shape2.new(self,p)
end

-- Approximates an oval2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function rect2:get_poly(pt)
  pt=(pt or vec2:new())
  local w=self.w
  local h=self.h
  return {
    vec2:new(0,0)+pt,
    vec2:new(w,0)+pt,
    vec2:new(w,h)+pt,
    vec2:new(0,h)+pt,
  }
end
