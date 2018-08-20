-- lua file for returntogrid.
-- 15.08.2018

returntogrid = returntogrid or {}

function returntogrid.ufgridvskip (diff,vskip,gridstep)
    local error= ( diff % gridstep ) -- %=modulo
    -- we need to add gridstep-error to the existing vskip
    -- modulo gridstep
    -- texio.write_nl("XXXXXXXXXXXXXXXXXXX")
    vskip = ( vskip + gridstep - error ) %gridstep -- %=modulo!
    -- texio.write_nl(" diff ".. diff .. " gridstep "..gridstep.." error "..error.." vskip "..vskip)
    -- texio.write_nl("XXXXXXXXXXXXXXXXXXX")
    tex.sprint ( vskip )
end
