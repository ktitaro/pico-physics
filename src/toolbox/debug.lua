-- Attempts to draw and paint
-- an arbitraty 2d polygon.
function draw_poly(v,c,s)
  s=(s or "line")
  for i=1,#v do
    if (s=="pset") then
      pset(p[i].x,p[i].y,k)
    elseif (s=="line") then
      local ni=i%#p+1
      local c,n=p[i],p[ni]
      line(c.x,c.y,n.x,n.y,k)
    end
  end
end
