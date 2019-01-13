function B = fix_periodicity(A)

h1 = round(size(A,1)/2);
h2 = round(size(A,2)/2);
h3 = round(size(A,3)/2);

B = zeros(size(A));
B(1:h1,1:h2,:) = A(h1+1:size(A,1),h2+1:size(A,2),:);
B(1:h1,h2+1:size(A,2),:) = A(h1+1:size(A,2),1:h2,:);
B(h1+1:size(A,1),h2+1:size(A,2),:) = A(1:h1,1:h2,:);
B(h1+1:size(A,1),1:h2,:) = A(1:h1,h2+1:size(A,2),:);

B2 = zeros(size(A));
B2(:,:,1:h3) = B(:,:,h3+1:size(A,3));
B2(:,:,h3+1:size(A,3)) = B(:,:,1:h3);
B = B2;