module two
implicit none

contains

function twofunc(x) result(y)
    real(8) :: x,y
    y = x*x
end function

function threefunc(x) result(y)
  real(8) :: x,y
  y = x*x*x
end function

end module