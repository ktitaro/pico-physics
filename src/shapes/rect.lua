rect={}
rect.__index=rect

-- Properties:
rect.w=0 -- width
rect.h=0 -- height

function rect:new(p)
  return setmetatable(p,self)
end

-- Approximates rect to a
-- convex polygon and applies
-- an offset of `dx`, `dy` to
-- the each vertex.
function rect:poly(dx,dy)
  dx=(dx or 0)
  dy=(dy or 0)
  local w=self.w/2
  local h=self.h/2
  return {
    vec2:new(dx+w,dy+h),
    vec2:new(dx-w,dy+h),
    vec2:new(dx-w,dy-h),
    vec2:new(dx+w,dy-h),
  }
end
