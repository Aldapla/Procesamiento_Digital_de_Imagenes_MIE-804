% Operaciones a la Imagen de Lena
% By Daniel Alvarez


% Parte 1

lena = imread('lena.bmp'); % Cargar la imagen "lena.bmp"

rojo = lena(30, 100, 1);   % Obtiene la intensidad del rojo
verde= lena(300, 150, 2);  % Obtiene la intensidad del verde
azul = lena(330, 400, 3);  % Obtiene la intensidad del azul

fprintf('Valor de intensidad para el rojo:  %d\n', rojo);  % Imprime el valor de rojo
fprintf('Valor de intensidad para el verde: %d\n', verde); % Imprime el valor de verde
fprintf('Valor de intensidad para el azul:  %d\n', azul);  % Imprime el valor de azul

grises= rgb2gray(lena);     % Convierte imagen a escala de grises

horizontal = flip(lena, 2); % Invierte la imagen horizontalmente

vertical = flip(lena, 1);   % Invierte la imagen verticalmente

% Muestra las Imagenes generadas en Parte 1
subplot(2, 2, 1), imshow(lena), title('Imagen Original');            
subplot(2, 2, 2), imshow(grises), title('Escala de Grises');
subplot(2, 2, 3), imshow(vertical), title('Invertido Verticalmente');
subplot(2, 2, 4), imshow(horizontal), title('Invertido Horizontalmente');

figure () % Separa en 1 ventana la Parte 1

%Parte 2

f = lena; % Crea variable f con la imagen original

% Definimos los parámetros con los distintos casos

% Caso 1
% En este caso los tonos oscuros se vuelven más claros,
% y los tonos claros se vuelven oscuros, con mapeo lineal
low_in = 0;           
high_in = 1;
low_out = 1;
high_out = 0;
gamma  = 1;

% Caso 2
% En este caso aumenta el contraste, lo que hace que,
% los tonos oscuros se hagan más visibles, mapeo lineal.
low_in2 = 0.5;
high_in2 = 0.75;
low_out2 = 0;
high_out2 = 1;
gamma2 = 1;

% Caso 3
% En este caso se oscurecen los oscuros y se aclaran,
% los claros, mapeo mayor, por lo que se realzan los cambios
low_in3 = 0;
high_in3 = 1;
low_out3 = 0;
high_out3 = 1;
gamma3 = 2;

% Aplicar imadjust 
g = imadjust(f, [low_in high_in], [low_out high_out], gamma);      
g2= imadjust(f, [low_in2 high_in2], [low_out2 high_out2], gamma2); 
g3= imadjust(f, [low_in3 high_in3], [low_out3 high_out3], gamma3);

% Muestra las Imágenes de Parte 2
subplot(2, 2, 1), imshow(f), title('Imagen Original');
subplot(2, 2, 2), imshow(g), title('Caso 1');
subplot(2, 2, 3), imshow(g2), title('Caso 2');
subplot(2, 2, 4), imshow(g3), title('Caso 3');

figure ()

% Encontramos los valores de ajuste utilizando stretchlim
low_high = stretchlim(f);

low_out4 = 0;
high_out4 = 1;

g4 = imadjust(f, low_high, [low_out4 high_out4]); % Aplica imadjust 

imshow(g4), title('Imagen con stretchlim');       % Muestra la imagen


