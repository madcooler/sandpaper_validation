function dol

load('blacktape.mat');

groupNum = length( roisignal0 )/7

incidentAngle   = zeros(1, groupNum);
reflectionAngle = zeros(1, groupNum);

polariserAngle   = zeros(1, groupNum);
compensatorAngle = zeros(1, groupNum);

I = zeros(1, groupNum);
Q = zeros(1, groupNum);
U = zeros(1, groupNum);
DOLP = zeros(1, groupNum);

data = zeros(8, groupNum);

for i = 1 :groupNum
    indexBase = (i-1)*7 + 2;
    incidentAngle(i)   =  gl_angle(indexBase);
    reflectionAngle(i) =  gs_angle(indexBase);
    polariserAngle(i)  =  pl_angle(indexBase);
    compensatorAngle(i)=  co_angle(indexBase);
    
    I1 = roisignal0( indexBase     );
    I2 = roisignal0( indexBase + 1 );
    I3 = roisignal0( indexBase + 2 );
    I4 = roisignal0( indexBase + 3 );
    
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

data = data';

end