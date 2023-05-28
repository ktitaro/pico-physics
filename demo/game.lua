local n=70
local reg=nil
local rob=robby:new({
  x=60,y=60,reg=reg
})

function _init()
  regen_demo()
end

function _update()
  if (btnp(❎)) regen_demo()
  rob:upd()
end

function _draw()
  cls()
  map(0,0,0,0)
  draw_items()
  draw_info()
end

function regen_demo()
  reg=gen_things(n)
  add(reg,rob)
  rob.reg=reg
  rob.p.x=64-rob.w/2
  rob.p.y=64-rob.h/2
end

function draw_items()
  for i=1,#reg do
    local v=reg[i]
    local p=v:get_poly(v.p)
    draw_poly(p,reg[i].col)
  end
end

function draw_info()
  print("press ❎ to regenerate the map",5,0,13)
  print("amount of shapes on the map: "..n,2,122,13)
end
