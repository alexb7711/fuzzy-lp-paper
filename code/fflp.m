##======================================================================================================================
# Octave can solve Linear Programming problems using the `gplk' function.
# [min | max] J = C'*x
# s.t
# A*x [= | <= | >=] b
# x >= LB
# x <= UB
##======================================================================================================================

##======================================================================================================================
# Script
##======================================================================================================================

# Calculate objective function params
C = [1/3, 1/3, 1/3, 2/3, 1/3, 2/3, 0  , 0  , 0, 0  , 0  , 0, 0  , 0  , 0, 0  , 0  , 0]';

# Write out A matrix
# x11     , x12     , x13     , x21     , x22     , x23     , s11     , s12     , s13     , s11'    , s12'    , s13'    , s21     , s22     , s23     , s21'    , s22'    , s23'
A = ...
 [4       , 0       , 0       , 3       , 0       , 0       , 1       , 0       , 0       , -1      , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ;
  0       , 1       , 0       , 0       , 2       , 0       , 0       , 1       , 0       , 0       , -1      , 0       , 0       , 0       , 0       , 0       , 0       , 0       ;
  0       , 0       , 0       , 0       , 0       , 1       , 0       , 0       , 1       , 0       , 0       , -1      , 0       , 0       , 0       , 0       , 0       , 0       ;
  3       , 0       , 0       , 2       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 1       , 0       , 0       , -1      , 0       , 0       ;
  0       , 1       , 0       , 0       , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 1       , 0       , 0       , -1      , 0       ;
  0       , 0       , 2       , 0       , 0       , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 1       , 0       , 0       , -1      ;
  0       , 0       , 0       , 0       , 0       , 0       , 0.3333  , 0.3333  , 0.3333  ,-0.3333  ,-0.3333  ,-0.3333  , 0       , 0       , 0       , 0       , 0       ,  0      ;
  0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0.3333  , 0.3333  , 0.3333  ,-0.3333  ,-0.3333  , -0.3333 ;
  -1      , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ,  0      ;
  0       , -1      , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ,  0      ;
  0       , 0       , 0       , -1      , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ,  0      ;
  0       , 0       , 0       , 0       , -1      , 1       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ,  0];

# Write out B matrix
b = [2 1 2 1 0 1 0 0 0 0 0 0]';

# Write out bounds
lb=[0,0,0,       0,0,0,       0,0,0,       0,0,0,       0,0,0,          0,0,0];
ub=[Inf,Inf,Inf, Inf,Inf,Inf, Inf,Inf,Inf, Inf,Inf,Inf, Inf,Inf,Inf,    Inf,Inf,Inf];

# Write out bound types and variable types
ctype = "SSSSSSUULLLL";
vtype = "CCCCCCCCCCCCCCCCCC";

# Maximize
s = 1;

# Solve
[xopt, zmx] = glpk(C,A,b,lb,ub,ctype,vtype,s)
