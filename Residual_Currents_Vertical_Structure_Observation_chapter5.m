%% 垂向余流结构——洪、枯季实测数据计算#A，#B

clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\计算余流dry-20211020-1107-1123-1');
%余流数据分为洪枯季，dry和wet，第1-3行为#A点uS,uE,uL，对应斯托克斯余流，欧拉余流和拉格朗日余流，单位cm/s；第3-6行为#B的。
load('洪枯季#A#B观测点各层余流uEuSuL.mat');


for i=1:6 %行数
for j=1:6 %列数，水层1-6
x1(i,7-j)=dry_residual_current(i,j);%余流数据，由表层至底层逆序写入
x2(i,7-j)=wet_residual_current(i,j);
end
end
%% 枯季余流
figure,
sgtitle('枯季余流垂向结构','FontSize',16);
subplot(1,2,1),%#A点
y=1:6;%layers
% yyaxis left 
plot(x1(1,:),y,'m-o','LineWidth',2);%粉色m，斯托克斯余流
hold on
plot(x1(2,:),y,'b-o','LineWidth',2);%蓝色m，欧拉余流
hold on
plot(x1(3,:),y,'r-o','LineWidth',2);%洪色m，拉格朗日余流
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%洪色m，拉格朗日余流
% xlim([min(x)-5 max(x)+0.1*max(x)]);%调整x坐标
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'（a）枯季#A','fontsize',16);%图号
% legend('斯托克斯余流','欧拉余流','拉格朗日余流','fontsize',14);
xlabel('流速（cm/s）','FontSize',16);
ylabel('相对水深（H）','FontSize',16);
set(gca,'fontsize',16);

subplot(1,2,2),%#b点
y=1:6;%layers
% yyaxis left 
plot(x1(4,:),y,'m-o','LineWidth',2);%粉色m，斯托克斯余流
hold on
plot(x1(5,:),y,'b-o','LineWidth',2);%蓝色m，欧拉余流
hold on
plot(x1(6,:),y,'r-o','LineWidth',2);%洪色m，拉格朗日余流
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%洪色m，拉格朗日余流
% xlim([min(x)-5 max(x)+0.1*max(x)]);%调整x坐标
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'（b）枯季#B','fontsize',16);%图号
legend('斯托克斯余流','欧拉余流','拉格朗日余流','fontsize',14);
xlabel('流速（cm/s）','FontSize',16);
ylabel('相对水深（H）','FontSize',16);
set(gca,'fontsize',16);

%% 洪季余流
figure,
sgtitle('洪季余流垂向结构','FontSize',16);
subplot(1,2,1),%#A点
y=1:6;%layers
% yyaxis left 
plot(x2(1,:),y,'m-o','LineWidth',2);%粉色m，斯托克斯余流
hold on
plot(x2(2,:),y,'b-o','LineWidth',2);%蓝色m，欧拉余流
hold on
plot(x2(3,:),y,'r-o','LineWidth',2);%洪色m，拉格朗日余流
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%洪色m，拉格朗日余流
% xlim([min(x)-5 max(x)+0.1*max(x)]);%调整x坐标
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'（a）洪季#A','fontsize',16);%图号
% legend('斯托克斯余流','欧拉余流','拉格朗日余流','fontsize',14);
xlabel('流速（cm/s）','FontSize',16);
ylabel('相对水深（H）','FontSize',16);
set(gca,'fontsize',16);

subplot(1,2,2),%#b点
y=1:6;%layers
% yyaxis left 
plot(x2(4,:),y,'m-o','LineWidth',2);%粉色m，斯托克斯余流
hold on
plot(x2(5,:),y,'b-o','LineWidth',2);%蓝色m，欧拉余流
hold on
plot(x2(6,:),y,'r-o','LineWidth',2);%洪色m，拉格朗日余流
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%洪色m，拉格朗日余流
% xlim([min(x)-5 max(x)+0.1*max(x)]);%调整x坐标
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'（b）洪季#B','fontsize',16);%图号
legend('斯托克斯余流','欧拉余流','拉格朗日余流','fontsize',14);
xlabel('流速（cm/s）','FontSize',16);
ylabel('相对水深（H）','FontSize',16);
set(gca,'fontsize',16);