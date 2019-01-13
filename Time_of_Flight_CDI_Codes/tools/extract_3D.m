function B = extract_3D(A,py,px,pz)

% B = A(py+1:size(A,1)-py,px+1:size(A,2)-px,pz+1:size(A,3)-pz);
B = A(py+1:size(A,1)-py,px+1:size(A,2)-px,1:size(A,3)-2*pz);