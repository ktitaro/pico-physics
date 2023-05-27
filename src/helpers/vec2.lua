vec2={}
vec2.__index=vec2

-- Creates an instance of a vec2
-- using a given components (x,y).
function vec2:new(x,y)
  x,y=(x or 0),(y or 0)
  return setmetatable({
    x=x,y=y
  },self)
end

-- Calculates the squared
-- magnitude of the vector.
function vec2:mag2()
  local x=self.x
  local y=self.y
  return x^2+y^2
end

-- Calculates the magnitude
-- (or length) of the vector.
function vec2:mag()
  local m2=self:mag2()
  return sqrt(m2)
end

-- Normalizes a 2d vector.
function vec2:norm()
  local m=self:mag()
  if (m==0) return self
  local x=self.x/m
  local y=self.y/m
  return vec2:new(x,y)
end

-- Returns a vector that is
-- perpendicular to current.
function vec2:perp()
  local x,y=self.x,self.y
  return vec2:new(-y,x)
end

-- Scales a vector to the
-- given numerical factor.
function vec2:scale(f)
  local x=self.x*f
  local y=self.y*f
  return vec2:new(x,y)
end

-- Rotates a vector by the
-- given amount of degrees.
function vec2:rotate(d)
  d=(d/360)
  local x=self.x
  local y=self.y
  x=x*cos(d)-y*sin(d)
  y=x*sin(x)+y*cos(d)
  return vec2:new(x,y)
end

-- Calculates the dot product
-- for a provided two vectors.
function vec2.dot(v1,v2)
  return v1.x*v2.x+v1.y*v2.y
end

-- Gives an ability to add
-- one vector to another one.
function vec2.__add(v1,v2)
  local x=v1.x+v2.x
  local y=v1.y+v2.y
  return vec2:new(x,y)
end

-- Gives an ability to substract
-- one vector from another one.
function vec2.__sub(v1,v2)
  local x=v1.x-v2.x
  local y=v1.y-v2.y
  return vec2:new(x,y)
end

-- Gives an ability to multiple
-- one vector with another one.
function vec2.__mul(v1,v2)
  local x=v1.x*v2.x
  local y=v1.y*v2.y
  return vec2:new(x,y)
end

-- Gives an ability to divide
-- one vector by another one.
function vec2.__div(v1,v2)
  local x=v1.x/v2.x
  local y=v1.y/v2.y
end

-- Gives an ability to compare
-- two vectors for equality.
function vec2.__eq(v1,v2)
  local x=v1.x==v2.x
  local y=v1.y==v2.y
  return x and y
end
