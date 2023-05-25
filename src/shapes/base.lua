-- Represents an artbitrary 2d shape,
-- used as a base interface for other
-- more specific 2d shapes.

shape2={}
shape2.__index=shape2

-- Properties:
shape2.p=vec2:new() -- position (x,y)
-- shape2.w=0 -- width of the shape.
-- shape2.h=0 -- height of the shape.

-- Creates an instance of shape2,
-- using a provided set of props.
function shape2:new(p)
  return setmetatable(p,self)
end

-- Approximates a shape2 to a
-- convex polygon and returns an
-- array of its vertexes.
function shape2:get_poly()
  assert(false,"Not implemented!")
end
