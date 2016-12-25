function ProcessGlassData

%
root = './blackglass_data/';

%root = './uncoated_sandpaper_data/';

ia_s = [15:5:80];

dolp_glass = zeros(8,length(ia_s));

for k = 1 : length(ia_s)
    
    
    
    filehead = 'blackglass'
    ia = num2str(ia_s(k));
    
    rawdata = [root,filehead,'_ia',ia,'_raw.mat'];
    matfile = [root,filehead,'_ia',ia,'.mat'];
    
    load(rawdata);

    groupNum = length( roisignal0 )/4;

    incidentAngle   = zeros(1, groupNum);
    reflectionAngle = zeros(1, groupNum);

    polariserAngle   = zeros(1, groupNum);
    compensatorAngle = zeros(1, groupNum);

    I = zeros(1, groupNum);
    Q = zeros(1, groupNum);
    U = zeros(1, groupNum);
    DOLP = zeros(1, groupNum);

    I_0 = zeros(1, groupNum);
    I_45 = zeros(1, groupNum);
    I_90 = zeros(1, groupNum);
    I_135 = zeros(1, groupNum);

    TotalIntensity = zeros(1, groupNum);

    data = zeros(13, groupNum);

    for i = 1 :groupNum
        indexBase = (i-1)*4+1;
        incidentAngle(i)   =  gl_angle(indexBase);
        reflectionAngle(i) =  gs_angle(indexBase);
        polariserAngle(i)  =  pl_angle(indexBase);
        compensatorAngle(i)=  co_angle(indexBase);

        I1 = roisignal0( indexBase     );
        I2 = roisignal0( indexBase + 1 );
        I3 = roisignal0( indexBase + 2 );
        I4 = roisignal0( indexBase + 3 );

        I_0(i) = I1;
        I_45(i) = I2;
        I_90(i) = I3;
        I_135(i) = I4;

        TotalIntensity(i) = (I1+I2+I3+I4)/2;

        [I(i),Q(i),U(i),DOLP(i)] = ProcessData( I1,I2,I3,I4 ); 
    end

    data(1,:) = incidentAngle;
    data(2,:) = reflectionAngle;
    data(3,:) = polariserAngle;
    data(4,:) = compensatorAngle;
    data(5,:) = I;
    data(6,:) = Q;
    data(7,:) = U;
    data(8,:) = DOLP;
    data(9,:) = I_0;
    data(10,:) = I_45;
    data(11,:) = I_90;
    data(12,:) = I_135;
    data(13,:) = TotalIntensity;

    data = data';

    pair = groupNum/8;

    info_0_0 = zeros(pair,13);
    info_45_45 = zeros(pair,13);
    info_90_90 = zeros(pair,13);
    info_135_135 = zeros(pair,13);
    info_0_45 = zeros(pair,13);
    info_0_m45 = zeros(pair,13);
    info_90_m45 = zeros(pair,13);
    info_90_135 = zeros(pair,13);


    for j = 1 : pair

        indexBase = (j-1)*8; 
        info_0_0(j,:)       = data(1+indexBase,:);
        info_45_45(j,:)     = data(2+indexBase,:);
        info_90_90(j,:)     = data(3+indexBase,:);
        info_135_135(j,:)   = data(4+indexBase,:);
        info_0_45(j,:)      = data(5+indexBase,:);
        info_0_m45(j,:)     = data(6+indexBase,:);
        info_90_135(j,:)    = data(7+indexBase,:);
        info_90_m45(j,:)    = data(8+indexBase,:);

    end

    mid = round(pair/2);

    specular_intensity_00       = info_0_0(mid,13);
    specular_intensity_4545     = info_45_45(mid,13);
    specular_intensity_9090     = info_90_90(mid,13);
    specular_intensity_135135   = info_135_135(mid,13);
    specular_intensity_045      = info_0_45(mid,13);
    specular_intensity_0m45     = info_0_m45(mid,13);
    specular_intensity_90135    = info_90_135(mid,13);
    specular_intensity_90m45    = info_90_m45(mid,13);

    for i = 1 : pair
        info_0_0(i,14)      = info_0_0(i,13)/specular_intensity_00;
        info_45_45(i,14)    = info_45_45(i,13)/specular_intensity_4545;
        info_90_90(i,14)    = info_90_90(i,13)/specular_intensity_9090;
        info_135_135(i,14)  = info_135_135(i,13)/specular_intensity_135135;
        info_0_45(i,14)     = info_0_45(i,13)/specular_intensity_045;
        info_0_m45(i,14)    = info_0_m45(i,13)/specular_intensity_0m45;
        info_90_135(i,14)   = info_90_135(i,13)/specular_intensity_90135;
        info_90_m45(i,14)   = info_90_m45(i,13)/specular_intensity_90m45;
    end
    
    DOLP = DOLP';
    
    dolp_glass(:,k) = DOLP;
    
    save(matfile,'info_0_0','info_45_45','info_90_90','info_135_135','info_0_45','info_0_m45','info_90_135','info_90_m45','DOLP');

end

save('blackglass_measured.mat','dolp_glass');

end