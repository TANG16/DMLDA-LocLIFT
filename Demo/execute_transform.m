function [P] = execute_transform(X, Y, transform_type, transform_parameter)
%
% Input:
%      X -- a N*D training data matrix, where each row indicates an instance
%      Y -- a N*Q binary label matrix
%      transform_type -- transform type
%          
%     parameter.ratio -- a constant to detect the number of dimensions
%     parameter.beta  -- a trade-off factor in MLSI and MVMD
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameter = transform_parameter;

switch(transform_type)
    case 1 %PCA
        disp('PCA -------------------');
        [P] = PCA_transform(X,Y,parameter);
        
 
    case 2 %MLSI
        disp('MLSI--------------------');
        [P] = MLSI_transform(X,Y,parameter);
        
    case 3 %MDDMp with orthonormal transforms
        disp('MDDMp--------------------');
        [P] = MDDM_transform(X,Y,parameter,0);
        
        
    case 4 %MVMD with orthonormal transforms
        disp('MVMD--------------------');
        [P] = MVMD_transform(X,Y,parameter);   
        
    case 5 % DMLDA (Sb & Sw)
        disp('DMLDA--------------------');
        [P] = DMLDA_transform(X,Y,parameter,3);
           

        
end

end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
