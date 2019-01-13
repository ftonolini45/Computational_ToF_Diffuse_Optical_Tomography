function AX = fwd_op_convol_OldMatlab(X, bf, I, Af, a0)

X3D = repmat(X,1,1,size(I,3));
Xa = pad_3D(X3D, bf,bf,0) ;
AX = run_fmodl(Xa.*I,Af,a0);

end