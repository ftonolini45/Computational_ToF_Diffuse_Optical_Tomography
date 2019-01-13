function AX = fwd_op_convol_new(X, bf, I, A, a0)

X3D = repmat(X,1,1,size(I,3));
Xa = pad_3D(X3D, bf,bf,0) ;
AX = run_fmodel_new(Xa.*I,A,a0);

end