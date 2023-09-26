%% ���������ṹ�����顢�ݼ�ʵ�����ݼ���#A��#B

clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\��������dry-20211020-1107-1123-1');
%�������ݷ�Ϊ��ݼ���dry��wet����1-3��Ϊ#A��uS,uE,uL����Ӧ˹�п�˹������ŷ������������������������λcm/s����3-6��Ϊ#B�ġ�
load('��ݼ�#A#B�۲���������uEuSuL.mat');


for i=1:6 %����
for j=1:6 %������ˮ��1-6
x1(i,7-j)=dry_residual_current(i,j);%�������ݣ��ɱ�����ײ�����д��
x2(i,7-j)=wet_residual_current(i,j);
end
end
%% �ݼ�����
figure,
sgtitle('�ݼ���������ṹ','FontSize',16);
subplot(1,2,1),%#A��
y=1:6;%layers
% yyaxis left 
plot(x1(1,:),y,'m-o','LineWidth',2);%��ɫm��˹�п�˹����
hold on
plot(x1(2,:),y,'b-o','LineWidth',2);%��ɫm��ŷ������
hold on
plot(x1(3,:),y,'r-o','LineWidth',2);%��ɫm��������������
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%��ɫm��������������
% xlim([min(x)-5 max(x)+0.1*max(x)]);%����x����
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'��a���ݼ�#A','fontsize',16);%ͼ��
% legend('˹�п�˹����','ŷ������','������������','fontsize',14);
xlabel('���٣�cm/s��','FontSize',16);
ylabel('���ˮ�H��','FontSize',16);
set(gca,'fontsize',16);

subplot(1,2,2),%#b��
y=1:6;%layers
% yyaxis left 
plot(x1(4,:),y,'m-o','LineWidth',2);%��ɫm��˹�п�˹����
hold on
plot(x1(5,:),y,'b-o','LineWidth',2);%��ɫm��ŷ������
hold on
plot(x1(6,:),y,'r-o','LineWidth',2);%��ɫm��������������
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%��ɫm��������������
% xlim([min(x)-5 max(x)+0.1*max(x)]);%����x����
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'��b���ݼ�#B','fontsize',16);%ͼ��
legend('˹�п�˹����','ŷ������','������������','fontsize',14);
xlabel('���٣�cm/s��','FontSize',16);
ylabel('���ˮ�H��','FontSize',16);
set(gca,'fontsize',16);

%% �鼾����
figure,
sgtitle('�鼾��������ṹ','FontSize',16);
subplot(1,2,1),%#A��
y=1:6;%layers
% yyaxis left 
plot(x2(1,:),y,'m-o','LineWidth',2);%��ɫm��˹�п�˹����
hold on
plot(x2(2,:),y,'b-o','LineWidth',2);%��ɫm��ŷ������
hold on
plot(x2(3,:),y,'r-o','LineWidth',2);%��ɫm��������������
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%��ɫm��������������
% xlim([min(x)-5 max(x)+0.1*max(x)]);%����x����
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'��a���鼾#A','fontsize',16);%ͼ��
% legend('˹�п�˹����','ŷ������','������������','fontsize',14);
xlabel('���٣�cm/s��','FontSize',16);
ylabel('���ˮ�H��','FontSize',16);
set(gca,'fontsize',16);

subplot(1,2,2),%#b��
y=1:6;%layers
% yyaxis left 
plot(x2(4,:),y,'m-o','LineWidth',2);%��ɫm��˹�п�˹����
hold on
plot(x2(5,:),y,'b-o','LineWidth',2);%��ɫm��ŷ������
hold on
plot(x2(6,:),y,'r-o','LineWidth',2);%��ɫm��������������
hold on
plot(zeros(1,8),0:7,'k--','LineWidth',1.5);%��ɫm��������������
% xlim([min(x)-5 max(x)+0.1*max(x)]);%����x����
ylim([0.5,6.5]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlim([-10,20]);xticks(-10:10:20);xticklabels({'-10','0','10','20'});
text(5,6.2,'��b���鼾#B','fontsize',16);%ͼ��
legend('˹�п�˹����','ŷ������','������������','fontsize',14);
xlabel('���٣�cm/s��','FontSize',16);
ylabel('���ˮ�H��','FontSize',16);
set(gca,'fontsize',16);