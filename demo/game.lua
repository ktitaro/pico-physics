local reg={}

function _init()
  add(reg,robby:new(10,10,reg))
  add(reg,create_oval(30,20,20,80))
  add(reg,create_oval(20,30,80,20))
  add(reg,create_rect(30,20,80,80))
end

function _update()
  for v in all(reg) do
    v:upd()
  end
end

function _draw()
  cls();map(0,0,0,0)
  for v in all(reg) do
    local p=v:get_poly(v.p)
    draw_poly(p,v.col,"line")
  end
end
