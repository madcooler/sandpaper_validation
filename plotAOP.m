function plotAOP(impfile,measuredfile,file,file_fig,range,x_imp,x,aop_pos,plotAverageIntensity)

load(impfile);
load(measuredfile);

subplot(321)
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
plot(x_imp,imp_info_0_0(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_0_0(:,aop_pos),'b-s','DisplayName','measured data')


if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_0(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_0(:,14),'b:','DisplayName','measured avaraged intensity')
end

hold off
ylim([0 90])
h=legend('show','Location','northeast');
set(h,'Fontsize',15);
h=xlabel('reflection angle \circ');  
set(h,'Fontsize',15);
h=ylabel('AOP \circ'); 
set(h,'Fontsize',15); 
h=title('pl\_angle = 0\circ co\_angle = 0\circ');
set(h,'Fontsize',15);

subplot(322)
plot(x_imp,imp_info_45_45(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_45_45(:,aop_pos),'b-s','DisplayName','measured data')

if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_45_45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_45_45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
h=legend('show','Location','northeast');
set(h,'Fontsize',15);
h=xlabel('reflection angle \circ');
set(h,'Fontsize',15);
h=ylabel('AOP \circ');  
set(h,'Fontsize',15);
h=title('pl\_angle = 45\circ co\_angle = 45\circ');
set(h,'Fontsize',15);


%plot(info_45_45(:,8),'DisplayName','info_0_0')

subplot(323)
plot(x_imp,imp_info_90_90(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_90_90(:,aop_pos),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_90(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_90(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
h=legend('show','Location','northeast');
set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  
set(h,'Fontsize',15); 
h=ylabel('AOP \circ');  
set(h,'Fontsize',15); 
h=title('pl\_angle = 90\circ co\_angle = 90\circ');set(h,'Fontsize',15); 

subplot(324)
plot(x_imp,imp_info_135_135(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_135_135(:,aop_pos),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_135_135(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_135_135(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
h=legend('show','Location','northeast');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ'); set(h,'Fontsize',15);  
h=ylabel('AOP \circ');  
set(h,'Fontsize',15); 
h=title('pl\_angle = 135\circ co\_angle = 135\circ');set(h,'Fontsize',15); 

subplot(325)
plot(x_imp,imp_info_0_45(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_0_45(:,aop_pos),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
h=legend('show','Location','northeast');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  set(h,'Fontsize',15); 
h=ylabel('AOP \circ');  
set(h,'Fontsize',15); 
h=title('pl\_angle = 0\circ co\_angle = 45\circ');set(h,'Fontsize',15); 


subplot(326)
plot(x_imp,imp_info_0_m45(range,aop_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_0_m45(:,aop_pos),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_m45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_m45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
h=legend('show','Location','northeast');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  set(h,'Fontsize',15); 
h=ylabel('AOP \circ');  
set(h,'Fontsize',15); 
h=title('pl\_angle = 0\circ co\_angle = -45\circ');set(h,'Fontsize',15); 

%{
subplot(427)
plot(x_imp,imp_info_90_135(range,dolp_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_90_135(:,8),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_135(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_135(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
legend('show','Location','northeast');
xlabel('reflection angle');  
ylabel('DOLP');  
title('pl\_angle = 90 co\_angle = 135');

subplot(428)
plot(x_imp,imp_info_90_m45(range,dolp_pos),'r-*','DisplayName','our simulated data')
hold on;
plot(x,info_90_m45(:,8),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_m45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_m45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 90])
legend('show','Location','northeast');
xlabel('reflection angle');  
ylabel('DOLP');  
title('pl\_angle = 90 co\_angle = -45');
%}

set (gcf,'Position',[500,500,1000,700], 'color','w');
set (gcf,'color','white','paperpositionmode','auto');
saveas(gcf,file);
saveas(gcf,file_fig);


end