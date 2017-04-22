function plotDOLP(impfile,measuredfile,file,file_fig,range,x_imp,x,dolp_pos,plotAverageIntensity)

load(impfile);
load(measuredfile);

smooth_curve = true;

smooth_factor = 3;

subplot(321)
if smooth_curve == true;
    imp_data     = smooth(imp_info_0_0(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_0_0(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_0_0(range,dolp_pos);
    plot(x_imp,imp_data_raw,'r*','DisplayName','unsmoothed raw simulated data')
%     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','smoothed simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_0_0(:,8),'bo','MarkerSize',10,'DisplayName','measured data',...
    'MarkerFaceColor',[0 0.447058826684952 0.74117648601532])


if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_0(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_0(:,14),'b:','DisplayName','measured avaraged intensity')
end

hold off
ylim([0 1])
h=legend('show','Location','southeast');
set(h,'Fontsize',15);
h=xlabel('reflection angle \circ');  
set(h,'Fontsize',20);
h=ylabel('DOLP'); 
set(h,'Fontsize',20); 
h=title('pl\_angle = 0\circ co\_angle = 0\circ');
set(h,'Fontsize',20);

subplot(322)

if smooth_curve == true;
    imp_data     = smooth(imp_info_45_45(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_45_45(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_45_45(range,dolp_pos);
%     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    plot(x_imp,imp_data_raw,'r*','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','our simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_45_45(:,8),'bo','MarkerSize',10,'DisplayName','measured data','MarkerFaceColor',[0 0.447058826684952 0.74117648601532])

if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_45_45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_45_45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
h=legend('show','Location','northeast');
set(h,'Fontsize',15);
h=xlabel('reflection angle \circ');
set(h,'Fontsize',20);
h=ylabel('DOLP');  
set(h,'Fontsize',20);
h=title('pl\_angle = 45\circ co\_angle = 45\circ');
set(h,'Fontsize',20);


%plot(info_45_45(:,8),'DisplayName','info_0_0')

subplot(323)
if smooth_curve == true;
    imp_data     = smooth(imp_info_90_90(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_90_90(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_90_90(range,dolp_pos);
    %     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    plot(x_imp,imp_data_raw,'r*','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','our simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_90_90(:,8),'bo','MarkerSize',10,'DisplayName','measured data','MarkerFaceColor',[0 0.447058826684952 0.74117648601532])
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_90(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_90(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
h=legend('show','Location','southeast');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  set(h,'Fontsize',20); 
h=ylabel('DOLP');  set(h,'Fontsize',20); 
h=title('pl\_angle = 90\circ co\_angle = 90\circ');set(h,'Fontsize',20); 

subplot(324)
if smooth_curve == true;
    imp_data     = smooth(imp_info_135_135(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_135_135(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_135_135(range,dolp_pos);
    %     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    plot(x_imp,imp_data_raw,'r*','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','our simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_135_135(:,8),'bo','MarkerSize',10,'DisplayName','measured data','MarkerFaceColor',[0 0.447058826684952 0.74117648601532])
    
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_135_135(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_135_135(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
h=legend('show','Location','northeast');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ'); set(h,'Fontsize',20);  
h=ylabel('DOLP');  set(h,'Fontsize',20); 
h=title('pl\_angle = 135\circ co\_angle = 135\circ');set(h,'Fontsize',20); 

subplot(325)
if smooth_curve == true;
    imp_data     = smooth(imp_info_0_45(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_0_45(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_0_45(range,dolp_pos);
    %     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    plot(x_imp,imp_data_raw,'r*','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','our simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_0_45(:,8),'bo','MarkerSize',10,'DisplayName','measured data','MarkerFaceColor',[0 0.447058826684952 0.74117648601532])
    
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
h=legend('show','Location','northwest');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  set(h,'Fontsize',20); 
h=ylabel('DOLP');  set(h,'Fontsize',20); 
h=title('pl\_angle = 0\circ co\_angle = 45\circ');set(h,'Fontsize',20); 


subplot(326)
if smooth_curve == true;
    imp_data     = smooth(imp_info_0_m45(range,dolp_pos),smooth_factor);
    plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
    % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
    hold on;
else
    imp_data     = smooth(imp_info_0_m45(range,dolp_pos),smooth_factor);
    imp_data_raw = imp_info_0_m45(range,dolp_pos);
    %     plot(x_imp,imp_data_raw,'x','DisplayName','our simulated data')
    plot(x_imp,imp_data_raw,'r*','DisplayName','our simulated data')
    hold on;
%     plot(x_imp,imp_data,'DisplayName','our simulated data')
end
%plot(info_0_0(:,8), imp_info_0_0(:,8),'DisplayName','info_0_0')
% plot(x_imp,imp_data,'r*','DisplayName','our simulated data')
% % plot(x_imp,imp_info_0_0(range,dolp_pos),'r*','DisplayName','our simulated data')
% hold on;
plot(x,info_0_m45(:,8),'bo','MarkerSize',10,'DisplayName','measured data','MarkerFaceColor',[0 0.447058826684952 0.74117648601532])
    
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_0_m45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_0_m45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
h=legend('show','Location','northwest');set(h,'Fontsize',15); 
h=xlabel('reflection angle \circ');  set(h,'Fontsize',20); 
h=ylabel('DOLP');  set(h,'Fontsize',20); 
h=title('pl\_angle = 0\circ co\_angle = -45\circ');set(h,'Fontsize',20); 

%{
subplot(427)
plot(x_imp,imp_info_90_135(range,dolp_pos),'r*','DisplayName','our simulated data')
hold on;
plot(x,info_90_135(:,8),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_135(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_135(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
legend('show','Location','northeast');
xlabel('reflection angle');  
ylabel('DOLP');  
title('pl\_angle = 90 co\_angle = 135');

subplot(428)
plot(x_imp,imp_info_90_m45(range,dolp_pos),'r*','DisplayName','our simulated data')
hold on;
plot(x,info_90_m45(:,8),'b-s','DisplayName','measured data');
if plotAverageIntensity == 1
    hold on;
    plot(x_imp,imp_info_90_m45(range,14),'r--','DisplayName','imp avaraged intensity')
    hold on;
    plot(x,info_90_m45(:,14),'b:','DisplayName','measured avaraged intensity')
end
hold off
ylim([0 1])
legend('show','Location','northeast');
xlabel('reflection angle');  
ylabel('DOLP');  
title('pl\_angle = 90 co\_angle = -45');
%}

set (gcf,'Position',[500,500,1000,700], 'color','w');
set (gcf,'color','white','paperpositionmode','auto');
% saveas(gcf,file);
saveas(gcf,file_fig);

snam='new_no_blank'; % note: NO extension...
s=hgexport('readstyle',snam);
s.Format = 'png'; %define your png format
hgexport(gcf,file,s);

end