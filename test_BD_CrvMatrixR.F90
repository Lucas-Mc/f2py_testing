!@test
subroutine test_BD_CrvMatrixR()
    ! test branches
    ! - simple rotation with known parameters: Pi on xaxis
    ! - 0 rotation
    ! - small rotation with baseline WM parameters calculated
    
    ! TODO
    ! invalid wm parameters (if thats a thing)
    ! does the implemented WM formulation have any boundaries?
    
    use pFUnit_mod
    use BeamDyn_Subs
    use NWTC_Num
    use test_tools
    
    implicit none
        
    real(BDKi), dimension(3,3) :: testR, baselineR
    real(BDKi), dimension(3)   :: wmparams
    real(BDKi)                 :: angle, n(3)
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    integer(IntKi)             :: ErrStat
    character                  :: ErrMsg
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-14
    
    ! set the rotation axis for all tests
    n = (/ 1, 0, 0 /) ! x axis
    
    
    ! --------------------------------------------------------------------------
    testname = "simple rotation with known parameters: Pi on xaxis:"
    angle = Pi_D
    
    baselineR = RonXAxis(angle)
    
    ! Wiener-Milenkovic parameters are <4.0, 0.0, 0.0>
    wmparams = (/ 4.0, 0.0, 0.0 /)
    call BD_CrvMatrixR(wmparams, testR)
    
#line 46 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
  call assertEqual(baselineR, testR, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvMatrixR.F90', &
 & 46) )
  if (anyExceptions()) return
#line 47 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "0 rotation:"
    angle = 0
    
    baselineR = RonXAxis(angle)
    
    ! Wiener-Milenkovic parameters are <0.0, 0.0, 0.0>
    wmparams = (/ 0.0, 0.0, 0.0 /)
    call BD_CrvMatrixR(wmparams, testR)
    
#line 59 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
  call assertEqual(baselineR, testR, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvMatrixR.F90', &
 & 59) )
  if (anyExceptions()) return
#line 60 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "small rotation with baseline WM parameters calculated:"
    angle = 0.1*Pi_D
    
    baselineR = RonXAxis(angle)
    
    ! Wiener-Milenkovic parameters are calculated; note tangent is asymptotic at +/- pi/2
    wmparams = 4*tan(angle/4)*n
    call BD_CrvMatrixR(wmparams, testR)
    
#line 72 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
  call assertEqual(baselineR, testR, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvMatrixR.F90', &
 & 72) )
  if (anyExceptions()) return
#line 73 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvMatrixR.F90"
      
end subroutine test_BD_CrvMatrixR

module Wraptest_BD_CrvMatrixR
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_BD_CrvMatrixR

function test_BD_CrvMatrixR_suite() result(suite)
   use pFUnit_mod
   use Wraptest_BD_CrvMatrixR
   type (TestSuite) :: suite

   external test_BD_CrvMatrixR


   suite = newTestSuite('test_BD_CrvMatrixR_suite')

   call suite%addTest(newTestMethod('test_BD_CrvMatrixR', test_BD_CrvMatrixR))


end function test_BD_CrvMatrixR_suite

