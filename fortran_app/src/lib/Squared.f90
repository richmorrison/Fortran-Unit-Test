function Squared(i) bind(C, name="squared_")
  use iso_fortran_env, only: double=>real64
  implicit none
  real(double) :: Squared
  real(double), intent( IN ) :: i
  Squared = i*i
end function Squared
