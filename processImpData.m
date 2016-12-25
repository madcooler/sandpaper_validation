function processImpData


ia_s = [45;60;30];
step = 31;

%src = './coated_tape_data/';
%
src = './uncoated_tape_data/';
%src = './uncoated_tape_data/';
src = './coated_sandpaper_c1000_data/';
%src = './glass_data/'

%src = './diffuse_gold_beckmann/';
%src = './singlefacet_r_0.1_dp0.5_gold/';
%src = './coated_tape_depolarising0.2_data/';
%src = './diffuse_gold_roughness1.0_m10/';

size = length(ia_s);

for i = 1:size
    ia = num2str(ia_s(i));
    str         = [src , 'data_ia_',ia,'.txt'];
    %str_save    = [src , 'imp_uncoated_tape_ia',ia,'.mat'];
    %str_save    = [src , 'imp_coated_tape_ia',ia,'.mat'];
    %str_save    = [src , 'imp_coated_sandpaper_ia',ia,'.mat'];
    str_save    = [src , 'imp_glass_ia',ia,'.mat'];
    str_save    = [src , 'imp_coated_sandpaper_ia',ia,'.mat'];
    %str_save    = [src , 'imp_diffuse_gold_roughness1.0_ia',ia,'.mat'];
    %str_save    = [src , 'imp_sf_r0.1_dp0.5_ia',ia,'.mat'];
    %str_save    = [src , 'imp_coated_tape_dp0.2_ia',ia,'.mat'];
    
    
    load(str);

    if strcmp(ia , '60')
        data = data_ia_60;
    end

    if strcmp(ia, '30')
        data = data_ia_30;
    end

    if strcmp(ia, '45')
        data = data_ia_45;
    end


    data(:,13) = (data(:,5) + data(:,6) +data(:,7)+data(:,8))/2;

    pair = length(data(:,8))/step;

    imp_info_0_0 = zeros(step,12);
    imp_info_45_45 = zeros(step,12);
    imp_info_90_90 = zeros(step,12);
    imp_info_135_135 = zeros(step,12);
    imp_info_0_45 = zeros(step,12);
    imp_info_0_m45 = zeros(step,12);
    imp_info_90_m45 = zeros(step,12);
    imp_info_90_135 = zeros(step,12);

    i = 1 ;
    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_0_0 = data(startindex:endindex,:);
    
    i =2;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_45_45 = data(startindex:endindex,:);

    i = 3;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_90_90 = data(startindex:endindex,:);
    
    i = 4;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_135_135 = data(startindex:endindex,:);
    
    i = 5;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_0_45 = data(startindex:endindex,:);
    
    i =6;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_0_m45 = data(startindex:endindex,:);
    
    i =7;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_90_135 = data(startindex:endindex,:);
    
    i =8;

    indexBase = (i-1)*step;
    startindex = indexBase+1;
    endindex   = indexBase+step;
    imp_info_90_m45 = data(startindex:endindex,:);
    
    
    mid = round(step/2);

    specular_intensity_00       = imp_info_0_0(mid,13);
    specular_intensity_4545     = imp_info_45_45(mid,13);
    specular_intensity_9090     = imp_info_90_90(mid,13);
    specular_intensity_135135   = imp_info_135_135(mid,13);
    specular_intensity_045      = imp_info_0_45(mid,13);
    specular_intensity_0m45     = imp_info_0_m45(mid,13);
    specular_intensity_90135    = imp_info_90_135(mid,13);
    specular_intensity_90m45    = imp_info_90_m45(mid,13);

for i = 1 : step
    imp_info_0_0(i,14)      = imp_info_0_0(i,13)/specular_intensity_00;
    imp_info_45_45(i,14)    = imp_info_45_45(i,13)/specular_intensity_4545;
    imp_info_90_90(i,14)    = imp_info_90_90(i,13)/specular_intensity_9090;
    imp_info_135_135(i,14)  = imp_info_135_135(i,13)/specular_intensity_135135;
    imp_info_0_45(i,14)     = imp_info_0_45(i,13)/specular_intensity_045;
    imp_info_0_m45(i,14)    = imp_info_0_m45(i,13)/specular_intensity_0m45;
    imp_info_90_135(i,14)   = imp_info_90_135(i,13)/specular_intensity_90135;
    imp_info_90_m45(i,14)   = imp_info_90_m45(i,13)/specular_intensity_90m45;
    
    imp_info_0_0(i,15)      = abs( 180 * atan(imp_info_0_0(i,11) / imp_info_0_0(i,10))/(2*pi));
    imp_info_45_45(i,15)    = abs(180 * atan(imp_info_45_45(i,11) / imp_info_45_45(i,10))/(2*pi));
    imp_info_0_45(i,15)     = abs( 180 * atan(imp_info_0_45(i,11) / imp_info_0_45(i,10))/(2*3.1415));
    
    imp_info_90_90(i,15)    = abs(180 * atan(imp_info_90_90(i,11) / imp_info_90_90(i,10))/(2*pi));
    imp_info_135_135(i,15)  = abs(180 * atan(imp_info_135_135(i,11) / imp_info_135_135(i,10))/(2*pi));
    imp_info_0_m45(i,15)    = abs(180 * atan(imp_info_0_m45(i,11) / imp_info_0_m45(i,10))/(2*pi));
    imp_info_90_135(i,15)   = abs(180 * atan(imp_info_90_135(i,11) / imp_info_90_135(i,10))/(2*pi));
    imp_info_90_m45(i,15)   = abs(180 * atan(imp_info_90_m45(i,11) / imp_info_90_m45(i,10))/(2*pi));
    
    
end
    
    save(str_save,'imp_info_0_0','imp_info_45_45','imp_info_90_90','imp_info_135_135','imp_info_0_45','imp_info_0_m45','imp_info_90_135','imp_info_90_m45');
    
end


    
end