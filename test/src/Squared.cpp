#include <gtest/gtest.h>

extern "C" double squared_(double* i);

TEST(Squared, squares)
{
	double input=5;
	double output=25;
	
	EXPECT_EQ(squared_(&input), output);
}

TEST(Squared, example_fail)
{
	double input=5;
	double output=0;
	
	EXPECT_EQ(squared_(&input), output);
}
