%% 断面余流计算——欧拉余流（潮平均），枯季

%加载潮流流速分量，x/y component分别代表纬向和经向流速，取表中底6层（k1-k6），26小时，
%网格范围，深槽断面M290N100-405
%变量data的struct中，Val为流速值，X/Y为经纬度，Z为水深/m，Time为潮周期时间段，4-D数据，前2维是空，后2维，第3维代表网格N，第4维代表数据
%
%% 深槽断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\计算余流dry-20211020-1107-1123-1');

a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-深槽断面M290N100-405-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-深槽断面M290N100-405-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-01-14 08h-15 09h-深槽断面M290N100-405.mat');%读取水深

DEPTH=d.data.Val(1,1,1:end);%断面水深
DEPTH=DEPTH(:);
LONG=d.data.X(1,1:end)';%经度
LONG=LONG(:);
LAT=d.data.Y(1,1:end)';%纬度
LAT=LAT(:);

i=1;
    for n=1:10:305 %405-100=206        
        for l=1:6
            u1(i,l)=mean(x1(1:end,1:end,n,l),'omitnan');
            v1(i,l)=mean(y1(1:end,1:end,n,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,1:end,n,l),'omitnan');%经度
            lat1(i,l)=mean(a.data.Y(1:end,1:end,n,l),'omitnan');%纬度
            z1(i,l)=mean(a.data.Z(1:end,1:end,n,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
lat1=lat1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
% v12=-v1;
% v12=zeros(length(u1),1);
% %剔除口门河道内过高值，避免高值存在而缩小其他均值的quiver箭头长度
% j=1;
% for i=1:length(u1)
%     if u1(i)>1e-3
% u2(j)=u1(i);
% v2(j)=v1(i);
% long2(j)=long1(i);
% lat2(j)=lat1(i);
% z2(j)=z1(i);
% j=j+1;
%     end
% end     

% 断面三维矢量图
% quiver3(long2,lat2,z2,u2,v2,v2*0,0.02,'b','LineWidth',1.5,'MaxHeadSize',0.5);   
% hold on
% plot3(LONG,LAT,-DEPTH,'k-','LineWidth',1.5);
% xlabel('经度（°E）','FontSize',18);
% ylabel('纬度（°E）','FontSize',18);
% zlabel('高程（m）','FontSize',18);
% box('on');
% set(gca,'FontSize',18,'LineWidth',1,'XTick',...
%     [113.70 113.75 113.80 113.85 113.90],'XTickLabel',...
%     {'113.70','113.75','113.80','113.85','113.90'},...
%     'YTick',...
%     [21.9 22.1 22.3 22.5 22.7],'YTickLabel',...
%     {'21.9','22.1','22.3','22.5','22.7'});

figure(1),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(1),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.68,113.9]);
ylim([-30,0.5]);
    else
     figure(1),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.68,113.9]);
ylim([-30,0.5]);
    end
end
hold on
quiver(113.73,-25,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.71,-23.6,'0.2 m/s','color','k','fontsize',18);
xlim([113.68,113.9]);
ylim([-30,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.7 113.74 113.78 113.82 113.86 113.9],'XTickLabel',...
    {'113.70','113.74','113.78','113.82','113.86','113.90'});

%% 内横断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\计算余流dry-20211020-1107-1123-1');

a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-内横断面M220-360N225-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-内横断面M220-360N225-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-01-14 08h-15 09h-内横断面M220-360N225.mat');%读取水深

DEPTH=d.data.Val(1,1:end);
DEPTH=DEPTH(:);
LONG=d.data.X(1:end)';
LONG=LONG(:);

i=1;
    for m=1:10:140 %360-220=140       
        for l=1:6
            u1(i,l)=mean(x1(1:end,m,1:end,l),'omitnan');
            v1(i,l)=mean(y1(1:end,m,1:end,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,m,1:end,l),'omitnan');%经度
            z1(i,l)=mean(a.data.Z(1:end,m,1:end,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
% v12=zeros(length(u1),1);
% %%
figure(2),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(2),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    else
     figure(2),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    end
end
hold on
quiver(113.7,-10,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>');
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.68,-9.5,'0.2 m/s','color','k','fontsize',18);
xlim([113.625,113.92]);
ylim([-13,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.65 113.70 113.75 113.80 113.85 113.90],'XTickLabel',...
    {'113.65','113.70','113.75','113.80','113.85','113.90'});

%% 外横断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\计算余流dry-20211020-1107-1123-1');

%
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-外横断面M280-385N310-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-外横断面M280-385N310-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-01-14 08h-15 09h-外横断面M280-385N310.mat');%读取水深

DEPTH=d.data.Val(1,1:end);
DEPTH=DEPTH(:);
LONG=d.data.X(1:end)';
LONG=LONG(:);

i=1;
    for m=1:10:105 %385-280=100       
        for l=1:6
            u1(i,l)=mean(x1(1:end,m,1:end,l),'omitnan');
            v1(i,l)=mean(y1(1:end,m,1:end,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,m,1:end,l),'omitnan');%经度
            z1(i,l)=mean(a.data.Z(1:end,m,1:end,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
% v12=zeros(length(u1),1);
% %%
figure(3),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(3),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    else
     figure(3),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    end
end
hold on
quiver(113.68,-20,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>');
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.68,-19,'0.2 m/s','color','k','fontsize',18);
xlim([113.60,113.845]);
ylim([-28,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.65 113.70 113.75 113.80 113.85 113.90],'XTickLabel',...
    {'113.65','113.70','113.75','113.80','113.85','113.90'});


%% 断面余流计算——欧拉余流（潮平均），洪季

%加载潮流流速分量，x/y component分别代表纬向和经向流速，取表中底6层（k1-k6），26小时，
%网格范围，深槽断面M290N100-405
%变量data的struct中，Val为流速值，X/Y为经纬度，Z为水深/m，Time为潮周期时间段，4-D数据，前2维是空，后2维，第3维代表网格N，第4维代表数据
%
%% 深槽断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-wet-20210906-1116-1-1217-1\计算余流wet-20210906-1116-1-1217-1');
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-深槽断面M290N100-405-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-深槽断面M290N100-405-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-08-22 08h-23 09h-深槽断面M290N100-405.mat');%读取水深

DEPTH=d.data.Val(1,1,1:end);
DEPTH=DEPTH(:);
LONG=d.data.X(1,1:end)';
LONG=LONG(:);

i=1;
    for n=1:10:305 %405-100=206        
        for l=1:6
            u1(i,l)=mean(x1(1:end,1:end,n,l),'omitnan');
            v1(i,l)=mean(y1(1:end,1:end,n,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,1:end,n,l),'omitnan');%经度
            z1(i,l)=mean(a.data.Z(1:end,1:end,n,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
v12=-v1;
% v12=zeros(length(u1),1);
% %%
figure(4),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(4),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.68,113.9]);
ylim([-30,0.5]);
    else
     figure(4),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.68,113.9]);
ylim([-30,0.5]);
    end
end
hold on
quiver(113.73,-25,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.71,-23.6,'0.2 m/s','color','k','fontsize',18);
xlim([113.68,113.9]);
ylim([-30,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.7 113.74 113.78 113.82 113.86 113.9],'XTickLabel',...
    {'113.70','113.74','113.78','113.82','113.86','113.90'});

%% 内横断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-wet-20210906-1116-1-1217-1\计算余流wet-20210906-1116-1-1217-1');

a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-内横断面M220-360N225-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-内横断面M220-360N225-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-08-22 08h-23 09h-内横断面M220-360N225.mat');%读取水深

DEPTH=d.data.Val(1,1:end);
DEPTH=DEPTH(:);
LONG=d.data.X(1:end)';
LONG=LONG(:);

i=1;
    for m=1:10:140 %360-220=140       
        for l=1:6
            u1(i,l)=mean(x1(1:end,m,1:end,l),'omitnan');
            v1(i,l)=mean(y1(1:end,m,1:end,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,m,1:end,l),'omitnan');%经度
            z1(i,l)=mean(a.data.Z(1:end,m,1:end,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
% v12=zeros(length(u1),1);
% %%
figure(5),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(5),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    else
     figure(5),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    end
end
hold on
quiver(113.7,-10,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>');
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.68,-9.5,'0.2 m/s','color','k','fontsize',18);
xlim([113.625,113.92]);
ylim([-13,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.65 113.70 113.75 113.80 113.85 113.90],'XTickLabel',...
    {'113.65','113.70','113.75','113.80','113.85','113.90'});

%% 外横断面k1-k6
clear;clc
addpath('D:\Delft3D Model test\ldb-wet-20210906-1116-1-1217-1\计算余流wet-20210906-1116-1-1217-1');

%
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-外横断面M280-385N310-k1-k6.mat');%读取模拟流速数据
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-外横断面M280-385N310-k1-k6.mat');%读取模拟流速数据
y1=a.data.Val;
d=load('water depth-2021-08-22 08h-23 09h-外横断面M280-385N310.mat');%读取水深

DEPTH=d.data.Val(1,1:end);
DEPTH=DEPTH(:);
LONG=d.data.X(1:end)';
LONG=LONG(:);

i=1;
    for m=1:10:105 %385-280=100       
        for l=1:6
            u1(i,l)=mean(x1(1:end,m,1:end,l),'omitnan');
            v1(i,l)=mean(y1(1:end,m,1:end,l),'omitnan');
            long1(i,l)=mean(a.data.X(1:end,m,1:end,l),'omitnan');%经度
            z1(i,l)=mean(a.data.Z(1:end,m,1:end,l),'omitnan');%高程
            i=i+1;
        end
    end
u1=u1(:);%转置成一维数组，
v1=v1(:);
long1=long1(:);
z1=z1(:);
% u12=-u1;%取负值，纠正quiver方向
% v12=zeros(length(u1),1);
% %%
figure(6),
for i=1:length(u1)
    if u1(i)>1e-3 
    figure(6),
    hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    else
     figure(6),
     hold on
quiver(long1(i),z1(i),-u1(i),v1(i),0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','<'); 
xlim([113.6,113.95]);
ylim([-13,0.5]);
    end
end
hold on
quiver(113.68,-20,-0.1,0,0.2,'b','LineWidth',1,'MaxHeadSize',1.2,...
    'MarkerFaceColor','b','MarkerEdgeColor','b','Marker','>');
hold on
plot(LONG,-DEPTH,'k-','LineWidth',1.5);
text(113.68,-19,'0.2 m/s','color','k','fontsize',18);
xlim([113.60,113.845]);
ylim([-28,0.5]);
xlabel('经度（°E）','FontSize',18);
ylabel('高程（m）','FontSize',18);
box('on');
set(gca,'FontSize',18,'LineWidth',1,'XTick',...
    [113.65 113.70 113.75 113.80 113.85 113.90],'XTickLabel',...
    {'113.65','113.70','113.75','113.80','113.85','113.90'});