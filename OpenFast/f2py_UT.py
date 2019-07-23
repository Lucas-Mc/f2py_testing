# from test_BD_CheckRotMat import test_BD_CheckRotMat 
import numpy
#from test_tools import test_tools
from atest import test_tools
# from atest import RonXAxis

# print(BeamDyn_Subs.BD_CheckRotMat.__doc__)

# test_BD_CheckRotMat()
n = [1,0,0]
angle = numpy.pi  
testR = test_tools.calcRotationMatrix(angle,n)
print(testR)
