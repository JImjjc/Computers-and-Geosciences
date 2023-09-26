%% �����¡����ݼ���ɳŨ�ȱ仯����ͼ

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
u1=dry_sedA;
u2=dry_sedB;

%ˮ������
depdata1(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','C7:C32');%B��


col3={'��mg/L��','��mg/L��','��mg/L��'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'��״��߶ȣ�m��'};


value=60; % u=1.5 ssc=100 sal=30
% mv=[40 40 40];% u=1.5 0.9 ssc=40 sal=30 ���ֵ
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('�ݼ���ɳŨ�ȱ仯����ͼ');

% % #A
subplot(2,1,1),
I=1;
data=u1;
[nrcolumns,nrrows]=size(data); % determine nr. columns��/�㣬row��
dep(1:nrcolumns)=depdata1(1:nrcolumns,2); % depth
for i=1:nrcolumns %����Сʱ��
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%���㴹��ƽ��ֵ����JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6��ˮ�����������ֵ���ɱ�����ײ�����д��
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%��tn�ֳ�xres=100��ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%��ֵ����JJC

deinterp=spline(tn,dep,xv);%��ֵˮ��
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
xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'��a��#A','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:10:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);



% % #B
subplot(2,1,2),

data=u2;
[nrcolumns,nrrows]=size(data); % determine nr. columns��/�㣬row��
dep(1:nrcolumns)=depdata2(1:nrcolumns,2); % depth
for i=1:nrcolumns %����Сʱ��
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%���㴹��ƽ��ֵ����JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6��ˮ�����������ֵ���ɱ�����ײ�����д��
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%��tn�ֳ�xres=100��ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%��ֵ����JJC

deinterp=spline(tn,dep,xv);%��ֵˮ��
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
xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'��b��#B','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:10:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep
%% �����¡����鼾��ɳŨ�ȱ仯����ͼ

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
u1=wet_sedA;
u2=wet_sedB;

%ˮ������
depdata1(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#B����','C6:C31');%B��


col3={'��mg/L��','��mg/L��','��mg/L��'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'��״��߶ȣ�m��'};


value=120; % u=1.5 ssc=120 sal=30��ע��#B��ssc���Ϊ80
% mv=[120 40 40];% u=1.5 0.9 ssc=40 sal=30 ���ֵ

%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('�鼾��ɳŨ�ȱ仯����ͼ');

% % #A
subplot(2,1,1),
I=1;
data=u1;
[nrcolumns,nrrows]=size(data); % determine nr. columns��/�㣬row��
dep(1:nrcolumns)=depdata1(1:nrcolumns,2); % depth
for i=1:nrcolumns %����Сʱ��
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%���㴹��ƽ��ֵ����JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6��ˮ�����������ֵ
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%��tn�ֳ�xres=100��ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%��ֵ����JJC

deinterp=spline(tn,dep,xv);%��ֵˮ��
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
xlabel('���ʱ�䣨2021-08-22 13:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'��a��#A','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:30:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);



% % #B
subplot(2,1,2),

value=60;

data=u2;
[nrcolumns,nrrows]=size(data); % determine nr. columns��/�㣬row��
dep(1:nrcolumns)=depdata2(1:nrcolumns,2); % depth
for i=1:nrcolumns %����Сʱ��
b(i,1)=0.1*(data(i,1)+data(i,6))+0.2*(data(i,4)+data(i,3)+data(i,2)+data(i,5));%���㴹��ƽ��ֵ����JJC
end

for j=1:nlay
c(j,1:nrcolumns)=data(1:nrcolumns,j);%6��ˮ�����������ֵ
end
tn=[0:1:nrcolumns-1]+1;

xres=100;
% yres=20;
[x,y]=meshgrid(tn,1:-0.2:0);
xv=linspace(min(tn),max(tn),xres);%��tn�ֳ�xres=100��ge
yv=[1:-0.05:0];
[Xinterp,Yinterp]=meshgrid(xv,yv);%��ֵ����JJC

deinterp=spline(tn,dep,xv);%��ֵˮ��
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
xlabel('���ʱ�䣨2021-08-22 13:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'��b��#B','FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:10:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep


