function[I,Q,U,DOLP,AOP] = ProcessData( I_0, I_45, I_90, I_135 )

I = I_0 + I_90;
Q = I_0 - I_90;
U = I_45 - I_135;

Q = Q/I;
U = U/I;
I = 1;

DOLP = sqrt( Q*Q + U*U ) /I;

AOP = atan(abs(U/Q)) * 180 / (2*pi);

end