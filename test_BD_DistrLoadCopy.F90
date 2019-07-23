!@test
subroutine test_BD_DistrLoadCopy()
    ! branches to test
    ! - the 2D array is correctly stored in the 3D array
    
    use pFUnit_mod
    use BeamDyn
    use NWTC_Num
    use test_tools
    
    implicit none
    
    integer                    :: i, j
    type(BD_ParameterType)     :: parametertype
    type(BD_InputType)         :: inputtype
    type(BD_MiscVarType)       :: miscvartype
    integer(IntKi)             :: ErrStat
    character                  :: ErrMsg
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-14
    
    
    ! --------------------------------------------------------------------------
    testname = "static simple beam under gravity:"
    
    ! build the parametertype, inputtype, and miscvartype
    parametertype = simpleParameterType()
    miscvartype = simpleMiscVarType(parametertype%nqp, parametertype%elem_total)
    inputtype = simpleInputType(parametertype%nqp, parametertype%elem_total)
    
    call BD_DistrLoadCopy(parametertype, inputtype, miscvartype)

    do j = 1, parametertype%elem_total
        do i = 1, parametertype%nqp
#line 40 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_DistrLoadCopy.F90"
  call assertEqual((/  9*(j-1)+3*(i-1)+1,  9*(j-1)+3*(i-1)+2,  9*(j-1)+3*(i-1)+3 /), miscvartype%DistrLoad_QP(1:3,i,j), &
 & location=SourceLocation( &
 & 'test_BD_DistrLoadCopy.F90', &
 & 40) )
  if (anyExceptions()) return
#line 41 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_DistrLoadCopy.F90"
#line 41 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_DistrLoadCopy.F90"
  call assertEqual((/ -9*(j-1)-3*(i-1)-1, -9*(j-1)-3*(i-1)-2, -9*(j-1)-3*(i-1)-3 /), miscvartype%DistrLoad_QP(4:6,i,j), &
 & location=SourceLocation( &
 & 'test_BD_DistrLoadCopy.F90', &
 & 41) )
  if (anyExceptions()) return
#line 42 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_DistrLoadCopy.F90"
        end do
    end do
end subroutine

module Wraptest_BD_DistrLoadCopy
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_BD_DistrLoadCopy

function test_BD_DistrLoadCopy_suite() result(suite)
   use pFUnit_mod
   use Wraptest_BD_DistrLoadCopy
   type (TestSuite) :: suite

   external test_BD_DistrLoadCopy


   suite = newTestSuite('test_BD_DistrLoadCopy_suite')

   call suite%addTest(newTestMethod('test_BD_DistrLoadCopy', test_BD_DistrLoadCopy))


end function test_BD_DistrLoadCopy_suite

