%% �����¡����ݼ���ɳŨ����ʱ��������仯ͼ

clc;clear;
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

%ˮ������
depdata1(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','C7:C32');%B��

%% 

% % #A
figure,
sgtitle('�ݼ�#A����ɳŨ����ʱ��������仯ͼ','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=dry_sedA(i,j);%hourly observation data���ɱ�����ײ�����д��
end
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %��ת����ϵ������ y ��ֵ�����ϵ��µ�˳�������ӡ�
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% xlabel('��ɳŨ�ȣ�mg/L��','FontSize',12);
% ylabel('��״���Ը߶ȣ�H��','FontSize',12);
text(max(x)-0.1*max(x),6,['��' num2str(i) '��'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis=axes('visible','off');
h = text(-0.1,0.5,'���ˮ�H��');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'��ɳŨ�ȣ�mg/L��');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');

% % #B
figure,
sgtitle('�ݼ�#B����ɳŨ����ʱ��������仯ͼ','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=dry_sedB(i,j);%hourly observation data���ɱ�����ײ�����д��
end    
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %��ת����ϵ������ y ��ֵ�����ϵ��µ�˳�������ӡ�
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
text(max(x)-0.1*max(x),6,['��' num2str(i) '��'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis = axes('visible','off');
h = text(-0.1,0.5,'���ˮ�H��');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'��ɳŨ�ȣ�mg/L��');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');




%% �����¡����鼾��ɳŨ����ʱ��������仯ͼ

clc;clear;
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

%ˮ������
depdata1(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#B����','C6:C31');%B��

%% 

% % #A
figure,
sgtitle('�鼾#A����ɳŨ����ʱ��������仯ͼ','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=wet_sedA(i,j);%hourly observation data���ɱ�����ײ�����д��
end
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %��ת����ϵ������ y ��ֵ�����ϵ��µ�˳�������ӡ�
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% xlabel('��ɳŨ�ȣ�mg/L��','FontSize',12);
% ylabel('��״���Ը߶ȣ�H��','FontSize',12);
text(max(x)-0.1*max(x),6,['��' num2str(i) '��'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis=axes('visible','off');
h = text(-0.1,0.5,'���ˮ�H��');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'��ɳŨ�ȣ�mg/L��');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');

% % #B
figure,
sgtitle('�鼾#B����ɳŨ����ʱ��������仯ͼ','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=wet_sedB(i,j);%hourly observation data���ɱ�����ײ�����д��
end    
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %��ת����ϵ������ y ��ֵ�����ϵ��µ�˳�������ӡ�
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
text(max(x)-0.1*max(x),6,['��' num2str(i) '��'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis = axes('visible','off');
h = text(-0.1,0.5,'���ˮ�H��');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'��ɳŨ�ȣ�mg/L��');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');



