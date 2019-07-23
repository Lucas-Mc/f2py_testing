! Module test_tools defined in file test_tools.f90

subroutine f90wrap_calcwmparameters(params, angle, n)
    use test_tools, only: calcwmparameters
    implicit none
    
    real(8), dimension(3) :: params
    real(8) :: angle
    real(8), dimension(3) :: n
    call calcwmparameters(params=params, angle=angle, n=n)
end subroutine f90wrap_calcwmparameters

subroutine f90wrap_calcrotationmatrix(angle, ret_calcrotationmatrix, axis)
    use test_tools, only: calcrotationmatrix
    implicit none
    
    real(8), intent(in) :: angle
    real(8), dimension(3,3), intent(out) :: ret_calcrotationmatrix
    real(8), intent(in), dimension(3) :: axis
    ret_calcrotationmatrix = calcrotationmatrix(angle=angle, axis=axis)
end subroutine f90wrap_calcrotationmatrix

subroutine f90wrap_identity(ret_identity)
    use test_tools, only: identity
    implicit none
    
    real(8), dimension(3,3), intent(out) :: ret_identity
    ret_identity = identity()
end subroutine f90wrap_identity

subroutine f90wrap_ronxaxis(ret_ronxaxis, angle)
    use test_tools, only: ronxaxis
    implicit none
    
    real(8), dimension(3,3), intent(out) :: ret_ronxaxis
    real(8) :: angle
    ret_ronxaxis = ronxaxis(angle=angle)
end subroutine f90wrap_ronxaxis

subroutine f90wrap_getmassmatrix(ret_getmassmatrix)
    use test_tools, only: getmassmatrix
    implicit none
    
    real(8), dimension(6,6), intent(out) :: ret_getmassmatrix
    ret_getmassmatrix = getmassmatrix()
end subroutine f90wrap_getmassmatrix

subroutine f90wrap_getstiffnessmatrix(ret_getstiffnessmatrix)
    use test_tools, only: getstiffnessmatrix
    implicit none
    
    real(8), dimension(6,6), intent(out) :: ret_getstiffnessmatrix
    ret_getstiffnessmatrix = getstiffnessmatrix()
end subroutine f90wrap_getstiffnessmatrix

subroutine f90wrap_getgravityinz(ret_getgravityinz)
    use test_tools, only: getgravityinz
    implicit none
    
    real(8), dimension(3), intent(out) :: ret_getgravityinz
    ret_getgravityinz = getgravityinz()
end subroutine f90wrap_getgravityinz

! End of module test_tools defined in file test_tools.f90

! Module wraptest_tools defined in file test_tools.f90

! End of module wraptest_tools defined in file test_tools.f90

