%% 第四章——枯季悬沙浓度变化剖面图

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
u1=dry_sedA;
u2=dry_sedB;

%水深数据
depdata1(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','C7:C32');%B点


col3={'（mg/L）','（mg/L）','（mg/L）'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'距底床高度（m）'};


value=60; % u=1.5 ssc=100 sal=30
% mv=[40 40 40];% u=1.5 0.9 ssc=40 sal=30 最大值
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('枯季悬沙浓度变化剖面图');

% % #A
subplot(2,1,1),
I=1;
data=u1;
[nrcolumns,nrrows]=size(data); % determine nr. columns行/层，row列
dep(1:nrcolumns)=depdata1(1:nrcolumns,2); % depth
for i=1:nrcolumns %测量小时数
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%计算垂向平均值——JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6层水样，各层测量值，由表层至底层逆序写入
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%将tn分出xres=100个ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%插值——JJC

deinterp=spline(tn,dep,xv);%插值水深
for jj=1:xres
    Yinterp1(:,jj)=Yinterp(:,jj)*deinterp(jj);
end
scrsz = get(0,'ScreenSize');
fac=1.5;
width=fac*scrsz(3)/3;
height=scrsz(4)/4;
cxz=interp2(x,y,c,Xinterp,Yinterp,'spline');


pcolor(Xinterp,Yinterp1,cxz);
colormap jet
shading interp;

hold on
plot(dep,'k','LineWidth',1);
xlim([1,26]);
ylim([0,8]);
yticks(0:2:8);
yticklabels(0:2:8);
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'（a）#A','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:10:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);



% % #B
subplot(2,1,2),

data=u2;
[nrcolumns,nrrows]=size(data); % determine nr. columns行/层，row列
dep(1:nrcolumns)=depdata2(1:nrcolumns,2); % depth
for i=1:nrcolumns %测量小时数
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%计算垂向平均值——JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6层水样，各层测量值，由表层至底层逆序写入
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%将tn分出xres=100个ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%插值——JJC

deinterp=spline(tn,dep,xv);%插值水深
for jj=1:xres
    Yinterp1(:,jj)=Yinterp(:,jj)*deinterp(jj);
end
scrsz = get(0,'ScreenSize');
fac=1.5;
width=fac*scrsz(3)/3;
height=scrsz(4)/4;
cxz=interp2(x,y,c,Xinterp,Yinterp,'spline');



pcolor(Xinterp,Yinterp1,cxz);
colormap jet
shading interp;

hold on
plot(dep,'k','LineWidth',1);
xlim([1,26]);
ylim([0,10]);
yticks(0:2:10);
yticklabels(0:2:10);
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'（b）#B','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:10:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep
%% 第四章——洪季悬沙浓度变化剖面图

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
u1=wet_sedA;
u2=wet_sedB;

%水深数据
depdata1(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年伶仃洋洪季观测记录表20210826.xlsx','#B报表','C6:C31');%B点


col3={'（mg/L）','（mg/L）','（mg/L）'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'距底床高度（m）'};


value=120; % u=1.5 ssc=120 sal=30，注意#B的ssc最大为80
% mv=[120 40 40];% u=1.5 0.9 ssc=40 sal=30 最大值

%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('洪季悬沙浓度变化剖面图');

% % #A
subplot(2,1,1),
I=1;
data=u1;
[nrcolumns,nrrows]=size(data); % determine nr. columns行/层，row列
dep(1:nrcolumns)=depdata1(1:nrcolumns,2); % depth
for i=1:nrcolumns %测量小时数
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%计算垂向平均值——JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6层水样，各层测量值
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%将tn分出xres=100个ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%插值——JJC

deinterp=spline(tn,dep,xv);%插值水深
for jj=1:xres
    Yinterp1(:,jj)=Yinterp(:,jj)*deinterp(jj);
end
scrsz = get(0,'ScreenSize');
fac=1.5;
width=fac*scrsz(3)/3;
height=scrsz(4)/4;
cxz=interp2(x,y,c,Xinterp,Yinterp,'spline');


pcolor(Xinterp,Yinterp1,cxz);
colormap jet
shading interp;

hold on
plot(dep,'k','LineWidth',1);
xlim([1,26]);
ylim([0,8]);
yticks(0:2:8);
yticklabels(0:2:8);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'（a）#A','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:30:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);



% % #B
subplot(2,1,2),

value=60;

data=u2;
[nrcolumns,nrrows]=size(data); % determine nr. columns行/层，row列
dep(1:nrcolumns)=depdata2(1:nrcolumns,2); % depth
for i=1:nrcolumns %测量小时数
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%计算垂向平均值——JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6层水样，各层测量值
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%将tn分出xres=100个ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%插值——JJC

deinterp=spline(tn,dep,xv);%插值水深
for jj=1:xres
    Yinterp1(:,jj)=Yinterp(:,jj)*deinterp(jj);
end
scrsz = get(0,'ScreenSize');
fac=1.5;
width=fac*scrsz(3)/3;
height=scrsz(4)/4;
cxz=interp2(x,y,c,Xinterp,Yinterp,'spline');



pcolor(Xinterp,Yinterp1,cxz);
colormap jet
shading interp;

hold on
plot(dep,'k','LineWidth',1);
xlim([1,26]);
ylim([0,10]);
yticks(0:2:10);
yticklabels(0:2:10);
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'（b）#B','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:10:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep


