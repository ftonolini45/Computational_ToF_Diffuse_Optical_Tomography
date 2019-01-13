function Xd = Reconstruction_method(Af, I , X0, cX0, niter, acceleration, s, OldMatlab, C2, CDS2, a0, parameters, display_iterations)

% *************************************************************************
% Reconstruction algorithm solving
% ... TO BE COMPLETED

% Related paper:

% Contact:

% *************************************************************************
% INPUT VARIABLES:
% Af: 
% I: 
% X0: 
% cX0:
% niter:
% acceleration:
% s:
% OldMatlab:
% C2:
% CDS2:
% a0:
% display_iterations:

% *************************************************************************
% OUTPUT VARIABLE:
% Xd:

% *************************************************************************

bf = parameters{1};
lambda1 = parameters{2};
lambda2 = parameters{3};

py = (size(Af,1) - size(I,1))/2 ; 
px = (size(Af,2) - size(I,2))/2 ; 
pz = size(I,3)/2 ;

AXC = [];
X = cX0*X0; % Initial guess

for i = 1:niter
    
    % Increase the step size after some iterations
    if acceleration == 1
        if i ==200
            s = 2*s;
        end
        if i==1000
            s = 2*s;
        end
    end
    
    % print out some info
    if i>1 && mod(i,50)==0
        disp('******************************************')
        fprintf('iteration number %d \n',i)
        disp(['obj. function: ', num2str(obj)])
        disp(['data fid     : ', num2str(data_fid)])
        disp(['reg TV       : ', num2str(lambda1*reg_TV)])
        disp(['reg l1       : ', num2str(lambda2*reg_l1)])
        disp(['norm grad.   : ', num2str(norm(D(:)))])
        disp(['Step Size    : ', num2str(norm(s*D(:)))])
        disp(['coefficient  : ', num2str(s)])
    end
    
    Xd = X; % current reconstruction to be visualised.
    
    
    % Gradient data fidelity: A'(Ax-b) ------------------------------------
    % ---------------------------------------------------------------------
    if OldMatlab==1
        AX = fwd_op_convol_OldMatlab(X,bf,I,Af,a0) ;
    else
        AX = fwd_op_convol(X,bf,I,Af,a0) ;
    end
    % Residual
    AXc = AX-C2; % Computing Ax-b -- residual
    AXc = AXc.*CDS2; % ignore low intensity pixels
    
    % applying transpose operator A' with a convolution 
    t1 = bwd_op_convol_fast_At(AXc,bf, I, Af, a0,py,px,pz) ; % t1 = A'(Ax-b)
    
    % Gradient TV ---------------------------------------------------------
    % ---------------------------------------------------------------------
    tvd = TV_derivative(X); % derivative of TV norm.
    
    % Gradient ------------------------------------------------------------
    % ---------------------------------------------------------------------
    D = t1+lambda1*tvd+lambda2*sign(X); % Gradient of cost function
    
    % Gradient descent step -----------------------------------------------
    % ---------------------------------------------------------------------
    X = X-s*D; % make a step of size s in direction -D
    
    % Objective function --------------------------------------------------
    % ---------------------------------------------------------------------
    data_fid = norm(AXc(:)) ;
    reg_TV = TV_norm(X) ;
    reg_l1 = norm(X(:),1) ;
    obj = data_fid+lambda1*reg_TV+lambda2*reg_l1;
    AXC = [AXC,obj];
    
    % Display images ------------------------------------------------------ 
    % ---------------------------------------------------------------------  
    if display_iterations > 0 && mod(i,display_iterations) == 0
        
        figure(1)
        
        subplot(2,3,1)
        imagesc(mat2gray(Xd)), axis image, colorbar, colormap bone
        xlabel('normalised current estimate')
        drawnow

        subplot(2,3,2)
        imagesc([(sum(AX,3));(sum(C2,3))]), axis image, colorbar, colormap bone
        xlabel('AX vs. Y')
        drawnow
        
        subplot(2,3,3)
        imagesc(-s*D), axis image, colorbar, colormap bone
        xlabel('normalised gradient')
        drawnow
        
        subplot(2,3,4)
        plot(AXC)
        xlabel('it.'), ylabel('obj.')
        drawnow
        
        AX1 = AX; C21 = C2;
        perarray = [1,3,2];
        np = round(size(AX1,2)/2);
        C2p = permute(C21,perarray);
        Ap = permute(AX1,perarray);
        dtn = 1;
        C2pi = C2p(np-dtn:np+dtn,:,np-dtn:np+dtn); C2pi = sum(C2pi,3); C2pi = sum(C2pi,1);
        Api = Ap(np-dtn:np+dtn,:,np-dtn:np+dtn); Api = sum(Api,3); Api = sum(Api,1);
        
        subplot(2,3,5)
        imagesc([Ap(:,:,np)-C2p(:,:,np)]);
        drawnow
        
        subplot(2,3,6)
        plot(1:length(Ap(np,:,np)),C2pi,'b',1:length(Ap(np,:,np)),Api,'r')
        
    end
    
end

end