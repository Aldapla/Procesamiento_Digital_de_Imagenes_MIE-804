% Procesamiento digital de imagenes
% By Daniel Alvarez




% Paso Previo
cebrita = imread('cebrita.png');      % Carga la imagen
cebrita_gris = rgb2gray(cebrita);      % Convierte la imagen a escala de grises

% 1.- Operaciones de derivada de primer orden

% a) Primera Derivada

dx = [-1, 0, 1];                            % Mascara        
dy = [-1; 0; 1];                           
deri_x = imfilter(cebrita_gris, dx, 'conv'); % Calcula las derivada en x 
deri_y = imfilter(cebrita_gris, dy, 'conv'); % Calcula las derivada en y

% b) Prewitt

[dx_prewitt, dy_prewitt] = imgradientxy(cebrita_gris, 'prewitt'); % Calcula con Prewitt

% c) Sobel

[dx_sobel, dy_sobel] = imgradientxy(cebrita_gris, 'sobel');       % Calcula con Sobel


% Cuáles son sus Diferencias?

% Los tres metodos utilizados buscan resaltar los cambios de intensidad
% de la imagen para asi poder resaltar los bordes, la principal diferencia
% radica en las mascaras que utilizan, es decir en las matrices que son
% utilizadas para calcular la derivada, siendo la primera una simple que
% esta definida y las otras dos mas complejas.


% 2.- Metodo LoG enfoque Marr-Hildreth

% Filtro Gaussiano
umbral = 0.5;                     % Umbral
kerntam = 2 * ceil(3 * umbral) + 1; % Tamaño del kernel gaussiano
gaus_kernel = fspecial('gaussian', kerntam, umbral);
im_suave = imfilter(cebrita_gris, gaus_kernel, 'conv');

umbrala = 2;                     % Umbral
kerntama = 2 * ceil(3 * umbrala) + 1; % Tamaño del kernel gaussiano
gaus_kernela = fspecial('gaussian', kerntama, umbrala);
im_suavea = imfilter(cebrita_gris, gaus_kernela, 'conv');

umbralb = 10;                     % Umbral
kerntamb = 2 * ceil(3 * umbralb) + 1; % Tamaño del kernel gaussiano
gaus_kernelb = fspecial('gaussian', kerntamb, umbralb);
im_suaveb = imfilter(cebrita_gris, gaus_kernelb, 'conv'); 

% Operador Laplaciano
laplaciano = fspecial('laplacian', 0);
imagen_lapl = imfilter(im_suave, laplaciano, 'conv');

laplacianoa = fspecial('laplacian', 0);
imagen_lapla = imfilter(im_suavea, laplacianoa, 'conv');

laplacianob = fspecial('laplacian', 0);
imagen_laplb = imfilter(im_suaveb, laplacianob, 'conv');

% Análisis de resultados con distinto Umbral

% Al probar con 3 distintos umbrales, se puede observar que mientras mayor sea este mismo
% la imagen se ve mas desenfocada al suavizarse y ademas, los bordes si
% bien se ven mas resaltados, va perdiendo precision a medida que se
% aumenta, lo que hace que se vaya dejando de distinguir bien.


% Ver Imagenes

% Primera Derivada
figure('Name','Primera Derivada');

subplot(2, 2, 1), imshow(cebrita_gris), title('Imagen Original');
subplot(2, 2, 2), imshow(deri_x),title('Derivada');
subplot(2, 2, 3), imshow((deri_x+deri_y),[]),title('Suma de Derivadas');
subplot(2, 2, 4), imshow((deri_x.^2 + deri_y.^2), []),title('Magnitud'); % Calcula Magnitud

% Prewitt
figure('Name','Prewitt');

subplot(2, 2, 1), imshow(cebrita_gris), title('Imagen Original');
subplot(2, 2, 2), imshow(dx_prewitt),title('Derivada (Prewitt)');
subplot(2, 2, 3), imshow((dx_prewitt + dy_prewitt),[]),title('Suma de Derivadas (Prewitt)');
subplot(2, 2, 4), imshow(sqrt(dx_prewitt.^2 + dy_prewitt.^2), []),title('Magnitud (Prewitt)'); % Calcula Magnitud

% Sobel
figure('Name','Sobel');

subplot(2, 2, 1), imshow(cebrita_gris), title('Imagen Original');
subplot(2, 2, 2), imshow(dx_sobel),title('Derivadas (Sobel)');
subplot(2, 2, 3), imshow((dx_sobel + dy_sobel),[]),title('Suma de Derivadas (Sobel)');
subplot(2, 2, 4), imshow(sqrt(dx_sobel.^2 + dy_sobel.^2), []),title('Magnitud (Sobel)'); % Calcula Magnitud


% Comparación de Umbral
figure('Name','LoG Marr-Hildreth'), title('Comparación Umbral')

% 0.5
subplot(2, 3, 1), imshow(im_suave), title('Imagen Suavizada');
subplot(2, 3, 4), imshow(imagen_lapl,[]), title('LoG');
% 5
subplot(2, 3, 2), imshow(im_suavea), title('Imagen Suavizada a');
subplot(2, 3, 5), imshow(imagen_lapla,[]), title('LoG a');
% 50
subplot(2, 3, 3), imshow(im_suaveb), title('Imagen Suavizada b');
subplot(2, 3, 6), imshow(imagen_laplb,[]), title('LoG b');
