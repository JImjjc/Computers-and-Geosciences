%% 第四章——枯季流速变化剖面图

clc;clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年1月枯季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年1月枯季观测数据';
addpath(filepath1);
addpath('D:\JJCFileGroup\01学位论文\程序脚本code\悬沙剖面-黄杰');%添加 othercolor.m

%加载实测值，12列数据：表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，每层按流向、流速间隔分列，单位m/s，度
%枯季大潮，2021-01-14 15:00:00-2021-01-15 16:00:00，连续26h	
dry_spdA=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','D5:O30');%A点
dry_spdB=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','D7:O32');%B点
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A整点时刻
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B整点时刻

%分出流速、流向
for i=1:6
dryA_V(:,i)=dry_spdA(:,2*i-1);%分出流速标量V,换算单位为m/s，由表层至底层顺序写入
dryA_ang(:,i)=dry_spdA(:,2*i);%分出流向0-360°
dryB_V(:,i)=dry_spdB(:,2*i-1);%分出流速标量V,
dryB_ang(:,i)=dry_spdB(:,2*i);%分出流向0-360°
end

%水深数据
depdata1(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#A报表','C5:C30');%A点
depdata2(:,2)=xlsread('2021年1月伶仃洋观测记录表20210121.xlsx','#B报表','C7:C32');%B点
u1=dryA_V;
u2=dryB_V;

col3={'(m/s)','(m/s)','(m/s)'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'距底床高度（m）'};
% ylabe2={'垂线平均流速（m/s）','垂线平均流速/m·s^{-1}','垂线平均流速/m·s^{-1}'};
% ylabe2={'垂线平均悬沙浓度/mg·L^{-1}','垂线平均悬沙浓度/mg·L^{-1}','垂线平均悬沙浓度/mg·L^{-1}'};
% ylabe2={'垂线平均盐度/psu','垂线平均盐度/psu','垂线平均盐度/psu'};

value=1.5; % u=1.5 ssc=300 sal=30
mv=[1.5 1.5 0.9];% u=1.5 0.9 ssc=300 300 sal=30
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,sgtitle('枯季流速变化剖面图')

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
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'（a）#A','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc改名为N，2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'（a）#A','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);
col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:value/5:value],'FontSize',12); %加标
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
xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'（b）#B','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc改名为N，2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'（a）#B','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:value/5:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep
%% 第四章——洪季流速变化剖面图

clc;clear;
% % 办公室电脑数据存储路径
% filepath1='D:\user1\Desktop\海岸-岛礁动力过程课题组\伶仃洋观测2021年7月洪季\观测数据';

% %服务器存储路径
filepath1='D:\伶仃洋观测2021年7月洪季观测数据';
addpath(filepath1);
addpath('D:\JJCFileGroup\01学位论文\程序脚本code\悬沙剖面-黄杰');%添加 othercolor.m

%加载实测值，12列数据：表层 0.2H层 0.4H层 0.6H层 0.8H层 底层，每层按流向、流速间隔分列，单位m/s，度
%洪季大潮，2021-08-22 13:00:00-2021-08-23 14:00:00，连续26h	
%加载实测值，共18列数据，1-6列u，7-12列v
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
u1=wetA_V;
u2=wetB_V;

col3={'(m/s)','(m/s)','(m/s)'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'距底床高度（m）'};
% ylabe2={'垂线平均流速（m/s）','垂线平均流速/m·s^{-1}','垂线平均流速/m·s^{-1}'};
% ylabe2={'垂线平均悬沙浓度/mg·L^{-1}','垂线平均悬沙浓度/mg·L^{-1}','垂线平均悬沙浓度/mg·L^{-1}'};
% ylabe2={'垂线平均盐度/psu','垂线平均盐度/psu','垂线平均盐度/psu'};

value=1.5; % u=1.5 ssc=300 sal=30
mv=[1.5 1.5 0.9];% u=1.5 0.9 ssc=300 300 sal=30
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('洪季流速变化剖面图');

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
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'（a）#A','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc改名为N，2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'（a）#A','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);
col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:value/5:value],'FontSize',12); %加标
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
xlabel('相对时间（2021-08-22 13:00）（h）','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'（b）#B','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc改名为N，2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('相对时间（2021-01-14 15:00）（h）','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'（a）#B','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbar位置大小
set(col,'ytick',[0:value/5:value],'FontSize',12); %加标
caxis([0 value]); %这句用于更改colorbar的范围
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep


