function plotComparison30Degrees(index)

% index = 5;
plotAverageIntensity = 0;

dot = './'



if index == 1
    src = 'coated_tape_data';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_coated_tape_ia30.mat'];
    str_measured =[loc,'coated_tape_ia30_new.mat'];
    range = [1:7];
    x_imp = [15 20 25 30 35 40 45];
    x = [15 20 25 30 35 40 45];
end


dolp_pos = 12;

if index == 2
    src = 'coated_tape_depolarising0.2_data';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_coated_tape_dp0.2_ia30.mat'];
    str_measured =[loc,'coated_tape_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
end

if index == 3
    src = 'uncoated_tape_depolarising_data';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_uncoatedtape_depolarising_ia30.mat'];
    str_measured =[loc,'uncoated_tape_ia30_fixed.mat'];
end

if index == 0
    src = 'uncoated_tape_data';
    loc = [dot,src,'/'];
    str_imp      = [loc,'imp_uncoated_tape_ia30.mat'];
    str_measured = [loc,'uncoated_tape_ia30_new.mat'];
    range = [1:7];
    x_imp = [15 20 25 30 35 40 45];
    x = [15 20 25 30 35 40 45];
end

if index == 5
    src = 'coated_sandpaper_c1000_data';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_coated_sandpaper_ia30.mat'];
    str_measured =[loc,'coated_sandpaper_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
    x = [15 20 25 30 35 40 45]
end


if index == 6
    src = 'uncoated_sandpaper_c1400_data dp0';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_uncoated_sandpaper_ia30.mat'];
    str_measured =[loc,'sandpaper_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
    x = [15 20 25 30 35 40 45]
end

if index == 4
    src = 'glass_data';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_glass_ia30.mat'];
    str_measured =[loc,'glass_ia30.mat'];
    x = [30]
    x_imp = [30]
    range = [1]
end

if index == 8
    src = 'diffuse_gold_roughness1.0_m10';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_diffuse_gold_roughness1.2_ia30.mat'];
    str_measured =[loc,'coated_sandpaper_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
    x = [15 20 25 30 35 40 45]
    
end

if index == 9
    src = 'singlefacet_dp0.5_gold';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_sf_dp0.5_ia30.mat'];
    str_measured =[loc,'coated_sandpaper_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
    x = [15 20 25 30 35 40 45]
    
end

if index == 10
    src = 'singlefacet_r_0.1_dp0.5_gold';
    loc = [dot,src,'/'];
    str_imp      =[loc,'imp_sf_r0.1_dp0.5_ia30.mat'];
    str_measured =[loc,'coated_tape_ia30.mat'];
    range = [1:31];
    x_imp = [15:1:45];
    x = [20 25 30 35 40];
    
end

filename = [src,'_DOLP_comparison_ia30'];

file     = [loc,filename,'.png'];
file_fig = [loc,filename,'.fig'];
load(str_imp);
load(str_measured);

plotDOLP(str_imp,str_measured,file,file_fig,range,x_imp,x,dolp_pos,plotAverageIntensity);


end