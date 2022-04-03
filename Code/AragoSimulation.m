close all
clear
clc
objectRadius=1.0*10^7;
objectRadiusSquared=objectRadius^2;
distance=1.0*10^9;
distanceSquared=distance^2;
wavelength=632;
phase=0;
slitwidth=100000;
resolution1=500;
resolution2=500;
wave=zeros(resolution1+1,resolution2+1);
intensity=zeros(resolution1+1,resolution2+1);
x=zeros(resolution1+1,resolution2+1);
y=zeros(resolution1+1,resolution2+1);
xCounter=0;
outsideCounter=0;
% find intensity at every point on the screen
for x=-objectRadius:2*objectRadius/resolution1:objectRadius
xCounter=xCounter+1;
yCounter=0;
for y=-objectRadius:2*objectRadius/resolution2:objectRadius
yCounter=yCounter+1;
thetaSource=0;
% add contributions from N point sources
while thetaSource<2*pi
xSource=objectRadius*cos(thetaSource);
ySource=objectRadius*sin(thetaSource);
if y^2+x^2>objectRadiusSquared
outsideCounter=outsideCounter+1;
outsideX(outsideCounter)=xCounter;
outsideY(outsideCounter)=yCounter;
wave(xCounter,yCounter)=0;
thetaSource=2*pi;
else
r=sqrt(distanceSquared+(xSource-x)^2+(ySource-y)^2);
wave(xCounter,yCounter)=wave(xCounter,yCounter)+exp(1i*(2*pi/wavelength*r+phase))/r;
end
thetaSource=thetaSource+2*pi/100;
end
intensity(xCounter,yCounter)=abs(wave(xCounter,yCounter))^2;
end
end
maxIntensity=max(max(intensity));
minIntensity=min(min(intensity));
for n=1:1:length(intensity(:,1))
for k=1:1:length(intensity(1,:))
entered=0;
for p=1:1:length(outsideX)
if n==outsideX(p)&&k==outsideY(p)
intensity(n,k)=0;
entered=1;
end
end
if entered==0
intensity(n,k)=(intensity(n,k)-minIntensity)/(maxIntensity - minIntensity);
end
end
end
figure();
imshow(intensity)
xlabel('Screen Position')
ylabel('Normalized Intensity')