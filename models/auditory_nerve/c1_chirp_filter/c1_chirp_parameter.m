%--Calculate the constant parameters for the C1 filter, including initial pole/zero locations, shifting constants, and gain constants
function [order_of_zero, fs_bilinear, CF, preal, pimag, C1initphase, norm_gainc1] = c1_chirp_parameter(cf, tdres, taumax)
    order_of_pole    = 10; 
    
    % Setup locations of poles and zeros
    sigma0 = 1/taumax;
    ipw    = 1.01*cf*2*pi-50;
    ipb    = 0.2343*2*pi*cf-1104;
    rpa    = 10^(log10(cf)*0.9 + 0.55)+ 2000;
    pzero  = 10^(log10(cf)*0.7+1.6)+500;

    half_order_pole  = order_of_pole/2;
    order_of_zero    = half_order_pole;

    fs_bilinear = 2*pi*cf/tan(2*pi*cf*tdres/2);
    rzero       = -pzero;
    CF          = 2*pi*cf;

    preal = zeros(11,1);
    pimag = zeros(11,1);

    preal(1) = -sigma0;
    preal(5) = preal(1) - rpa;
    preal(3) = (preal(1) + preal(5))/2;
    preal(7) = preal(1);
    preal(9) = preal(5);
    preal(2) = preal(1);
    preal(4) = preal(3);
    preal(6) = preal(5);
    preal(8) = preal(2);
    preal(10) = preal(6);

    pimag(1) = ipw;
    pimag(5) = pimag(1) - ipb;
    pimag(3) = (pimag(1) + pimag(5))/2;
    pimag(7) = pimag(1);
    pimag(9) = pimag(5);
    pimag(2) = -pimag(1);
    pimag(4) = -pimag(3);
    pimag(6) = -pimag(5);
    pimag(8) = pimag(2);
    pimag(10) = pimag(6);

    % Calculate initial phase
    C1initphase = 0.0;
    for i = 1:half_order_pole
        C1initphase = C1initphase + atan(CF/(-rzero))-atan((CF-pimag(2*i-1))/(-preal(2*i-1)))-atan((CF+pimag(2*i-1))/(-preal(2*i-1)));
    end

    % Normalize the gain
    C1gain_norm = 1.0;
    for i = 1:order_of_pole
        C1gain_norm = C1gain_norm*((CF-pimag(i))^2 + (preal(i))^2);
    end

    norm_gainc1 = (sqrt(C1gain_norm))/((sqrt(CF^2+rzero^2))^order_of_zero);