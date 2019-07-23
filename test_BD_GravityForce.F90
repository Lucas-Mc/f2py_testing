!@test
subroutine test_BD_GravityForce()
    
    use pFUnit_mod
    use BeamDyn
    use NWTC_Num
    use test_tools
    
    implicit none
    
    integer                    :: i, j
    real(BDKi)                 :: gravity(3)
    type(BD_ParameterType)     :: parametertype
    type(BD_MiscVarType)       :: miscvartype
    real(BDKi)                 :: baseline(6)
    integer(IntKi)             :: ErrStat
    character                  :: ErrMsg
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-14
    
    
    ! --------------------------------------------------------------------------
    testname = "static simple beam under gravity:"
    baseline(1:3) = getGravityInZ()
    baseline(4:6) = (/ 0.0, 0.0, 0.0 /)
    
    ! allocate and build the custom types
    parametertype = simpleParameterType()
    miscvartype = simpleMiscVarType(parametertype%nqp, parametertype%elem_total)
    
    gravity = getGravityInZ()
    
    ! call the subroutine to test
    call BD_GravityForce(1, parametertype, miscvartype, gravity)
    
    ! test the values
#line 42 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GravityForce.F90"
  call assertEqual(baseline, miscvartype%qp%Fg(:,1,1), tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GravityForce.F90', &
 & 42) )
  if (anyExceptions()) return
#line 43 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GravityForce.F90"
    
end subroutine

module Wraptest_BD_GravityForce
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_BD_GravityForce

function test_BD_GravityForce_suite() result(suite)
   use pFUnit_mod
   use Wraptest_BD_GravityForce
   type (TestSuite) :: suite

   external test_BD_GravityForce


   suite = newTestSuite('test_BD_GravityForce_suite')

   call suite%addTest(newTestMethod('test_BD_GravityForce', test_BD_GravityForce))


end function test_BD_GravityForce_suite

