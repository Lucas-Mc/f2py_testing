import _f2py_UT
import f90wrap.runtime
import logging

class Test_Tools(f90wrap.runtime.FortranModule):
    """
    Module test_tools
    
    
    Defined at test_tools.f90 lines 1-234
    
    """
    @staticmethod
    def calcwmparameters(params, angle, n):
        """
        calcwmparameters(params, angle, n)
        
        
        Defined at test_tools.f90 lines 10-19
        
        Parameters
        ----------
        params : float array
        angle : float
        n : float array
        
        """
        _f2py_UT.f90wrap_calcwmparameters(params=params, angle=angle, n=n)
    
    @staticmethod
    def calcrotationmatrix(angle, axis):
        """
        calcrotationmatrix = calcrotationmatrix(angle, axis)
        
        
        Defined at test_tools.f90 lines 21-39
        
        Parameters
        ----------
        angle : float
        axis : float array
        
        Returns
        -------
        calcrotationmatrix : float array
        
        """
        calcrotationmatrix = _f2py_UT.f90wrap_calcrotationmatrix(angle=angle, axis=axis)
        return calcrotationmatrix
    
    @staticmethod
    def identity():
        """
        identity = identity()
        
        
        Defined at test_tools.f90 lines 41-50
        
        
        Returns
        -------
        identity : float array
        
        """
        identity = _f2py_UT.f90wrap_identity()
        return identity
    
    @staticmethod
    def ronxaxis(angle):
        """
        ronxaxis = ronxaxis(angle)
        
        
        Defined at test_tools.f90 lines 52-62
        
        Parameters
        ----------
        angle : float
        
        Returns
        -------
        ronxaxis : float array
        
        """
        ronxaxis = _f2py_UT.f90wrap_ronxaxis(angle=angle)
        return ronxaxis
    
    @staticmethod
    def getmassmatrix():
        """
        getmassmatrix = getmassmatrix()
        
        
        Defined at test_tools.f90 lines 64-75
        
        
        Returns
        -------
        getmassmatrix : float array
        
        """
        getmassmatrix = _f2py_UT.f90wrap_getmassmatrix()
        return getmassmatrix
    
    @staticmethod
    def getstiffnessmatrix():
        """
        getstiffnessmatrix = getstiffnessmatrix()
        
        
        Defined at test_tools.f90 lines 77-88
        
        
        Returns
        -------
        getstiffnessmatrix : float array
        
        """
        getstiffnessmatrix = _f2py_UT.f90wrap_getstiffnessmatrix()
        return getstiffnessmatrix
    
    @staticmethod
    def getgravityinz():
        """
        getgravityinz = getgravityinz()
        
        
        Defined at test_tools.f90 lines 90-96
        
        
        Returns
        -------
        getgravityinz : float array
        
        """
        getgravityinz = _f2py_UT.f90wrap_getgravityinz()
        return getgravityinz
    
    _dt_array_initialisers = []
    

test_tools = Test_Tools()

class Wraptest_Tools(f90wrap.runtime.FortranModule):
    """
    Module wraptest_tools
    
    
    Defined at test_tools.f90 lines 236-245
    
    """
    pass
    _dt_array_initialisers = []
    

wraptest_tools = Wraptest_Tools()

