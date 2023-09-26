%% �����¡����鼾���ݼ� ��ƽ�� ��ɳŨ�ȴ�������仯ͼ

clc;clear;

addpath('D:\Delft3D Model test');
% % �ݼ���ɳ
% % �칫�ҵ������ݴ洢·��
% filepath1='D:\user1\Desktop\����-�����������̿�����\������۲�2021��1�¿ݼ�\�۲�����';

% %�������洢·��
filepath1='D:\������۲�2021��1�¿ݼ��۲�����';
addpath(filepath1);
addpath('D:\JJCFileGroup\01ѧλ����\����ű�code\��ɳ����-�ƽ�');%��� othercolor.m

%����ʵ��ֵ����� 0.2H�� 0.4H�� 0.6H�� 0.8H�� �ײ㣬��λkg/m3
%�ݼ��󳱣�2021-01-14 15:00:00-2021-01-15 16:00:00������26h	
dry_sedA=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','D40:I65');%A��
dry_sedB=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','D42:I67');%B��
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A����ʱ��
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B����ʱ��

%���㵥λ��1kg/m3=1000mg/L���Ŵ�1000��
dry_sedA=dry_sedA*1000;
dry_sedB=dry_sedB*1000;

% %ˮ������
% depdata1(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','C5:C30');%A��
% depdata2(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','C7:C32');%B��

%% �鼾��ɳ
% % �칫�ҵ������ݴ洢·��
% filepath1='D:\user1\Desktop\����-�����������̿�����\������۲�2021��7�º鼾\�۲�����';

% %�������洢·��
filepath1='D:\������۲�2021��7�º鼾�۲�����';
addpath(filepath1);
addpath('D:\JJCFileGroup\01ѧλ����\����ű�code\��ɳ����-�ƽ�');%��� othercolor.m

%����ʵ��ֵ����� 0.2H�� 0.4H�� 0.6H�� 0.8H�� �ײ㣬��λkg/m3
%�鼾�󳱣�2021-08-22 13:00:00-2021-08-23 14:00:00������26h	
wet_sedA=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#A����','D40:I65');%A��
wet_sedB=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#B����','D41:I66');%B��
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A����ʱ��
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B����ʱ��

wet_sedB=fillmissing(wet_sedB,'linear');%�ȱʧֵ

%���㵥λ��1kg/m3=1000mg/L���Ŵ�1000��
wet_sedA=wet_sedA*1000;
wet_sedB=wet_sedB*1000;

%% 
figure,
sgtitle('�顢�ݼ�����㳱ƽ����ɳŨ�ȴ�������仯ͼ','FontSize',12);

for j=1:6
    x1(7-j)=mean(dry_sedA(:,j));%��ƽ�����ɱ�����ײ�����д��
    x2(7-j)=mean(dry_sedB(:,j));
    x3(7-j)=mean(wet_sedA(:,j));
    x4(7-j)=mean(wet_sedB(:,j));
end
y=1:6;%layers
% yyaxis left 
plot(x1,y,'k-o','LineWidth',1);
hold on
plot(x2,y,'k-*','LineWidth',1);
hold on
plot(x3,y,'r--o','LineWidth',1);
hold on
plot(x4,y,'r--*','LineWidth',1);



% % p=polyfit(y,log(x1),1);%
% % f1=polyval(p,y);
% % [r2,rmse] = rsquare(log(x1),f1);
% % hold on
% % plot(exp(p(1).*f1+p(2)),y,'k-','LineWidth',0.5);
% % text(x1(6),y(6),{['{\ity}_' '=' num2str(1./p(1),4) 'ln' '{\itx}' '+' num2str(-p(2),4)];...
% %     ['R^2 = ' num2str(r2,4)]},'fontsize',12);
% p=polyfit(log(x1),y,1);%
% f1=polyval(p,log(x1));
% [r2,rmse] = rsquare(y,f1);
% hold on
% plot(x1,f1,'k-','LineWidth',0.5);
% text(x1(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
%     ['R^2 = ' num2str(r2,4)]},'fontsize',12);
% 
% p=polyfit(log(x2),y,1);%
% f1=polyval(p,log(x2));
% [r2,rmse] = rsquare(y,f1);
% hold on
% plot(x2,f1,'k-','LineWidth',0.5);
% text(x2(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
%     ['R^2 = ' num2str(r2,4)]},'fontsize',12);
% 
% p=polyfit(log(x3),y,1);%
% f1=polyval(p,log(x3));
% [r2,rmse] = rsquare(y,f1);
% hold on
% plot(x3,f1,'k-','LineWidth',0.5);
% text(x3(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
%     ['R^2 = ' num2str(r2,4)]},'fontsize',12);
% 
% p=polyfit(log(x4),y,1);%
% f1=polyval(p,log(x4));
% [r2,rmse] = rsquare(y,f1);
% hold on
% plot(x4,f1,'k-','LineWidth',0.5);
% text(x4(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
%     ['R^2 = ' num2str(r2,4)]},'fontsize',12);

% xlim([min(x1)-5 max(x1)+0.1*max(x1)]);
% axis ij %��ת����ϵ������ y ��ֵ�����ϵ��µ�˳�������ӡ�
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlabel('��ɳŨ�ȣ�mg/L��','FontSize',12);
ylabel('���ˮ�H��','FontSize',12);
% text(max(x1)-0.1*max(x1),6,['��' num2str(i) '��'],'fontsize',12);
% legend('dry_#A','dry_#B','wet_#A','wet_#B');
% legend('�ݼ�#A','�ݼ�#B','�鼾#A','�鼾#B');
legend('�ݼ�#A','�ݼ�#B','�鼾#A','�鼾#B','�������1','�������2','�������3','�������4');
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);

% hAxis=axes('visible','off');
% h = text(-0.1,0.5,'���ˮ�H��');
% set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
% h = text(0.5,-0.05,'��ɳŨ�ȣ�mg/L��');
% set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');
hold off