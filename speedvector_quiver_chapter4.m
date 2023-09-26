%% 第四章——枯季整点流速矢量图

clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年1月枯季观测数据';
addpath(filepath1);
%加载实测值，共18列数据，1-6列u，7-12列v
dry_spdA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A-ADCP流速','G2:X27');%A点
dry_spdB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B-ADCP流速','G4:X29');%B点
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A整点时刻
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
dryA_u(:,7-i)=dry_spdA(:,i)/100;%分出流速u,换算单位为m/s，由表层至底层逆序写入，方便绘制quiver
dryA_v(:,7-i)=dry_spdA(:,i+6)/100;%分出流速v
dryA_ang(:,i)=dry_spdA(:,i+2*6);%分出流向0-360
dryB_u(:,7-i)=dry_spdB(:,i)/100;%分出流速u
dryB_v(:,7-i)=dry_spdB(:,i+6)/100;%分出流速v
dryB_ang(:,i)=dry_spdB(:,i+2*6);%分出流向0-360
end



figure,
% % #A
% subplot(2,1,1),
x=1:26;y=1:1.5:9;
u=dryA_u';v=dryA_v';
quiver(x,y,u,v,'k-','LineWidth',1);
hold on 
for i=1:6
y(i,1:26)=1+(i-1)*1.5;
plot(x,y(i,:),'k-','LineWidth',0.3)
hold on 
end
xlim([0 27]);
ylim([-0.2 10]);
yticks(1:1.5:9);
yticklabels({'底层','0.8H','0.6H','0.4H','0.2H','表层'});
xlabel('相对时间（2021-01-14 15:00）（h）');
ylabel('相对水深（H）');
text(1,9.5,'（a）#A','FontSize',12);
% 创建 text
text('FontSize',12,'String','1 m/s','Position',[24 9.7]);
% 创建 arrow
annotation('arrow',[0.82 0.90],[0.87 0.87]);
set(gca,'XMinorTick','on','fontsize',12);

% % #B
% subplot(2,1,2),
figure,
x=1:26;y=1:1.5:9;
u=dryB_u';v=dryB_v';
quiver(x,y,u,v,'k-','LineWidth',1);
hold on 
for i=1:6
y(i,1:26)=1+(i-1)*1.5;
plot(x,y(i,:),'k-','LineWidth',0.3)
hold on 
end
xlim([0 27]);
ylim([-0.2 10]);
yticks(1:1.5:9);
yticklabels({'底层','0.8H','0.6H','0.4H','0.2H','表层'});
xlabel('相对时间（2021-01-14 15:00）（h）');
ylabel('相对水深（H）');
text(1,9.5,'（b）#B','FontSize',12);
hold off
% 创建 text
text('FontSize',12,'String','1 m/s','Position',[24 9.7]);
% 创建 arrow
annotation('arrow',[0.82 0.90],[0.865 0.865]);
set(gca,'XMinorTick','on','fontsize',12);

%% 第四章——洪季整点流速矢量图

clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年7月洪季观测数据';
addpath(filepath1);
%加载实测值，共18列数据，1-6列u，7-12列v
wet_spdA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A-ADCP流速','G2:X27');%A点
wet_spdB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B-ADCP流速','G3:X28');%B点
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A整点时刻
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
wetA_u(:,7-i)=wet_spdA(:,i)/100;%分出流速u,换算单位为m/s，由表层至底层逆序写入，方便绘制quiver
wetA_v(:,7-i)=wet_spdA(:,i+6)/100;%分出流速v
wetA_ang(:,i)=wet_spdA(:,i+2*6);%分出流向0-360
wetB_u(:,7-i)=wet_spdB(:,i)/100;%分出流速u
wetB_v(:,7-i)=wet_spdB(:,i+6)/100;%分出流速v
wetB_ang(:,i)=wet_spdB(:,i+2*6);%分出流向0-360
end


figure,
% % #A
% subplot(2,1,1),
x=1:26;y=1:1.5:9;
u=wetA_u';v=wetA_v';
quiver(x,y,u,v,'k-','LineWidth',1);
hold on 
for i=1:6
y(i,1:26)=1+(i-1)*1.5;
plot(x,y(i,:),'k-','LineWidth',0.3)
hold on 
end
xlim([0 27]);
ylim([-0.2 10]);
yticks(1:1.5:9);
yticklabels({'底层','0.8H','0.6H','0.4H','0.2H','表层'});
xlabel('相对时间（2021-08-22 13:00）（h）');
ylabel('相对水深（H）');
text(1,9.5,'（a）#A','FontSize',12);
% 创建 text
text('FontSize',12,'String','1 m/s','Position',[24 9.7]);
% 创建 arrow
annotation('arrow',[0.82 0.90],[0.87 0.87]);
set(gca,'XMinorTick','on','fontsize',12);

% % #B
% subplot(2,1,2),
figure,
x=1:26;y=1:1.5:9;
u=wetB_u';v=wetB_v';
quiver(x,y,u,v,'k-','LineWidth',1);
hold on 
for i=1:6
y(i,1:26)=1+(i-1)*1.5;
plot(x,y(i,:),'k-','LineWidth',0.3)
hold on 
end
xlim([0 27]);
ylim([-0.2 10]);
yticks(1:1.5:9);
yticklabels({'底层','0.8H','0.6H','0.4H','0.2H','表层'});
xlabel('相对时间（2021-08-22 13:00）（h）');
ylabel('相对水深（H）');
text(1,9.5,'（b）#B','FontSize',12);
hold off
% 创建 text
text('FontSize',12,'String','1 m/s','Position',[24 9.7]);
% 创建 arrow
annotation('arrow',[0.82 0.90],[0.87 0.87]);
set(gca,'XMinorTick','on','fontsize',12);

%% 第四章——洪季整点潮流椭圆
% 站点	经度（°E）	纬度（°N）	平均水深（m）	区域位置
% #A	113.7083	22.4161	6.30	西滩
% #B	113.7454	22.4789	7.20	西槽

clear;
addpath('D:\m_map');

% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年7月洪季观测数据';
addpath(filepath1);
%加载实测值，共18列数据，1-6列u，7-12列v
wet_spdA=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A-ADCP流速','G2:X27');%A点
wet_spdB=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B-ADCP流速','G3:X28');%B点
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A整点时刻
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
wetA_u(:,i)=wet_spdA(:,i)/100;%分出流速u,换算单位为m/s，由表层至底层
wetA_v(:,i)=wet_spdA(:,i+6)/100;%分出流速v
wetA_ang(:,i)=wet_spdA(:,i+2*6);%分出流向0-360
wetB_u(:,i)=wet_spdB(:,i)/100;%分出流速u
wetB_v(:,i)=wet_spdB(:,i+6)/100;%分出流速v
wetB_ang(:,i)=wet_spdB(:,i+2*6);%分出流向0-360
end
% layersA={'(a1)#A 表层','(b1)#A 0.2H','(c1)#A 0.4H','(d1)#A 0.6H','(e1)#A 0.8H','(f1)#A 底层'};
% layersB={'(a2)#B 表层','(b2)#B 0.2H','(c2)#B 0.4H','(d2)#B 0.6H','(e2)#B 0.8H','(f2)#B 底层'};
layersA={'(a1)#A表层','(b1)#A中层','(c1)#A底层'};
layersB={'(a2)#B表层','(b2)#B中层','(c2)#B底层'};

%绘制伶仃洋底图
xmin=113.4;xmax=114.1;ymin=21.9;ymax=22.9;%地图坐标范围
% %%
figure,
sgtitle('枯季整点潮流椭圆','Fontsize',12);
% k=1:6; % 6层
k=[1 4 6];% 3层:表、中、底
for i=1:length(k)
%     figure(i+4),
    hold on
%     subplot(3,2,i),
%     subplot(2,6,2*i-1:2*i),
subplot(2,3,i),
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[.8 .8 .8],'edgecolor','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',12);
hold on
m_line(114,22.7,'marker','*','markersize',6,'color','r');
m_text(113.95,22.67,'深圳','fontsize',12);
% m_line([114.2 115],[22.43 22.43],'color','k','linewidth',1);
m_line(114.05,22.43,'marker','*','markersize',6,'color','r');
m_text(113.98,22.4,'香港','fontsize',12);
m_line(113.5,22.1,'marker','*','markersize',6,'color','r');
% m_line([113.5 113.5],[22.1 21.7],'color','k','linewidth',1);
m_text(113.51,22.09,'澳门','fontsize',12) ;
% m_text(113,20.10,'中国南海','fontsize',20);
m_text(113.42,22.85,layersA(i),'Fontsize',12,'BackgroundColor','w');%标注图号，水层
% m_line(113.7083,22.4161,'marker','*','markersize',6,'color','r');%#A
m_text(113.74,22.4161,'#A','fontsize',12) ;
% m_line(113.7454,22.4789,'marker','*','markersize',6,'color','r');%#B
% m_text(113.75,22.4789,'#B','fontsize',12) ;
end
 hold on
for i=1:length(k)
%     figure(i+4),
    hold on
%   subplot(2,6,2*i-1+6:2*i+6),
subplot(2,3,i+3),
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[.8 .8 .8],'edgecolor','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',12);
hold on
m_line(114,22.7,'marker','*','markersize',6,'color','r');
m_text(113.95,22.67,'深圳','fontsize',12);
% m_line([114.2 115],[22.43 22.43],'color','k','linewidth',1);
m_line(114.05,22.43,'marker','*','markersize',6,'color','r');
m_text(113.98,22.4,'香港','fontsize',12);
m_line(113.5,22.1,'marker','*','markersize',6,'color','r');
% m_line([113.5 113.5],[22.1 21.7],'color','k','linewidth',1);
m_text(113.51,22.09,'澳门','fontsize',12) ;
% m_text(113,20.10,'中国南海','fontsize',20);
m_text(113.42,22.85,layersB(i),'Fontsize',12,'BackgroundColor','w');%标注图号，水层
% m_line(113.7083,22.4161,'marker','*','markersize',6,'color','r');%#A
% m_text(113.71,22.4161,'#A','fontsize',12) ;
% m_line(113.7454,22.4789,'marker','*','markersize',6,'color','r');%#B
m_text(113.78,22.4789,'#B','fontsize',12) ;
end
%绘制潮流椭圆
hold on
scale=0.2;%缩放流速尺度
% for i=1:6
for i=1:length(k)
    for j=1:26
    hold on    
%     figure(i+4),
    % subplot(3,2,i),
%     subplot(1,6,2*i-1:2*i),
subplot(2,3,i),    
m_quiver(113.7083,22.4161,wetA_u(j,i),wetA_v(j,i),scale,'color','b');%#A
    end
m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
m_text(113.47,22.03,'1 m/s','fontsize',12);
set(gcf,'GraphicsSmoothing','on');        
end
hold on
for i=1:length(k)
    for j=1:26
    hold on  
%     subplot(2,6,2*i-1+6:2*i+6),
subplot(2,3,i+3),
m_quiver(113.7454,22.4789,wetB_u(j,i),wetB_v(j,i),scale,'color','b');%#B
    end
m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
m_text(113.47,22.03,'1 m/s','fontsize',12);
set(gcf,'GraphicsSmoothing','on');    
end
% hold on  
% % for i=1:length(k)
% for i=1:6
% % figure(i+4),
% subplot(3,2,i),
% %     subplot(2,6,2*i-1:2*i),
% m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
% m_text(113.46,22.03,'1 m/s','fontsize',12);
% set(gcf,'GraphicsSmoothing','on');     
% end
% hold on
% for i=1:length(k)
% hold on
%     subplot(2,6,2*i-1+6:2*i+6),
% m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
% m_text(113.46,22.03,'1 m/s','fontsize',12);
% set(gcf,'GraphicsSmoothing','on');
% end
 hold off  
%% 第四章——枯季整点潮流椭圆
% 站点	经度（°E）	纬度（°N）	平均水深（m）	区域位置
% #A	113.7083	22.4161	6.30	西滩
% #B	113.7454	22.4789	7.20	西槽

clear;
addpath('D:\m_map');

% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年1月枯季观测数据';
addpath(filepath1);
%加载实测值，共18列数据，1-6列u，7-12列v
dry_spdA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A-ADCP流速','G2:X27');%A点
dry_spdB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B-ADCP流速','G4:X29');%B点
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A整点时刻
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
dryA_u(:,i)=dry_spdA(:,i)/100;%分出流速u,换算单位为m/s，由表层至底层顺序写入
dryA_v(:,i)=dry_spdA(:,i+6)/100;%分出流速v
dryA_ang(:,i)=dry_spdA(:,i+2*6);%分出流向0-360
dryB_u(:,i)=dry_spdB(:,i)/100;%分出流速u
dryB_v(:,i)=dry_spdB(:,i+6)/100;%分出流速v
dryB_ang(:,i)=dry_spdB(:,i+2*6);%分出流向0-360
end

% layersA={'(a1)#A 表层','(b1)#A 0.2H','(c1)#A 0.4H','(d1)#A 0.6H','(e1)#A 0.8H','(f1)#A 底层'};
% layersB={'(a2)#B 表层','(b2)#B 0.2H','(c2)#B 0.4H','(d2)#B 0.6H','(e2)#B 0.8H','(f2)#B 底层'};
layersA={'(a1)#A表层','(b1)#A中层','(c1)#A底层'};
layersB={'(a2)#B表层','(b2)#B中层','(c2)#B底层'};

%绘制伶仃洋底图
xmin=113.4;xmax=114.1;ymin=21.9;ymax=22.9;%地图坐标范围
% %%
figure,
sgtitle('洪季整点潮流椭圆','Fontsize',12);
% k=1:6; % 6层
k=[1 4 6];% 3层:表、中、底
for i=1:length(k)
%     figure(i+4),
    hold on
%     subplot(3,2,i),
%     subplot(2,6,2*i-1:2*i),
subplot(2,3,i),
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[.8 .8 .8],'edgecolor','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',12);
hold on
m_line(114,22.7,'marker','*','markersize',6,'color','r');
m_text(113.95,22.67,'深圳','fontsize',12);
% m_line([114.2 115],[22.43 22.43],'color','k','linewidth',1);
m_line(114.05,22.43,'marker','*','markersize',6,'color','r');
m_text(113.98,22.4,'香港','fontsize',12);
m_line(113.5,22.1,'marker','*','markersize',6,'color','r');
% m_line([113.5 113.5],[22.1 21.7],'color','k','linewidth',1);
m_text(113.51,22.09,'澳门','fontsize',12) ;
% m_text(113,20.10,'中国南海','fontsize',20);
m_text(113.42,22.85,layersA(i),'Fontsize',12,'BackgroundColor','w');%标注图号，水层
% m_line(113.7083,22.4161,'marker','*','markersize',6,'color','r');%#A
m_text(113.74,22.4161,'#A','fontsize',12) ;
end
 hold on
for i=1:length(k)
%     figure(i+4),
    hold on
%   subplot(2,6,2*i-1+6:2*i+6),
subplot(2,3,i+3),
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[.8 .8 .8],'edgecolor','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',12);
hold on
m_line(114,22.7,'marker','*','markersize',6,'color','r');
m_text(113.95,22.67,'深圳','fontsize',12);
% m_line([114.2 115],[22.43 22.43],'color','k','linewidth',1);
m_line(114.05,22.43,'marker','*','markersize',6,'color','r');
m_text(113.98,22.4,'香港','fontsize',12);
m_line(113.5,22.1,'marker','*','markersize',6,'color','r');
% m_line([113.5 113.5],[22.1 21.7],'color','k','linewidth',1);
m_text(113.51,22.09,'澳门','fontsize',12) ;
% m_text(113,20.10,'中国南海','fontsize',20);
m_text(113.42,22.85,layersB(i),'Fontsize',12,'BackgroundColor','w');%标注图号，水层
m_text(113.78,22.4789,'#B','fontsize',12) ;
end
%绘制潮流椭圆
hold on
scale=0.2;%缩放流速尺度
% for i=1:6
for i=1:length(k)
    for j=1:26
    hold on    
subplot(2,3,i),    
m_quiver(113.7083,22.4161,dryA_u(j,i),dryA_v(j,i),scale,'color','b');%#A
    end
m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
m_text(113.47,22.03,'1 m/s','fontsize',12);
set(gcf,'GraphicsSmoothing','on');        
end
hold on
for i=1:length(k)
    for j=1:26
    hold on  
subplot(2,3,i+3),
m_quiver(113.7454,22.4789,dryB_u(j,i),dryB_v(j,i),scale,'color','b');%#B
    end
m_quiver(113.45,22,1,0,scale,'color','b','linewidth',1);%标尺
m_text(113.47,22.03,'1 m/s','fontsize',12);
set(gcf,'GraphicsSmoothing','on');    
end
hold off  