%% �����¡����ݼ����ٱ仯����ͼ

clc;clear;
% % �칫�ҵ������ݴ洢·��
% filepath1='D:\user1\Desktop\����-�����������̿�����\������۲�2021��1�¿ݼ�\�۲�����';

% %�������洢·��
filepath1='D:\������۲�2021��1�¿ݼ��۲�����';
addpath(filepath1);
addpath('D:\JJCFileGroup\01ѧλ����\����ű�code\��ɳ����-�ƽ�');%��� othercolor.m

%����ʵ��ֵ��12�����ݣ���� 0.2H�� 0.4H�� 0.6H�� 0.8H�� �ײ㣬ÿ�㰴�������ټ�����У���λm/s����
%�ݼ��󳱣�2021-01-14 15:00:00-2021-01-15 16:00:00������26h	
dry_spdA=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','D5:O30');%A��
dry_spdB=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','D7:O32');%B��
dry_timehrA=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#A����ʱ��
dry_timehrB=linspace(datenum(2021,1,14,15,0,0),datenum(2021,1,15,16,0,0),26);%#B����ʱ��

%�ֳ����١�����
for i=1:6
dryA_V(:,i)=dry_spdA(:,2*i-1);%�ֳ����ٱ���V,���㵥λΪm/s���ɱ�����ײ�˳��д��
dryA_ang(:,i)=dry_spdA(:,2*i);%�ֳ�����0-360��
dryB_V(:,i)=dry_spdB(:,2*i-1);%�ֳ����ٱ���V,
dryB_ang(:,i)=dry_spdB(:,2*i);%�ֳ�����0-360��
end

%ˮ������
depdata1(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��1��������۲��¼��20210121.xlsx','#B����','C7:C32');%B��
u1=dryA_V;
u2=dryB_V;

col3={'(m/s)','(m/s)','(m/s)'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'��״��߶ȣ�m��'};
% ylabe2={'����ƽ�����٣�m/s��','����ƽ������/m��s^{-1}','����ƽ������/m��s^{-1}'};
% ylabe2={'����ƽ����ɳŨ��/mg��L^{-1}','����ƽ����ɳŨ��/mg��L^{-1}','����ƽ����ɳŨ��/mg��L^{-1}'};
% ylabe2={'����ƽ���ζ�/psu','����ƽ���ζ�/psu','����ƽ���ζ�/psu'};

value=1.5; % u=1.5 ssc=300 sal=30
mv=[1.5 1.5 0.9];% u=1.5 0.9 ssc=300 300 sal=30
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,sgtitle('�ݼ����ٱ仯����ͼ')

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
xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'��a��#A','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc����ΪN��2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'��a��#A','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);
col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:value/5:value],'FontSize',12); %�ӱ�
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
xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'��b��#B','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc����ΪN��2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'��a��#B','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:value/5:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep
%% �����¡����鼾���ٱ仯����ͼ

clc;clear;
% % �칫�ҵ������ݴ洢·��
% filepath1='D:\user1\Desktop\����-�����������̿�����\������۲�2021��7�º鼾\�۲�����';

% %�������洢·��
filepath1='D:\������۲�2021��7�º鼾�۲�����';
addpath(filepath1);
addpath('D:\JJCFileGroup\01ѧλ����\����ű�code\��ɳ����-�ƽ�');%��� othercolor.m

%����ʵ��ֵ��12�����ݣ���� 0.2H�� 0.4H�� 0.6H�� 0.8H�� �ײ㣬ÿ�㰴�������ټ�����У���λm/s����
%�鼾�󳱣�2021-08-22 13:00:00-2021-08-23 14:00:00������26h	
%����ʵ��ֵ����18�����ݣ�1-6��u��7-12��v
wet_spdA=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#A����','D5:O30');%A��
wet_spdB=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#B����','D6:O31');%B��
wet_timehrA=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#A����ʱ��
wet_timehrB=linspace(datenum(2021,8,22,13,0,0),datenum(2021,8,23,14,0,0),26);%#B����ʱ��

%�ֳ����١�����
for i=1:6
wetA_V(:,i)=wet_spdA(:,2*i-1);%�ֳ����ٱ���V,���㵥λΪm/s���ɱ�����ײ�˳��д��
wetA_ang(:,i)=wet_spdA(:,2*i);%�ֳ�����0-360��
wetB_V(:,i)=wet_spdB(:,2*i-1);%�ֳ����ٱ���V,
wetB_ang(:,i)=wet_spdB(:,2*i);%�ֳ�����0-360��
end

%ˮ������
depdata1(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#A����','C5:C30');%A��
depdata2(:,2)=xlsread('2021��������鼾�۲��¼��20210826.xlsx','#B����','C6:C31');%B��
u1=wetA_V;
u2=wetB_V;

col3={'(m/s)','(m/s)','(m/s)'};
widt=0.35;
higt=1/3-0.07;
nlay=6;   %layers of the data
ylabe={'��״��߶ȣ�m��'};
% ylabe2={'����ƽ�����٣�m/s��','����ƽ������/m��s^{-1}','����ƽ������/m��s^{-1}'};
% ylabe2={'����ƽ����ɳŨ��/mg��L^{-1}','����ƽ����ɳŨ��/mg��L^{-1}','����ƽ����ɳŨ��/mg��L^{-1}'};
% ylabe2={'����ƽ���ζ�/psu','����ƽ���ζ�/psu','����ƽ���ζ�/psu'};

value=1.5; % u=1.5 ssc=300 sal=30
mv=[1.5 1.5 0.9];% u=1.5 0.9 ssc=300 300 sal=30
xticks={'0','5','10','15','20','25'};


%%%%%%%%%%%%%%%%%%%%%%%
figure,
sgtitle('�鼾���ٱ仯����ͼ');

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
xlabel('���ʱ�䣨2021-08-22 13:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,7.5,'��a��#A','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc����ΪN��2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'��a��#A','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);
col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:value/5:value],'FontSize',12); %�ӱ�
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
xlabel('���ʱ�䣨2021-08-22 13:00����h��','FontSize',12) ;
ylabel(ylabe,'FontSize',12);
set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
text(1,8.5,'��b��#B','FontSize',12);
% [AX,line1,line2]=plotyy([1:nrcolumns],dep,[1:nrcolumns],b);
% set(AX(1),'ycolor','k');
% set(AX(2),'ycolor','r');
% set(line1,'color','k','LineWidth',1.5);
% set(line2,'color','r','LineWidth',1.5);
% hold on
% 
% xlim(AX(1),[1,26]);
% xlim(AX(2),[1,26]);
% set(get(AX(1),'Ylabel'),'String',ylabe,'FontSize',12);%Sc����ΪN��2020.02.20
% set(get(AX(2),'Ylabel'),'String',ylabe2{I},'FontSize',12) ;
% xlabel('���ʱ�䣨2021-01-14 15:00����h��','FontSize',12) ;
% set(gca,'XMinorTick','on','YMinorTick','on','fontsize',12);
% 
% text(1,8.5,'��a��#B','FontSize',12);
% 
% ylim(AX(1),[0,6*1.5]);
% ylim(AX(2),[0,mv(I)*1.5]);
% set(AX(1),'yTick',0:2:6);
% set(AX(2),'yTick',0:mv(I)/3:mv(I));
% set(AX(1),'yTicklabel',0:2:6,'FontSize',12);
% set(AX(2),'yTicklabel',0:mv(I)/3:mv(I),'FontSize',12);

col=colorbar;
% set(col,'position',[0.93 0.12 0.02 0.76]); %colorbarλ�ô�С
set(col,'ytick',[0:value/5:value],'FontSize',12); %�ӱ�
caxis([0 value]); %������ڸ���colorbar�ķ�Χ
set(get(col,'Title'),'string',col3{I} ,'FontSize',12);
hold on;
set(gca,'CLim',[0 value]);

axis([1 26 0 6*1.5]);
%     C=contour(Xinterp,Yinterp1,cxz);
clear b x y tn xv yv c data deinterp dep


