import numpy
import fib1
import unittest

class TestFib1(unittest.TestCase):

  def test_fib(self):

    a = numpy.zeros(8,'d')
    fib1.fib(a)

    self.assertListEqual(list(a),[0,1,1,2,3,5,8,13])

if __name__ == '__main__':
  unittest.main()
