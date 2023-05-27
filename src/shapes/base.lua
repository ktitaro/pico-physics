-- Represents an artbitrary 2d shape,
-- used as a base interface for other
-- more specific 2d shapes.

shape2={}
shape2.__index=shape2

-- Creates an instance of shape2
-- using the provided set of props.
function shape2:new(p)
  return setmetatable(p,self)
end

-- Approximates a shape2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function shape2:get_poly(pt)
  assert(false,"Not implemented!")
end
