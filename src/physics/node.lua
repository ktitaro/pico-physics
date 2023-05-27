node={}
node.__index=node

-- Properties
node.w=0 -- width of the node
node.h=0 -- height of the node
node.p=vec2:new() -- position (x,y)

-- Creates an instance of a node
-- using the provided set of props.
function node:new(p)
  return setmetatable(p,self)
end
