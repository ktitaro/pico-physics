robby={}
robby.__index=robby
setmetatable(robby,body)

local poly={}
add(poly,vec2:new(5,0))
add(poly,vec2:new(10,8))
add(poly,vec2:new(5,16))
add(poly,vec2:new(0,8))

for i=1,#poly do
  poly[i]=poly[i]:scale(1.5)
end

function robby:new(x,y,reg)
  return body.new(self,poly2,{
    p=vec2:new(x,y),
    reg=reg,e=poly,
    cl=3,cm={1,2},
    col=12,
  })
end

function robby:upd()
  local ix=btoi(btn(➡️))-btoi(btn(⬅️))
  local iy=btoi(btn(⬇️))-btoi(btn(⬆️))
  self.v=vec2:new(ix,iy)
  local k=body.upd(self)
  if (k~=nil) self.col=8
  if (k==nil) self.col=12
end
