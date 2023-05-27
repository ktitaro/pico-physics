body={}
body.__index=body
setmetatable(body,area)

-- Properties:
body.m=0 -- mass of the body
body.g=vec2:new() -- gravity (x,y)
body.v=vec2:new() -- velocity (x,y)
body.d=vec2:new() -- direction (x,y)
body.r=vec2:new() -- motion reminder (x,y)

-- Creates an instance of a body
-- using a provided set of props.
function body:new(p)
  return setmetatable(p,self)
end
