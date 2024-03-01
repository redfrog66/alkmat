% Változók definiálása
a = 2;
t = 3;
k_minus = -3;
k_plus = 4;

% A szám, aminek a normalizált alakját szeretnénk meghatározni
szam = 0.15625;
% A szám normalizált alakjának meghatározása
szam_exponens = floor(log2(szam));
szam_mantissa = szam / 2^szam_exponens;

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

% A szám jobboldali szomszédjának meghatározása
% Először megkeressük a bináris szám utolsó '1'-esét
utolso_egyes_index = find(binaris_tort_resz == '1', 1, 'last');

% Ha az utolsó '1'-es a t. pozíciónál korábban van, akkor a t. pozícióra írunk egy '1'-est
if isempty(utolso_egyes_index) || utolso_egyes_index < t
    binaris_tort_resz(t) = '1';
else
    % Ha az utolsó '1'-es a t. pozíciónál később van, akkor a következő pozícióra írunk egy '1'-est
    binaris_tort_resz(utolso_egyes_index + 1) = '1';
end

% A szám jobboldali szomszédjának normalizált alakja
jobboldali_szomszed = [binaris_egesz_resz, '.', binaris_tort_resz];

% Eredmény kiírása
fprintf('A(z) %f szám jobboldali szomszédja: %s\n', szam, jobboldali_szomszed);

% A szám jobboldali szomszédjának visszaalakítása tizes számrendszerbe
egesz_resz_10 = bin2dec(binaris_egesz_resz);
tort_resz_10 = 0;
for i = 1:length(binaris_tort_resz)
    tort_resz_10 = tort_resz_10 + str2double(binaris_tort_resz(i)) * 2^(-i);
end
jobboldali_szomszed_10 = egesz_resz_10 + tort_resz_10 * 2^(-szam_exponens);

% Eredmény kiírása
fprintf('A(z) %f szám jobboldali szomszédja tizes számrendszerben: %.15f\n', szam, jobboldali_szomszed_10);