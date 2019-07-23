!@test
subroutine test_BD_CrvCompose()
    ! test branches
    ! - both rotation angles 0, no transpose of input rotations (flag = 0)
    ! - delta2 > 0, no transpose of input rotations (flag = 0)
    ! - delta2 < 0, no transpose of input rotations (flag = 0)
    ! - flag = 1
    ! - flag = 2
    ! - flag = 3
    
    use pFUnit_mod
    use BeamDyn_Subs
    use NWTC_Num
    use test_tools
    
    implicit none
    
    ! input rotation axis and angle
    real(BDKi), dimension(3)   :: n1, n2
    real(BDKi)                 :: angle1, angle2
    
    ! result rotations
    real(BDKi), dimension(3,3) :: testrotation, baselinerotation, r1, r2
    real(BDKi), dimension(3)   :: composedparams
    
    ! other test settings
    integer                    :: flag
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-14
    
    ! set the rotation axes for all tests
    n1 = (/ 1, 0, 0 /) ! x axis
    n2 = (/ 0, 0, 1 /) ! z axis
    
    
    ! --------------------------------------------------------------------------
    testname = "both rotation angles 0, no transpose of input rotations (flag = 0):"
    angle1 = 0 ! 0 degrees
    angle2 = 0 ! 0 degrees
    flag = 0
    
    ! both rotations should return an identity matrix    
    r1 = calcRotationMatrix(angle1, n1)
    r2 = calcRotationMatrix(angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 55 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 55) )
  if (anyExceptions()) return
#line 56 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "delta2 > 0, no transpose of input rotations (flag = 0):"
    angle1 = PiBy2_D ! 90 degrees
    angle2 = PiBy2_D ! 90 degrees
    flag = 0
    
    r1 = calcRotationMatrix(angle1, n1)
    r2 = calcRotationMatrix(angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 71 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 71) )
  if (anyExceptions()) return
#line 72 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
      
    
    ! --------------------------------------------------------------------------
    testname = "delta2 < 0, no transpose of input rotations (flag = 0):"
    angle1 = PiBy2_D ! 90 degrees
    angle2 = 1.5*Pi  ! 270 degrees
    flag = 0
    
    r1 = calcRotationMatrix(angle1, n1)
    r2 = calcRotationMatrix(angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 87 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 87) )
  if (anyExceptions()) return
#line 88 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "delta2 > 0, transpose of first rotation (flag = 1):"
    angle1 = PiBy2_D ! 90 degrees
    angle2 = PiBy2_D ! 90 degrees
    flag = 1
    
    r1 = calcRotationMatrix(-angle1, n1)
    r2 = calcRotationMatrix(angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 103 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 103) )
  if (anyExceptions()) return
#line 104 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "delta2 > 0, transpose of second rotation (flag = 2):"
    angle1 = PiBy2_D ! 90 degrees
    angle2 = PiBy2_D ! 90 degrees
    flag = 2
    
    r1 = calcRotationMatrix(angle1, n1)
    r2 = calcRotationMatrix(-angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 119 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 119) )
  if (anyExceptions()) return
#line 120 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
    
    
    ! --------------------------------------------------------------------------
    testname = "delta2 > 0, transpose of both rotations (flag = 3):"
    angle1 = PiBy2_D ! 90 degrees
    angle2 = PiBy2_D ! 90 degrees
    flag = 3
    
    r1 = calcRotationMatrix(-angle1, n1)
    r2 = calcRotationMatrix(-angle2, n2)
    baselinerotation = matmul(r1,r2)
    
    call BD_CrvCompose(composedparams, 4*tan(angle1/4)*n1, 4*tan(angle2/4)*n2, flag)
    call BD_CrvMatrixR(composedparams, testrotation)
    
#line 135 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
  call assertEqual(baselinerotation, testrotation, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_CrvCompose.F90', &
 & 135) )
  if (anyExceptions()) return
#line 136 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_CrvCompose.F90"
    
end subroutine

module Wraptest_BD_CrvCompose
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_BD_CrvCompose

function test_BD_CrvCompose_suite() result(suite)
   use pFUnit_mod
   use Wraptest_BD_CrvCompose
   type (TestSuite) :: suite

   external test_BD_CrvCompose


   suite = newTestSuite('test_BD_CrvCompose_suite')

   call suite%addTest(newTestMethod('test_BD_CrvCompose', test_BD_CrvCompose))


end function test_BD_CrvCompose_suite

