szam = 1.23; % a szám, aminek a jobboldali szomszédját szeretnénk meghatározni
precizio = eps(szam); % a lebegőpontos számok precíziója
jobboldali_szomszed = szam + precizio; % a szám jobboldali szomszédja

% a num2sci függvény definíciója
num2sci = @(x) sprintf('%0.10f * 2^%d', frexp(x));

% a szám tudományos formában történő megjelenítése
tudomanyos_forma = num2sci(jobboldali_szomszed);