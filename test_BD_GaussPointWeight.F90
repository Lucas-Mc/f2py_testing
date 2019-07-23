!@test
subroutine test_BD_GaussPointWeight()
    ! test branches
    ! - p = 1, invalid value
    ! - p = 2, boundaries only
    ! - p = 5, odd number
    ! - p = 6, even number
    ! - p = 97, large, prime number

    use pFUnit_mod
    use BeamDyn_Subs
    use NWTC_Num
    use test_tools
    
    implicit none
    
    integer                    :: p
    real(BDKi), allocatable    :: locations(:), weights(:)
    real(BDKi), allocatable    :: baselinelocations(:), baselineweights(:)
    integer(IntKi)             :: ErrStat
    character                  :: ErrMsg
    character(1024)            :: testname
    real(BDKi)                 :: tolerance
    
    ! initialize NWTC_Num constants
    call SetConstants()
    
    tolerance = 1e-10
  
    
    ! the baseline solutions for this unit test can be calculated using the Gauss-Lobatto quadrature
    ! the Python Numpy package provides this functionality with numpy.polynomial.legendre.leggauss.
    ! the first array returned are locations and the second are the weights
    ! >>> from numpy import polynomial
    ! >>> polynomial.legendre.leggauss(2)
    ! (array([-0.57735027,  0.57735027]), array([ 1.,  1.]))
    ! >>> polynomial.legendre.leggauss(5)
    ! (array([-0.90617985, -0.53846931,  0.        ,  0.53846931,  0.90617985]), array([ 0.23692689,  0.47862867,  0.56888889,  0.47862867,  0.23692689]))
  
  
    ! --------------------------------------------------------------------------
    testname = "p = 1, invalid value:"
    p = 1
    call AllocAry(baselinelocations, p, "GLL baseline", ErrStat, ErrMsg)
    call AllocAry(baselineweights, p, "GLL baseline", ErrStat, ErrMsg)
    baselinelocations = (/ -0.57735026919, 0.57735026919 /)
    baselineweights = (/ 1.0, 1.0/)

    call AllocAry(locations, p, "GLL nodes", ErrStat, ErrMsg)
    call AllocAry(weights, p, "GLL weights", ErrStat, ErrMsg)
    call BD_GaussPointWeight(p, locations, weights, ErrStat, ErrMsg)
    
#line 53 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(4, ErrStat, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 53) )
  if (anyExceptions()) return
#line 54 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
    
    deallocate(baselinelocations)
    deallocate(baselineweights)
    deallocate(locations)
    deallocate(weights)
    
    
    ! --------------------------------------------------------------------------
    testname = "p = 2, boundaries only:"
    p = 2
    call AllocAry(baselinelocations, p, "GLL baseline", ErrStat, ErrMsg)
    call AllocAry(baselineweights, p, "GLL baseline", ErrStat, ErrMsg)
    baselinelocations = (/ -0.57735026919, 0.57735026919 /)
    baselineweights = (/ 1.0, 1.0/)

    call AllocAry(locations, p, "GLL nodes", ErrStat, ErrMsg)
    call AllocAry(weights, p, "GLL weights", ErrStat, ErrMsg)
    call BD_GaussPointWeight(p, locations, weights, ErrStat, ErrMsg)
    
#line 73 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselinelocations, locations, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 73) )
  if (anyExceptions()) return
#line 74 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
#line 74 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselineweights, weights, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 74) )
  if (anyExceptions()) return
#line 75 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
    
    deallocate(baselinelocations)
    deallocate(baselineweights)
    deallocate(locations)
    deallocate(weights)
    
    
    ! --------------------------------------------------------------------------
    testname = "p = 5, odd number:"
    p = 5
    call AllocAry(baselinelocations, p, "GLL baseline", ErrStat, ErrMsg)
    call AllocAry(baselineweights, p, "GLL baseline", ErrStat, ErrMsg)
    baselinelocations = (/ -0.906179845939, -0.538469310106, 0.0, 0.538469310106, 0.906179845939 /)
    baselineweights = (/ 0.236926885056, 0.478628670499, 0.568888888889, 0.478628670499, 0.236926885056 /)
    
    call AllocAry(locations, p, "GLL nodes", ErrStat, ErrMsg)
    call AllocAry(weights, p, "GLL weights", ErrStat, ErrMsg)
    call BD_GaussPointWeight(p, locations, weights, ErrStat, ErrMsg)
    
#line 94 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselinelocations, locations, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 94) )
  if (anyExceptions()) return
#line 95 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
#line 95 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselineweights, weights, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 95) )
  if (anyExceptions()) return
#line 96 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
    
    deallocate(baselinelocations)
    deallocate(baselineweights)
    deallocate(locations)
    deallocate(weights)
    

    ! --------------------------------------------------------------------------
    testname = "p = 6, even number:"
    p = 6
    call AllocAry(baselinelocations, p, "GLL baseline", ErrStat, ErrMsg)
    call AllocAry(baselineweights, p, "GLL baseline", ErrStat, ErrMsg)
    baselinelocations = (/ -0.932469514203, -0.661209386466, -0.238619186083, 0.238619186083, 0.661209386466, 0.932469514203 /)
    baselineweights = (/ 0.171324492379, 0.360761573048, 0.467913934573, 0.467913934573, 0.360761573048, 0.171324492379 /)
    
    call AllocAry(locations, p, "GLL nodes", ErrStat, ErrMsg)
    call AllocAry(weights, p, "GLL weights", ErrStat, ErrMsg)
    call BD_GaussPointWeight(p, locations, weights, ErrStat, ErrMsg)
    
#line 115 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselinelocations, locations, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 115) )
  if (anyExceptions()) return
#line 116 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
#line 116 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
  call assertEqual(baselineweights, weights, tolerance, testname, &
 & location=SourceLocation( &
 & 'test_BD_GaussPointWeight.F90', &
 & 116) )
  if (anyExceptions()) return
#line 117 "/Users/lmccullu/openfast/unit_tests/../modules/beamdyn/tests/test_BD_GaussPointWeight.F90"
    
    deallocate(baselinelocations)
    deallocate(baselineweights)
    deallocate(locations)
    deallocate(weights)

end subroutine

module Wraptest_BD_GaussPointWeight
   use pFUnit_mod
   implicit none
   private

contains


end module Wraptest_BD_GaussPointWeight

function test_BD_GaussPointWeight_suite() result(suite)
   use pFUnit_mod
   use Wraptest_BD_GaussPointWeight
   type (TestSuite) :: suite

   external test_BD_GaussPointWeight


   suite = newTestSuite('test_BD_GaussPointWeight_suite')

   call suite%addTest(newTestMethod('test_BD_GaussPointWeight', test_BD_GaussPointWeight))


end function test_BD_GaussPointWeight_suite

