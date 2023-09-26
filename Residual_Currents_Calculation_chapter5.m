%% 余流计算——欧拉余流（潮平均），枯季

clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\计算余流dry-20211020-1107-1123-1');

%加载潮流流速分量，x/y component分别代表纬向和经向流速，取表中底3层（k1,k4,k6），26小时，网格范围M190-510，N全部
%变量data的struct中，Val为流速值，X/Y为经纬度，Z为水深/m，Time为潮周期时间段

%k1表层流速
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-M190-510-k1.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-M190-510-k1.mat');%读取模拟流速数据
y1=a.data.Val;

%k4中层流速
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-M190-510-k4.mat');
x4=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-M190-510-k4.mat');
y4=a.data.Val;

%k6底层流速
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-M190-510-k6.mat');
x6=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-M190-510-k6.mat');
y6=a.data.Val;


i=1;
    for m=5:8:320 %510-190=320
        for n=5:8:425
            u1(i)=mean(x1(1:end,m,n),'omitnan');
            v1(i)=mean(y1(1:end,m,n),'omitnan');
            u4(i)=mean(x4(1:end,m,n),'omitnan');
            v4(i)=mean(y6(1:end,m,n),'omitnan');
            u6(i)=mean(x6(1:end,m,n),'omitnan');
            v6(i)=mean(y6(1:end,m,n),'omitnan');
            long(i)=a.data.X(1,m,n);
            lat(i)=a.data.Y(1,m,n);
            i=i+1;
        end
    end
    
%剔除口门河道内过高值，避免高值存在而缩小其他均值的quiver箭头长度
for i=1:length(u1)
    if abs(u1(1,i))>=0.15
        u1(1,i)=NaN;
    end
    if abs(v1(1,i))>=0.16
        v1(1,i)=NaN;
    end    
end  
for i=1:length(u4)
    if abs(u4(1,i))>=0.1
        u4(1,i)=NaN;
        u6(1,i)=NaN;
    end
     if abs(v4(1,i))>=0.07
        v4(1,i)=NaN;
        v6(1,i)=NaN;
    end
end  
% mean(v1,'omitnan')
% V=sqrt(u1.^2+v1.^2);    
%%
xmin=113.4;xmax=114.1;ymin=22;ymax=22.9;%地图坐标范围
%表层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u1,v1,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%流速比例标尺
% m_vec(1,long',lat',u1*2,-v1*2,0.05,'b','shaftwidth',0.5, 'headlength',2.5);%1.1表示放大倍数scale，
% m_vec(1,114-0.05,22.68,2,0,0.4,'b','shaftwidth',0.5, 'headlength',3, 'key', '0.2 m/s')
m_text(114-0.05,22.71,'0.2m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（a1）枯季表层余流','color','k','fontsize',18);
% title('枯季表层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');
%
%中层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u4,v4,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%流速比例标尺
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（b1）枯季中层余流','color','k','fontsize',18);
% title('枯季中层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%底层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u6,v6,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%流速比例标尺
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（c1）枯季底层余流','color','k','fontsize',18);
% title('枯季底层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');


%% 余流计算——欧拉余流（潮平均），洪季

clear;clc
addpath('D:\Delft3D Model test\ldb-wet-20210906-1116-1-1217-1\计算余流wet-20210906-1116-1-1217-1');

%加载潮流流速分量，x/y component分别代表纬向和经向流速，取表中底3层（k1,k4,k6），26小时，网格范围M190-510，N全部
%变量data的struct中，Val为流速值，X/Y为经纬度，Z为水深/m，Time为潮周期时间段

%k1表层流速
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-M190-510-k1.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-M190-510-k1.mat');%读取模拟流速数据
y1=a.data.Val;

%k4中层流速
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-M190-510-k4.mat');
x4=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-M190-510-k4.mat');
y4=a.data.Val;

%k6底层流速
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-M190-510-k6.mat');
x6=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-M190-510-k6.mat');
y6=a.data.Val;


i=1;
    for m=5:8:320
        for n=5:8:425
            u1(i)=mean(x1(1:end,m,n),'omitnan');
            v1(i)=mean(y1(1:end,m,n),'omitnan');
            u4(i)=mean(x4(1:end,m,n),'omitnan');
            v4(i)=mean(y6(1:end,m,n),'omitnan');
            u6(i)=mean(x6(1:end,m,n),'omitnan');
            v6(i)=mean(y6(1:end,m,n),'omitnan');
            long(i)=a.data.X(1,m,n);
            lat(i)=a.data.Y(1,m,n);
            i=i+1;
        end
    end
    
%剔除口门河道内过高值，避免高值存在而缩小其他均值的quiver箭头长度
for i=1:length(u1)
    if abs(u1(1,i))>=0.26
        u1(1,i)=NaN;
    end
    if abs(v1(1,i))>=0.22
        v1(1,i)=NaN;
    end    
end  
for i=1:length(u4)
    if abs(u4(1,i))>=0.11
        u4(1,i)=NaN;
        u6(1,i)=NaN;
    end
     if abs(v4(1,i))>=0.1
        v4(1,i)=NaN;
        v6(1,i)=NaN;
    end
end  
% mean(u1,'omitnan')
% V=sqrt(u1.^2+v1.^2);    
%%
xmin=113.4;xmax=114.1;ymin=22;ymax=22.9;%地图坐标范围
%表层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u1,v1,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%流速比例标尺
m_text(114-0.05,22.71,'0.2m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（a2）洪季表层余流','color','k','fontsize',18);
% title('洪季表层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%中层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u4,v4,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%流速比例标尺
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（b2）洪季中层余流','color','k','fontsize',18);
% title('洪季中层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%底层
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%确定投影方式和绘图界线
% m_gshhs_f('save','mycoast');%需要下载gshhs精细化底图，可Google如何将gshhs加入m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u6,v6,1,'b','MaxHeadSize',1.2);%1.1表示放大倍数scale，
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%流速比例标尺
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%指北针,0.06表示大小
xlabel('经度','fontsize',18);
ylabel('纬度','fontSize',18);
m_text(113.81,22.85,'（c2）洪季底层余流','color','k','fontsize',18);
% title('洪季底层余流','fontSize',18);
set(gcf,'GraphicsSmoothing','on');


