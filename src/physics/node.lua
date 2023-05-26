node={}
node.__index=node

-- Properties
node.w=0 -- node's width
node.h=0 -- node's height
node.p=vec2:new() -- position

-- Creates an instance of body,
-- using a provided set of props.
function node:new(p)
  return setmetatable(p,self)
end
