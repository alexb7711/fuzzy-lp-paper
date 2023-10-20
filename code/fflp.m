##======================================================================================================================
# Octave can solve Linear Programming problems using the `gplk' function.
# [min | max] J = C'*x
# s.t
# A*x [= | <= | >=] b
# x >= LB
# x <= UB
##======================================================================================================================
1;

##======================================================================================================================
# Script
##======================================================================================================================

##----------------------------------------------------------------------------------------------------------------------
## usage: print_eq (A,b,xopt)
##
##
function print_eq (A,b,xopt)
  ## Calculate LHS
  Ax = A*xopt;

  ## Print solution
  printf("Solution\n");
  disp(xopt);

  ## Print equations
  printf("Constraint Verification\n");
  printf("%f =  %f\n", Ax(1), b(1));
  printf("%f =  %f\n", Ax(2), b(2));
  printf("%f =  %f\n", Ax(3), b(3));
  printf("%f =  %f\n", Ax(4), b(4));
  printf("%f =  %f\n", Ax(5), b(5));
  printf("%f =  %f\n", Ax(6), b(6));

endfunction

##======================================================================================================================
# Script
##======================================================================================================================

# Calculate objective function params

C = [1/4, 1, 3/2, 2/4, 6/4, 4/2]';

# Write out A matrix
# x11  , x12  , x13  , x21  , x22  , x23
A = ...
 [0    , 0    , 0    , 1    , 0    , 0     ;
  0    , 1    , 0    , 0    , 2    , 0     ;
  0    , 0    , 2    , 0    , 0    , 3     ;
  1    , 0    , 0    , 0    , 0    , 0     ;
  0    , 2    , 0    , 0    , 1    , 0     ;
  0    , 0    , 3    , 0    , 0    , 2     ;
  -1   , 1    , 0    , 0    , 0    , 0     ;
  0    , -1   , 1    , 0    , 0    , 0     ;
  0    , 0    , 0    , -1   , 1    , 0     ;
  0    , 0    , 0    , 0    , -1   , 1     ];


# Write out B matrix
b = [1 10 27 2 11 28 0 0 0 0]';

# Write out bounds
lb=[0,0,0,       0,0,0];
ub=[Inf,Inf,Inf, Inf,Inf,Inf];

# Write out bound types and variable types
ctype = "UUUUUULLLL";
vtype = "CCCCCC";

# Maximize
s = -1;

# Solve
[min, fmin, status, extra] = glpk(C,A,b,lb,ub,ctype,vtype,s);

# Print equations
print_eq(A,b,min)
