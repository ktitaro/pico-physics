body={}
body.__index=body
setmetatable(body,area)

-- Properties:
body.m=0
body.g=vec2:new()
body.v=vec2:new()
body.d=vec2:new()
body.r=vec2:new()

function body:new(p)
  return
end
