transform_type=5; %降维方法
transform_parameter.ratio = 10; %降的维数
%% 融合
%  load('xinne-pseaac45.mat')
%  load('nepssm3.mat')
%   load('neEBGW_40.mat')
%   load('ertai.mat')
%   load('duoweidian.mat')
load('A.mat')
 % rong=[paac,psepssm,eb1,eb2,eb3,jieguo];
 % rong(weidian,:)=[];
  %X=[rong,gozhengli];%全部融合
[YANGBEN,WEISHU]=size(L);
%数据处理
train_data = X;
train_label = L;
[N, D] = size(train_data);
mean_train = mean(train_data);
train_CX = train_data - repmat(mean_train,N,1); %centralizing training features
mean_label = mean(train_label);
train_CY = train_label - repmat(mean_label, N, 1);
currentTrainData = train_CX;
%降维方法
transform_parameter.rank = 1;
switch(transform_type)
    case 1 %PCA

        
    case 2 %MLSI
        transform_parameter.beta = 0.5;
        transform_parameter.regXY = 0.1;
        transform_parameter.regX  = 0.1;
        
    case 3 %MDDMp
        
        
    case 4 %MVMD
        transform_parameter.beta  = 0.5;
        
    otherwise % wMLDA
        %KBS
        transform_parameter.regXY = 0.1;
        
end

if (transform_type >0)
    % execute a FE method
    if(transform_type >=1 && transform_type <=4) 
            [PPP] = execute_transform(currentTrainData, train_CY, transform_type, transform_parameter); 
    else
            [PPP] = execute_transform(currentTrainData, train_label, transform_type, transform_parameter);
    end
    current = currentTrainData * PPP;        
end

%% 杰克刀测试
%Set the ratio parameter used by LIFT
ratio=0.1;
svm.type='RBF';
svm.para=0.1;
P=[];
for i=1:YANGBEN
    A=current;
    B=L';
    test_data=A(i,:);test_target=B(:,i);
    A(i,:)=[];B(:,i)=[];
    train_data=A;train_target=B;
[Outputs,Pre_Labels]=LIFT(train_data,train_target,test_data,test_target,ratio,svm);
P=[P;Pre_Labels'];
end

%% 评价指标
Hl=Hamming_loss(P',L');
Ap=Average_precision(P',L');
Cv=coverage(P',L');
Oe=One_error(P',L');
Rls=Ranking_loss(P',L');
OAA=0;
for i=1:YANGBEN
if P(i,:)==L(i,:);
OAA=OAA+1;
end
end
zuiOAA=OAA;
clear OAA
zhengque(:,:)=gelei(L,P,WEISHU,YANGBEN);