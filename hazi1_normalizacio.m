% Változók definiálása
a = 2;
t = 5;
k_minus = -3;
k_plus = 3;

% A szám, aminek a normalizált alakját szeretnénk meghatározni
szam = 1.5625;

% A szám egész és tört részének különválasztása
egesz_resz = floor(szam);
tort_resz = szam - egesz_resz;

% A szám egész részének átalakítása bináris formátumba
binaris_egesz_resz = dec2bin(egesz_resz);

% A szám tört részének átalakítása bináris formátumba
binaris_tort_resz = '';
while tort_resz > 0
    tort_resz = tort_resz * 2;
    if tort_resz >= 1
        binaris_tort_resz = [binaris_tort_resz, '1'];
        tort_resz = tort_resz - 1;
    else
        binaris_tort_resz = [binaris_tort_resz, '0'];
    end
end

% A szám normalizált alakjának meghatározása
normalizalt_szam = [binaris_egesz_resz, '.', binaris_tort_resz];

% Eredmény kiírása
fprintf('A(z) %f szám normalizált alakja: %s\n', szam, normalizalt_szam);