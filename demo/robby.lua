robby={}
robby.__index=robby
setmetatable(robby,body)

local poly={}
add(poly,vec2:new(5,0))
add(poly,vec2:new(10,8))
add(poly,vec2:new(5,16))
add(poly,vec2:new(0,8))

function robby:new(x,y,reg)
  return body.new(self,poly2,{
    m=1,w=10,h=16,cl=3,cm={1,2},
    g=vec2:new(0,0.5),
    p=vec2:new(x,y),
    reg=reg,
    e=poly,
  })
end

function robby:drw()
  local p=self:get_poly(self.p)
  draw_poly(p,12,"line")
end

function robby:upd()
  self.v=vec2:new(
    btoi(btn(➡️))-btoi(btn(⬅️)),
    btoi(btn(⬇️))-btoi(btn(⬆️)))
  body.upd(self)
end
