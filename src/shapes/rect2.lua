rect2={}
rect2.__index=rect2
setmetatable(rect2,shape2)

-- Properties:
rect2.w=0 -- width
rect2.h=0 -- height

-- Creates an instance of rect2,
-- using a provided set of props.
function rect2:new(p)
  return shape2.new(self,p)
end

-- Approximates a rect2 to a
-- convex polygon and returns
-- an array of its vertexes.
function rect2:get_poly(pt)
  pt=(pt or self.p)
  local x,y=pt.x,pt.y
  local w=self.w/2
  local h=self.h/2
  return {
    vec2:new(x+w,y+h),
    vec2:new(x-w,y+h),
    vec2:new(x-w,y-h),
    vec2:new(x+w,y-h),
  }
end
