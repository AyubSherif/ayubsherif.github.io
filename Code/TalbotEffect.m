% Zachary Cotman
% Phy 5800
% Engineering Physics Capstone
% The Ohio State University
% 
% Talbot Carpet Simulator
% 11/15/2017

tic

clc

lam = 0.6328;

% Set up the positions of the emiters in the gratings
w = 10;
nGratings = 50;
wGratings = linspace(0,w,4*w);
dGratings = 2*w;    
n = 1:nGratings*length(wGratings);
for i = 1:nGratings
    for j = 1:length(wGratings)
        n(j+length(wGratings)*(i-1)) = wGratings(j) + (max(wGratings) + dGratings)*(i-1);
    end
end



k = 20;      % spacing of detectors relative to emittors

% emitter and detector positions
xs = n;
xd = (7/18)*max(n):1:(5/9)*max(n);

% distance between emitter and detector: one talbot distance
zt = 2*(dGratings+max(wGratings))^2/lam;

z = (1:1.5:zt);

%%
% Calculate the diffraction pattern at the detectors using
% Huygen's principle
e = zeros(length(z),length(xd));
parfor k = 1:length(z)
    
        r = ( z(k)^2 + (xd'-xs).^2' ).^(1/2);
        e(k,:) = sum( 1/2*(1+z(k)./r).*exp(-1j*2*pi/lam.*r) );

end


toc

% the talbot length
disp zt

%%
I = abs(e).^2;
for i = 1:length(z)
    I(i,:) = I(i,:)/norm(I(i,:));
end

% Print the image
figure()
imagesc(I)
colormap(gray)