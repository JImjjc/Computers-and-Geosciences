%% 第四章——洪季、枯季 潮平均 悬沙浓度垂向剖面变化图

clc;clear;

addpath('D:\Delft3D Model test');
% % 枯季悬沙
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

% %水深数据
% depdata1(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','C5:C30');%A点
% depdata2(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','C7:C32');%B点

%% 洪季悬沙
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

%% 
figure,
sgtitle('洪、枯季各测点潮平均悬沙浓度垂向剖面变化图','FontSize',12);

for j=1:6
    x1(7-j)=mean(dry_sedA(:,j));%求潮平均，由表层至底层逆序写入
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
% axis ij %反转坐标系，这样 y 的值按从上到下的顺序逐渐增加。
ylim([0,7]);yticks(1:1:6);yticklabels({'1.0H','0.8H','0.6H','0.4H','0.2H','0.0H'});
xlabel('悬沙浓度（mg/L）','FontSize',12);
ylabel('相对水深（H）','FontSize',12);
% text(max(x1)-0.1*max(x1),6,['（' num2str(i) '）'],'fontsize',12);
% legend('dry_#A','dry_#B','wet_#A','wet_#B');
% legend('枯季#A','枯季#B','洪季#A','洪季#B');
legend('枯季#A','枯季#B','洪季#A','洪季#B','对数拟合1','对数拟合2','对数拟合3','对数拟合4');
set(gca,'YColor',[0 0 0],'XMinorTick','on','YMinorTick','on','fontsize',12);

% hAxis=axes('visible','off');
% h = text(-0.1,0.5,'相对水深（H）');
% set(h,'fontsize',14,'rotation',90,'HorizontalAlignment','center');
% h = text(0.5,-0.05,'悬沙浓度（mg/L）');
% set(h,'fontsize',14,'rotation',0,'HorizontalAlignment','center');
hold off