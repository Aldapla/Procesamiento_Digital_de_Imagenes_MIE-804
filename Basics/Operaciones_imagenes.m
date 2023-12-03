% Operaciones con Imagenes
% By Daniel Alvarez


imagen1 = imread('peppers.png');   % Carga Imagen 1 que posee MATLAB
imagen2 = imread('cameraman.tif'); % Carga Imagen 2 que posee MATLAB

[height, width, ~] = size(imagen1);                    % Dimensión de Imagen 1
imagen2d = imresize(imagen2, [height, width]);         % Ajusta image2
imagenA = imagen1 + imagen2d;                          % Suma
 
intensidad = mean(mean(imagen2));    % Calcula el valor medio de la intensidad
if intensidad > 100                  % Condición
    angulo = 45;
else
    angulo = 75;
end
imagenB = imrotate(imagen2, angulo); % Rota la imagen

l = double (imagen1);     % Escoge la imagen 1 como 'l'
u = mean(mean(imagen1));  % Calcula la media de la imagen 1
des = std2(imagen1);      % Calcula la desviación estándar de la imagen 1

imagenC = (l - u) / des;  % Calcula la imagen C

subplot(2, 3, 1.5), imshow(imagen1), title('Imagen 1');
subplot(2, 3, 2.5), imshow(imagen2), title('Imagen 2');
subplot(2, 3, 4),   imshow(imagenA), title('Imagen A');
subplot(2, 3, 5),   imshow(imagenB), title('Imagen B');
subplot(2, 3, 6),   imshow(imagenC), title('Imagen C');

