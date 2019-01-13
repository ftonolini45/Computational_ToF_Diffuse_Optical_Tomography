function AtY = bwd_op_convol_fast_At(Y,bf, I, PSFf, a0,py,px,pz)
% Y    : [Ny + 2bf] x [ Nx + 2bf ] x lt
% bf   : zero-padding parameter
% I    : [Ny + 2bf] x [ Nx + 2bf ] x lt
% PSFf : [ 2*(Ny + 2bf) + 2*bf ] x [ 2*(Nx + 2bf) + 2*bf ] x [2*lt]

Ny = size(Y,1) - 2*bf ;
Nx = size(Y,2) - 2*bf ;
% py = ( Ny + 2*bf + 2*bf - (Ny+2*bf) )/2 ;
% px = ( Nx + 2*bf + 2*bf - (Nx+2*bf) )/2 ;
% pz = size(I,3)/2 ;


B = zeros(size(PSFf)) ;
B(py+1:size(PSFf,1)-py, px+1:size(PSFf,2)-px, 1+pz-a0:size(PSFf,3)-a0-pz) = Y ;

Bf = fftn(B) / numel(B) ;
Af = Bf .* conj(PSFf) ;
A = ifftn(Af) * numel(Af) ;
A = A(py+1:size(PSFf,1)-py, px+1:size(PSFf,2)-px, pz+1:size(PSFf,3)-pz) ;
Xa = A .* conj(I);
AtY = Xa( bf+1:size(Xa,1)-bf, bf+1:size(Xa,1)-bf, : ) ;
AtY = sum(AtY,3) ;

end