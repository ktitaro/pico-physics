robby={}
robby.__index=robby
setmetatable(robby,body)

function robby:new(x,y,reg)
  return body.new(self,oval2,{
    m=0,w=8,h=8,cl=3,cm={1,2},
    g=vec2:new(0,0.5),
    p=vec2:new(x,y),
    reg=reg,
  })
end

function robby:drw()
  local p=self:get_poly(self.p)
  draw_poly(p,10)
end

function robby:upd()
  self.v=vec2:new(
    btoi(btn(➡️))-btoi(btn(⬅️)),
    btoi(btn(⬇️))-btoi(btn(⬆️)))
  body.upd(self)
end
