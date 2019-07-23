## How to run f90wrap in this repo

#### Generate the f90wrap output
f90wrap -m pyBDTestTools test_tools.F90 BeamDyn_Types.f90 nwtc-library/src/*.f90 -k kind_map

#### Compile with f2py (or the f90wrap version of f2py)
f2py-f90wrap --fcompiler=gfortran --build-dir . -c -m _pyBDTestTools f90wrap*.f90
