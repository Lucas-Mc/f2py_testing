module one
use two

contains

function onefunc(x) result(y)
    real(8) :: x,y
    y1 = twofunc(x)
    y2 = threefunc(x)
    y = y1 + y2
end function

end module