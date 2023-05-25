oval2={}
oval2.__index=oval2
setmetatable(oval2,shape2)

-- Properties:
oval2.r=0 -- radius
oval2.h=0 -- height

-- Creates an instance of oval2,
-- using a provided set of props.
function oval2:new(p)
  return shape2.new(self,p)
end

-- Approximates an oval2 to a
-- convex polygon and returns
-- an array of its vertexes.
function oval2:get_poly()
  local p={}
  local r=self.r
  local h=self.h
  local s=(r+h)/2
  local n=mid(6,s,12)
  local a=1/n
  for i=1,n do
    add(p,vec2:new(
      r*cos(a*i),
      h*sin(a*i)
    )+self.p)
  end
  return p
end
