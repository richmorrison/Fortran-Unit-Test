program Square
  use iso_fortran_env, only: double=>real64
  implicit none
  real(kind=double):: i, Squared
  print *, 'Enter number: '
  read *, i
  print *, 'Squared: ', Squared(i)
end program Square
