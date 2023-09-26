%% 第四章——枯季 悬沙浓度与流速关系讨论

clc;clear;
addpath('D:\Delft3D Model test');
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年1月枯季观测数据';
addpath(filepath1);
addpath('D:\JJCFileGroup\01学位论文\程序脚本code\悬沙剖面-黄杰');%添加 othercolor.m

%枯季大潮，2021-01-14 15:00:00-2021-01-15 16:00:00，连续26h
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A整点时刻
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B整点时刻

%悬沙
dry_sedA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','D40:I65');%A点
dry_sedB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','D42:I67');%B点
%换算单位，1kg/m3=1000mg/L，放大1000倍
dry_sedA=dry_sedA*1000;
dry_sedB=dry_sedB*1000;

%流速
%加载实测值，12列数据：表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，每层按流向、流速间隔分列，单位m/s，度
dry_spdA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','D5:O30');%A点
dry_spdB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','D7:O32');%B点
%分出流速、流向
for i=1:6
dryA_V(:,i)=dry_spdA(:,2*i-1);%分出流速标量V,换算单位为m/s，由表层至底层顺序写入
dryA_ang(:,i)=dry_spdA(:,2*i);%分出流向0-360°
dryB_V(:,i)=dry_spdB(:,2*i-1);%分出流速标量V,
dryB_ang(:,i)=dry_spdB(:,2*i);%分出流向0-360°
end

%水深
depdata1(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','C7:C32');%B点

%垂向平均流速
dry_avgspdA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','P5:P30');%A点
dry_avgspdB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','P7:P32');%B点
%垂向平均悬沙
dry_avgsedA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','J40:J65');%A点
dry_avgsedB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','J42:J67');%B点
%换算单位，1kg/m3=1000mg/L，放大1000倍
dry_avgsedA=dry_avgsedA*1000;
dry_avgsedB=dry_avgsedB*1000;
%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% figure,
% sgtitle('枯季近底层悬沙浓度、流速随时间变化图','FontSize',12);
% % % #A
% subplot(2,1,1),
% yyaxis left
% plot(dry_sedA(:,6),'k-o','LineWidth',1);
% xlim([0,27]);
% ylim([0,80]);yticks(0:20:80);yticklabels(0:20:80);
% % ylim([0,1.2]);yticks(0:0.2:1.2);yticklabels(0:0.2:1.2);
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% ylabel('悬沙浓度（mg/L）','FontSize',12);
% set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
% text(0,75,'（a）#A','FontSize',12);
% hold on
% yyaxis right
% plot(dryA_V(:,6),'r-*','LineWidth',1);
% ylim([0.1,0.7]);yticks(0.1:0.1:.7);yticklabels(0.1:0.1:.7);
% ylabel('流速（m/s）','FontSize',12);
% set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% % % #B
% subplot(2,1,2),
% yyaxis left
% plot(dry_sedB(:,6),'k-o','LineWidth',1);
% xlim([0,27]);
% ylim([0,40]);yticks(0:10:40);yticklabels(0:10:40);
% % ylim([0,1.2]);yticks(0:0.2:1.2);yticklabels(0:0.2:1.2);
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% ylabel('悬沙浓度（mg/L）','FontSize',12);
% set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
% text(0,35,'（b）#B','FontSize',12);
% hold on
% yyaxis right
% plot(dryB_V(:,6),'r-*','LineWidth',1);
% ylim([0,.6]);yticks(0:0.1:.6);yticklabels(0:0.1:.6);
% ylabel('流速（m/s）','FontSize',12);
% set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure,
sgtitle('枯季垂向平均悬沙浓度、流速随时间变化图','FontSize',12);
% % #A
subplot(2,1,1),
plot(dry_sedA(:,1),'g--','LineWidth',1);
hold on
plot(dry_sedA(:,4),'m--','LineWidth',1);
hold on
plot(dry_sedA(:,6),'b--','LineWidth',1);
hold on
% lgd1=legend('表层','0.6H','底层','FontSize',12);
hold on
plot(dry_avgsedA,'k-o','LineWidth',2);
xlim([0,27]);
ylim([10,70]);yticks(10:10:70);yticklabels(10:10:70);
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,65,'（a）#A','FontSize',12);
hold on
yyaxis right
plot(dry_avgspdA,'r-*','LineWidth',2);
ylim([0.1,1]);yticks(0.2:0.2:1);yticklabels(0.2:0.2:1);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
% legend('表层','0.6H','底层','垂向平均悬沙浓度','垂向平均流速','FontSize',12,'NumColumns',2);
hold off

% % #B
subplot(2,1,2),
yyaxis left
plot(dry_sedB(:,1),'g--','LineWidth',1);
hold on
plot(dry_sedB(:,4),'m--','LineWidth',1);
hold on
plot(dry_sedB(:,6),'b--','LineWidth',1);
hold on
% lgd1=legend('表层','0.6H','底层','FontSize',12);
hold on
plot(dry_avgsedB,'k-o','LineWidth',2);
xlim([0,27]);
ylim([0,40]);yticks(0:10:40);yticklabels(0:10:40);
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,35,'（b）#B','FontSize',12);
hold on
yyaxis right
plot(dry_avgspdB,'r-*','LineWidth',2);
ylim([0,0.8]);yticks(0:0.2:.8);yticklabels(0:0.2:.8);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
legend('表层','0.6H','底层','垂向平均悬沙浓度','垂向平均流速','FontSize',12,'NumColumns',2);
hold off

%% 第四章——洪季 悬沙浓度与流速关系讨论
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

% wet_sedB=fillmissing(wet_sedB,'linear');%填补缺失值

%换算单位，1kg/m3=1000mg/L，放大1000倍
wet_sedA=wet_sedA*1000;
wet_sedB=wet_sedB*1000;

%加载实测值，12列数据：表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，每层按流向、流速间隔分列，单位m/s，度
%枯季大潮，2021-08-22 13:00:00-2021-08-23 14:00:00，连续26h	
%加载实测值，共12列数据，1-6列u，7-12列v
wet_spdA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','D5:O30');%A点
wet_spdB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','D6:O31');%B点
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A整点时刻
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
wetA_V(:,i)=wet_spdA(:,2*i-1);%分出流速标量V,换算单位为m/s，由表层至底层顺序写入
wetA_ang(:,i)=wet_spdA(:,2*i);%分出流向0-360°
wetB_V(:,i)=wet_spdB(:,2*i-1);%分出流速标量V,
wetB_ang(:,i)=wet_spdB(:,2*i);%分出流向0-360°
end

%水深数据
depdata1(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','C6:C31');%B点

%垂向平均流速
wet_avgspdA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','P5:P30');%A点
wet_avgspdB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','P6:P31');%B点
%垂向平均悬沙
wet_avgsedA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','J40:J65');%A点
wet_avgsedB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','J41:J66');%B点
%换算单位，1kg/m3=1000mg/L，放大1000倍
wet_avgsedA=wet_avgsedA*1000;
wet_avgsedB=wet_avgsedB*1000;
%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure,
sgtitle('洪季近底层悬沙浓度、流速随时间变化图','FontSize',12);
% % #A
subplot(2,1,1),
yyaxis left
plot(wet_sedA(:,6),'k-o','LineWidth',1);
xlim([0,27]);
ylim([10,125]);yticks(20:20:120);yticklabels(20:20:120);
% ylim([0,1.2]);yticks(0:0.2:1.2);yticklabels(0:0.2:1.2);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,115,'（a）#A','FontSize',12);
hold on

% h6=log(depdata1(:,2));
% u6=wetA_V(:,6);
% b=(u6./h6).^1.5;

yyaxis right
plot(wetA_V(:,6),'r-*','LineWidth',1);
% plot(b,'r-*','LineWidth',1);
ylim([0,.8]);
yticks(0:0.2:.8);yticklabels(0:0.2:.8);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);

% % #B
subplot(2,1,2),
yyaxis left
plot(wet_sedB(:,6),'k-o','LineWidth',1);
xlim([0,27]);
ylim([5,30]);yticks(10:10:40);yticklabels(10:10:40);
% ylim([0,1.2]);yticks(0:0.2:1.2);yticklabels(0:0.2:1.2);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,25,'（b）#B','FontSize',12);
hold on

% h6=log(depdata1(:,2));
% u6=wetB_V(:,6);
% b=(u6./h6).^1.5;

yyaxis right
plot(wetB_V(:,6),'r-*','LineWidth',1);
% plot(b,'r-*','LineWidth',1);
ylim([0,.8]);
yticks(0:0.2:.2);yticklabels(0:0.2:.2);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
%% 

figure,
sgtitle('洪季垂向平均悬沙浓度、流速随时间变化图','FontSize',12);
% % #A
subplot(2,1,1),
yyaxis left
plot(wet_sedA(:,1),'g--','LineWidth',1);
hold on
plot(wet_sedA(:,4),'m--','LineWidth',1);
hold on
plot(wet_sedA(:,6),'b--','LineWidth',1);
hold on
% lgd1=legend('表层','0.6H','底层','FontSize',12);
hold on
plot(wet_avgsedA,'k-o','LineWidth',2);
xlim([0,27]);
ylim([0,125]);yticks(0:20:125);yticklabels(0:20:125);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,120,'（a）#A','FontSize',12);
hold on
yyaxis right
plot(wet_avgspdA,'r-*','LineWidth',2);
ylim([0,1]);yticks(0:0.2:1);yticklabels(0:0.2:1);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
% lgd2=legend('垂向平均悬沙浓度','垂向平均流速','FontSize',12);
% legend('表层','0.6H','底层','垂向平均悬沙浓度','垂向平均流速','FontSize',12,'NumColumns',2);
hold off

% % #B
subplot(2,1,2),
yyaxis left
plot(wet_sedB(:,1),'g--','LineWidth',1);
hold on
plot(wet_sedB(:,4),'m--','LineWidth',1);
hold on
plot(wet_sedB(:,6),'b--','LineWidth',1);
hold on
% lgd1=legend('表层','0.6H','底层','FontSize',12);
hold on
plot(wet_avgsedB,'k-o','LineWidth',2);
xlim([0,27]);
ylim([0,68]);yticks(0:10:70);yticklabels(0:10:70);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel('悬沙浓度（mg/L）','FontSize',12);
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
text(0,65,'（b）#B','FontSize',12);
hold on
yyaxis right
plot(wet_avgspdB,'r-*','LineWidth',2);
ylim([0,1.1]);yticks(0:0.2:1);yticklabels(0:0.2:1);
ylabel('流速（m/s）','FontSize',12);
set(gca,'YColor',[1 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
legend('表层','0.6H','底层','垂向平均悬沙浓度','垂向平均流速','FontSize',12,'NumColumns',2);
hold off
%% 潮平均悬沙与流速线性关系
 
figure,
sgtitle('洪、枯季各测点潮平均悬沙浓度与流速关系','FontSize',12);


plot(dry_avgsedA,dry_,'k-o','LineWidth',1);
hold on
plot(x2,y,'k-*','LineWidth',1);
hold on
plot(x3,y,'r--o','LineWidth',1);
hold on
plot(x4,y,'r--*','LineWidth',1);

p=polyfit(log(x1),y,1);%
f1=polyval(p,log(x1));
[r2,rmse] = rsquare(y,f1);
hold on
plot(x1,f1,'k-','LineWidth',0.5);
text(x1(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
    ['R^2 = ' num2str(r2,4)]},'fontsize',12);

p=polyfit(log(x2),y,1);%
f1=polyval(p,log(x2));
[r2,rmse] = rsquare(y,f1);
hold on
plot(x2,f1,'k-','LineWidth',0.5);
text(x2(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
    ['R^2 = ' num2str(r2,4)]},'fontsize',12);

p=polyfit(log(x3),y,1);%
f1=polyval(p,log(x3));
[r2,rmse] = rsquare(y,f1);
hold on
plot(x3,f1,'k-','LineWidth',0.5);
text(x3(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
    ['R^2 = ' num2str(r2,4)]},'fontsize',12);

p=polyfit(log(x4),y,1);%
f1=polyval(p,log(x4));
[r2,rmse] = rsquare(y,f1);
hold on
plot(x4,f1,'k-','LineWidth',0.5);
text(x4(6),y(6),{['{\ity}' '=' num2str(p(1),4) 'ln' '{\itx}' '+' num2str(p(2),4)];...
    ['R^2 = ' num2str(r2,4)]},'fontsize',12);

ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlabel('悬沙浓度（mg/L）','FontSize',12);
ylabel('相对水深（H）','FontSize',12);
% text(max(x1)-0.1*max(x1),6,['（' num2str(i) '）'],'fontsize',12);
% legend('dry_#A','dry_#B','wet_#A','wet_#B');
% legend('枯季#A','枯季#B','洪季#A','洪季#B');
legend('枯季#A','枯季#B','洪季#A','洪季#B','对数拟合1','对数拟合2','对数拟合3','对数拟合4');
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);
hold off
