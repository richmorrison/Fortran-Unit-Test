
default: fortran_app/bin/fortran_app c_app/bin/c_app run_test

fortran_app/bin/fortran_app: fortran_app/src/fortran_app.f90 fortran_app/bin/lib/libSquared.so
	mkdir -p fortran_app/bin
	gfortran -std=f2018 -Lfortran_app/bin/lib fortran_app/src/fortran_app.f90 -lSquared -o fortran_app/bin/fortran_app

fortran_app/bin/lib/libSquared.so: fortran_app/src/lib/Squared.f90
	mkdir -p fortran_app/bin/lib
	gfortran -std=f2018 -shared -fPIC -o fortran_app/bin/lib/libSquared.so fortran_app/src/lib/Squared.f90

c_app/bin/c_app: c_app/src/c_app.c fortran_app/bin/lib/libSquared.so
	mkdir -p c_app/bin
	gcc -Lfortran_app/bin/lib c_app/src/c_app.c -lSquared -o c_app/bin/c_app

test/bin/test: test/src/Squared.cpp fortran_app/bin/lib/libSquared.so
	mkdir -p test/bin
	g++ -fopenmp -Lfortran_app/bin/lib test/src/Squared.cpp -lSquared -lgtest -lgtest_main -o test/bin/test

.PHONY: run_fortran_app
run_fortran_app: fortran_app/bin/fortran_app fortran_app/bin/lib/libSquared.so
	echo "Executing Fortran app that links to Fortran lib*.so"
	LD_LIBRARY_PATH=fortran_app/bin/lib fortran_app/bin/fortran_app

.PHONY: run_c_app
run_c_app: c_app/bin/c_app fortran_app/bin/lib/libSquared.so
	echo "Executing C app that links to Fortran lib*.so"
	LD_LIBRARY_PATH=fortran_app/bin/lib c_app/bin/c_app

.PHONY: run_test
run_test: test/bin/test fortran_app/bin/lib/libSquared.so
	echo "Executing C test suite against Fortran lib*.so"
	LD_LIBRARY_PATH=fortran_app/bin/lib test/bin/test

.PHONY: clean
clean:
	rm -r fortran_app/bin c_app/bin test/bin
