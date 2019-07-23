!@test
subroutine test_ExtractRelativeRotation()
    ! this is actually an integration test not a unit test...

    use pFUnit_mod
    use BeamDyn_Subs
    use NWTC_Num
    use test_tools
    
    implicit none
    
    real(BDKi), dimension(3)   :: rr
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    integer(IntKi)             :: ErrStat
    character                  :: ErrMsg
    
    type(BD_ParameterType)     :: parametertype
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-14
    
    
    ! --------------------------------------------------------------------------
    testname = "static simple beam under gravity:"
    
    parametertype = simpleParameterType()
    
    call ExtractRelativeRotation(identity(), parametertype, rr, ErrStat, ErrMsg)
    
#line 33 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_ExtractRelativeRotation.F90"
  call assertEqual((/ 0.0, 0.0, 0.0 /), rr, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_ExtractRelativeRotation.F90', &
 & 33) )
  if (anyExceptions()) return
#line 34 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_ExtractRelativeRotation.F90"
end subroutine

module Wraptest_ExtractRelativeRotation
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_ExtractRelativeRotation

function test_ExtractRelativeRotation_suite() result(suite)
   use pFUnit_mod
   use Wraptest_ExtractRelativeRotation
   type (TestSuite) :: suite

   external test_ExtractRelativeRotation


   suite = newTestSuite('test_ExtractRelativeRotation_suite')

   call suite%addTest(newTestMethod('test_ExtractRelativeRotation', test_ExtractRelativeRotation))


end function test_ExtractRelativeRotation_suite

