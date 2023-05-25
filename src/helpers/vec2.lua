vec2={}
vec2.__index=vec2

-- Creates new 2d vector.
function vec2:new(x,y)
  return setmetatable({
    x=x,y=y},self)
end

-- Returns a vector that is
-- perpendicular to current.
function vec2:perp()
  local x,y=self.x,self.y
  return vec2:new(-y,x)
end

-- Calculates the dot product
-- for a provided two vectors.
function vec2.dot(v1,v2)
  return v1.x*v2.x+v1.y*v2.y
end

-- Gives ability to substract
-- one vector from another.
function vec2.__sub(v1,v2)
  local x=v1.x-v2.x
  local y=v1.y-v2.y
  return vec2:new(x,y)
end
