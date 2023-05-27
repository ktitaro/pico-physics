rubby={}
rubby.__index=rubby
setmetatable(rubby,body)

local tri={}
add(tri,vec2:new(5,0))
add(tri,vec2:new(10,10))
add(tri,vec2:new(0,10))

function rubby:new(x,y,reg)
  return body.new(self,poly2,{
    w=10,h=10,cl=2,e=tri,
    p=vec2:new(x,y),
    reg=reg,
  })
end

function rubby:drw()
  local p=self:get_poly(self.p)
  draw_poly(p,11)
end

-- Rubby is doing idle.
function rubby:upd()end
