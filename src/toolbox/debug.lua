-- Attempts to draw and paint
-- an arbitrary 2d polygon.
function draw_poly(v,c,s)
  s=(s or "line")
  for i=1,#v do
    if (s=="pset") then
      pset(v[i].x,v[i].y,c)
    elseif (s=="line") then
      local ni=i%#v+1
      local vc,vn=v[i],v[ni]
      line(vc.x,vc.y,vn.x,vn.y,c)
    end
  end
end
