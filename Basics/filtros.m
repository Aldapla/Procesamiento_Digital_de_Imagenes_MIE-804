% Filtros a imagnes
% By Daniel Alvarez

ig = imread('test3.bmp'); % Cargar la imagen "test3.bmp"

grises= rgb2gray(ig);     % Convierte imagen a escala de grises

% Filtro Receptivo de Contorno, permite detectar los bordes de los objetos de la imagen 

filtro = [-1 -1 -1; -1 8 -1; -1 -1 -1];      % Valores del filtro 
conv_ig = conv2(grises, filtro, 'same');     % Se realiza una convolución mediante la función conv2 (2D)
umbral = 110;                                % Se le da un valor al umbral, para obtener una imagen binaria
campoig= conv_ig > umbral;                   % Compara elemento a elemto entre con_ig y umbral para obtener una imagen binaria

% El resultado representa los bordes de los objetos que se encuentran en la
% imagen, esto lo logra a través de una convolución

% Filtro Complejo
                        
filtro_c = [0 -1 -1 -1 0; -1 -3 5 -3 -1; -1 5 4 5 -1; -1 -4 4 -4 -1; 0 -2 7 -2 0; 0 -1 -1 -1 0]; % Valores del filtro
conv_ig2 = conv2(grises, filtro_c, 'same');                                                      % Se realiza una convolución
campoig2= conv_ig2 > umbral;                                                                     % Se umbraliza para obtener una imagen binaria

% Encontrar los máximos
[maxx1, maxy1] = max(conv_ig2(:));       % Asigna valor
[max2, maxi2] = find(conv_ig2 == maxx1); % Busca las posiciones

% Mostrar las imagenes solicitadas
figure('Name', 'Imágenes a Procesar')
subplot(1, 2, 1), imshow(ig), title('Imagen Original');      % Imagen Original       
subplot(1, 2, 2), imshow(grises), title('Imagen de Grises'); % Imagen en grises

figure('Name', 'Campos Receptivos') 
subplot(1, 2, 1); imshow(conv_ig), title('Campo Receptivo Simple');        % Imagen Campo Receptivo Simple
subplot(1, 2, 2), imshow(campoig2), title('Campo Receptivo Complejo'); % Imagen del Campo Receptivo Complejo

figure('Name', 'Campo Reflectivo con Marca')
imshow(campoig2, []), title('Campo Receptivo Complejo Marcado'); % Imagen del Campo Receptivo Complejo

hold on;                                                 % Superpone la gráfica y la imagen
plot(maxi2, max2, 'rx','MarkerSize', 30);                % Marca con una X roja lo solicitado
hold off;

