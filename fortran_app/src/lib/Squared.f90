function Squared(i) bind(C, name="squared_")
  implicit none
  real(kind=8) :: Squared
  real(kind=8), intent( IN ) :: i
  Squared = i*i
end function Squared
