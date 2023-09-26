%% �������㡪��ŷ����������ƽ�������ݼ�

clear;clc
addpath('D:\Delft3D Model test\ldb-dry-20211020-1107-1123-1\��������dry-20211020-1107-1123-1');

%���س������ٷ�����x/y component�ֱ����γ��;������٣�ȡ���е�3�㣨k1,k4,k6����26Сʱ������ΧM190-510��Nȫ��
%����data��struct�У�ValΪ����ֵ��X/YΪ��γ�ȣ�ZΪˮ��/m��TimeΪ������ʱ���

%k1�������
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-M190-510-k1.mat');%��ȡģ����������
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-M190-510-k1.mat');%��ȡģ����������
y1=a.data.Val;

%k4�в�����
a=load('horizontal velocity-x component-2021-01-14 08h-15 09h-M190-510-k4.mat');
x4=a.data.Val;
a=load('horizontal velocity-y component-2021-01-14 08h-15 09h-M190-510-k4.mat');
y4=a.data.Val;

%k6�ײ�����
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
    
%�޳����źӵ��ڹ���ֵ�������ֵ���ڶ���С������ֵ��quiver��ͷ����
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
xmin=113.4;xmax=114.1;ymin=22;ymax=22.9;%��ͼ���귶Χ
%���
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u1,v1,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%���ٱ������
% m_vec(1,long',lat',u1*2,-v1*2,0.05,'b','shaftwidth',0.5, 'headlength',2.5);%1.1��ʾ�Ŵ���scale��
% m_vec(1,114-0.05,22.68,2,0,0.4,'b','shaftwidth',0.5, 'headlength',3, 'key', '0.2 m/s')
m_text(114-0.05,22.71,'0.2m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��a1���ݼ��������','color','k','fontsize',18);
% title('�ݼ��������','fontSize',18);
set(gcf,'GraphicsSmoothing','on');
%
%�в�
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u4,v4,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%���ٱ������
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��b1���ݼ��в�����','color','k','fontsize',18);
% title('�ݼ��в�����','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%�ײ�
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u6,v6,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,0.7,'b','MaxHeadSize',1.2);%���ٱ������
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��c1���ݼ��ײ�����','color','k','fontsize',18);
% title('�ݼ��ײ�����','fontSize',18);
set(gcf,'GraphicsSmoothing','on');


%% �������㡪��ŷ����������ƽ�������鼾

clear;clc
addpath('D:\Delft3D Model test\ldb-wet-20210906-1116-1-1217-1\��������wet-20210906-1116-1-1217-1');

%���س������ٷ�����x/y component�ֱ����γ��;������٣�ȡ���е�3�㣨k1,k4,k6����26Сʱ������ΧM190-510��Nȫ��
%����data��struct�У�ValΪ����ֵ��X/YΪ��γ�ȣ�ZΪˮ��/m��TimeΪ������ʱ���

%k1�������
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-M190-510-k1.mat');%��ȡģ����������
x1=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-M190-510-k1.mat');%��ȡģ����������
y1=a.data.Val;

%k4�в�����
a=load('horizontal velocity-x component-2021-08-22 08h-23 09h-M190-510-k4.mat');
x4=a.data.Val;
a=load('horizontal velocity-y component-2021-08-22 08h-23 09h-M190-510-k4.mat');
y4=a.data.Val;

%k6�ײ�����
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
    
%�޳����źӵ��ڹ���ֵ�������ֵ���ڶ���С������ֵ��quiver��ͷ����
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
xmin=113.4;xmax=114.1;ymin=22;ymax=22.9;%��ͼ���귶Χ
%���
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u1,v1,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%���ٱ������
m_text(114-0.05,22.71,'0.2m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��a2���鼾�������','color','k','fontsize',18);
% title('�鼾�������','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%�в�
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u4,v4,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%���ٱ������
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��b2���鼾�в�����','color','k','fontsize',18);
% title('�鼾�в�����','fontSize',18);
set(gcf,'GraphicsSmoothing','on');

%�ײ�
figure,
m_proj('Mercator','long',[xmin xmax],'lat',[ymin ymax]);%ȷ��ͶӰ��ʽ�ͻ�ͼ����
% m_gshhs_f('save','mycoast');%��Ҫ����gshhs��ϸ����ͼ����Google��ν�gshhs����m_map
m_usercoast('mycoast','patch',[1 1 1],'edgecolor','k');
% m_usercoast('mycoast','line','linewidth',1,'color','k');
m_grid('box','on','color','k', 'linestyle','none','xtick',6,'ytick',7,'tickdir','in','yaxislocation','left','fontsize',18);
hold on
m_quiver(long,lat,u6,v6,1,'b','MaxHeadSize',1.2);%1.1��ʾ�Ŵ���scale��
m_quiver(114-0.05,22.68,0.1,0,.7,'b','MaxHeadSize',1.2);%���ٱ������
m_text(114-0.05,22.71,'0.1m/s','color','k','fontsize',18);
% m_northarrow(114,22.8,0.06,'type',2);%ָ����,0.06��ʾ��С
xlabel('����','fontsize',18);
ylabel('γ��','fontSize',18);
m_text(113.81,22.85,'��c2���鼾�ײ�����','color','k','fontsize',18);
% title('�鼾�ײ�����','fontSize',18);
set(gcf,'GraphicsSmoothing','on');


