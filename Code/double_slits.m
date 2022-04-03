close all
clear
clc
screenlength=5000000;   

distance=3*10^7;
wavelength=632;
slitwidth=10000;
slitseparation=50000;
resolution=5000;
wave=zeros(1,resolution);
intensity=zeros(1,resolution);
counter=0;
% find intensity at every point on the screen
for x=1:screenlength/resolution:screenlength
     counter=counter+1;
     % add contributions from 1000 point sources for slit 1
     for n=screenlength/2-slitwidth/2-slitseparation/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation/2
         r=sqrt(distance^2+(x-n)^2);
         wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
     end
%       for n=screenlength/2-slitwidth/2-slitseparation*3/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*3/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%       for n=screenlength/2-slitwidth/2-slitseparation*5/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*5/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%       for n=screenlength/2-slitwidth/2-slitseparation*7/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*7/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%       for n=screenlength/2-slitwidth/2-slitseparation*9/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*9/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%        for n=screenlength/2-slitwidth/2-slitseparation*11/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*11/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%        end
%        for n=screenlength/2-slitwidth/2-slitseparation*13/2:slitwidth/1000:screenlength/2+slitwidth/2-slitseparation*13/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
     % add contributions from 1000 point sources for slit 2
     for n=screenlength/2-slitwidth/2+slitseparation/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation/2
         r=sqrt(distance^2+(x-n)^2);
         wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
     end
%       for n=screenlength/2-slitwidth/2+slitseparation*3/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*3/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%       for n=screenlength/2-slitwidth/2+slitseparation*5/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*5/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%       for n=screenlength/2-slitwidth/2+slitseparation*7/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*7/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%       end
%      for n=screenlength/2-slitwidth/2+slitseparation*9/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*9/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%      end
%      for n=screenlength/2-slitwidth/2+slitseparation*11/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*11/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%      end
%      for n=screenlength/2-slitwidth/2+slitseparation*13/2:slitwidth/1000:screenlength/2+slitwidth/2+slitseparation*13/2
%          r=sqrt(distance^2+(x-n)^2);
%          wave(counter)=wave(counter)+exp(1i*2*pi/wavelength*r)/r;
%      end
     intensity(counter)=abs(wave(counter))^2;
end


% max=max(intensity);
% min=min(intensity);
% for n=1:1:length(intensity)
%     intensity(n)=(intensity(n)-min)/(max-min);
% end
% n=0;
%while n<length(intensity)
%    n=n+1;
%     if intensity(n)>.001
%         if n>5
%            start=n-5;
%         else
%            start=1;
%         end
%         n=length(intensity);
%     end
%end
% n=length(intensity);
% while n>0
%      n=n-1;
%      if intensity(n)>.001
%          if n<=length(intensity)-5
%             stop=n+5;
%          else
%             stop=length(intensity);
%          end
%          n=0;
%      end
% end
figure()
plot(intensity)

 xlabel('Screen Position')
 ylabel('Intensity')