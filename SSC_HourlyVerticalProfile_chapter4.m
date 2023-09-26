%% 第四章——枯季悬沙浓度逐时垂向剖面变化图

clc;clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年1月枯季观测数据';
addpath(filepath1);
addpath('D:\JJCFileGroup\01学位论文\程序脚本code\悬沙剖面-黄杰');%添加 othercolor.m

%加载实测值，表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，单位kg/m3
%枯季大潮，2021-01-14 15:00:00-2021-01-15 16:00:00，连续26h	
dry_sedA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','D40:I65');%A点
dry_sedB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','D42:I67');%B点
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A整点时刻
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B整点时刻

%换算单位，1kg/m3=1000mg/L，放大1000倍
dry_sedA=dry_sedA*1000;
dry_sedB=dry_sedB*1000;

%水深数据
depdata1(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','C7:C32');%B点

%% 

% % #A
figure,
sgtitle('枯季#A点悬沙浓度逐时垂向剖面变化图','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=dry_sedA(i,j);%hourly observation data，由表层至底层逆序写入
end
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %反转坐标系，这样 y 的值按从上到下的顺序逐渐增加。
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% xlabel('悬沙浓度（mg/L）','FontSize',12);
% ylabel('距底床相对高度（H）','FontSize',12);
text(max(x)-0.1*max(x),6,['（' num2str(i) '）'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis=axes('visible','off');
h = text(-0.1,0.5,'相对水深（H）');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'悬沙浓度（mg/L）');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');

% % #B
figure,
sgtitle('枯季#B点悬沙浓度逐时垂向剖面变化图','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=dry_sedB(i,j);%hourly observation data，由表层至底层逆序写入
end    
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %反转坐标系，这样 y 的值按从上到下的顺序逐渐增加。
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
text(max(x)-0.1*max(x),6,['（' num2str(i) '）'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis = axes('visible','off');
h = text(-0.1,0.5,'相对水深（H）');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'悬沙浓度（mg/L）');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');




%% 第四章——洪季悬沙浓度逐时垂向剖面变化图

clc;clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年7月洪季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年7月洪季观测数据';
addpath(filepath1);
addpath('D:\JJCFileGroup\01学位论文\程序脚本code\悬沙剖面-黄杰');%添加 othercolor.m

%加载实测值，表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，单位kg/m3
%洪季大潮，2021-08-22 13:00:00-2021-08-23 14:00:00，连续26h	
wet_sedA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','D40:I65');%A点
wet_sedB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','D41:I66');%B点
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A整点时刻
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B整点时刻

wet_sedB=fillmissing(wet_sedB,'linear');%填补缺失值

%换算单位，1kg/m3=1000mg/L，放大1000倍
wet_sedA=wet_sedA*1000;
wet_sedB=wet_sedB*1000;

%水深数据
depdata1(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','C6:C31');%B点

%% 

% % #A
figure,
sgtitle('洪季#A点悬沙浓度逐时垂向剖面变化图','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=wet_sedA(i,j);%hourly observation data，由表层至底层逆序写入
end
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %反转坐标系，这样 y 的值按从上到下的顺序逐渐增加。
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% xlabel('悬沙浓度（mg/L）','FontSize',12);
% ylabel('距底床相对高度（H）','FontSize',12);
text(max(x)-0.1*max(x),6,['（' num2str(i) '）'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis=axes('visible','off');
h = text(-0.1,0.5,'相对水深（H）');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'悬沙浓度（mg/L）');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');

% % #B
figure,
sgtitle('洪季#B点悬沙浓度逐时垂向剖面变化图','FontSize',12);
for i=1:26 %hours of the observation
for j=1:6
x(7-j)=wet_sedB(i,j);%hourly observation data，由表层至底层逆序写入
end    
subplot(5,6,i),
y=1:6;%layers
% yyaxis left 
plot(x,y,'k-o','LineWidth',1)
xlim([min(x)-5 max(x)+0.1*max(x)]);
% axis ij %反转坐标系，这样 y 的值按从上到下的顺序逐渐增加。
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
text(max(x)-0.1*max(x),6,['（' num2str(i) '）'],'fontsize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
end
hAxis = axes('visible','off');
h = text(-0.1,0.5,'相对水深（H）');
set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
h = text(0.5,-0.05,'悬沙浓度（mg/L）');
set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');



