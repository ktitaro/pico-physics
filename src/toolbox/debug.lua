-- Attempts to draw and paint
-- an arbitraty 2d polygon.
function draw_poly(p,k)
  for i=1,#p do
    local ni=i%#p+1
    local c,n=p[i],p[ni]
    line(c.x,c.y,n.x,n.y,k)
  end
end
