robby={}
robby.__index=robby
setmetatable(robby,body)

local poly={}
add(poly,vec2:new(4,0))
add(poly,vec2:new(8,12))
add(poly,vec2:new(0,12))

function robby:new(props)
  return body.new(self,poly2,{
    p=vec2:new(props.x,props.y),
    reg=props.reg,e=poly,
    cl={2},cm={1},
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
