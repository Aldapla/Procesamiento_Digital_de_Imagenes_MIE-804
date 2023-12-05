% Programa para calcular el tiempo de cada tecnica

% Pasos Previos

lena = imread('Lena.bmp');                 % Cargar la imagen de Lena
lenita = imresize(lena, [100, 100]);       % Redimensionar a 100x100 pixeles
M = 100;                                   % Dimensiones de la imagen
N = 100;                                   % Se trabaja en 100 x 100
lena_dft = zeros(M, N);                    % Inicializar matriz para almacenar la DFT

% Tecnica 1: Implementación DFT
tic; % Inicia temporizador
for u = 1:M
    for v = 1:N
        suma = 0;
        for x = 1:M
            for y = 1:N
                suma = suma + double(lenita(x, y)) * exp(-1i*2*pi*((u-1)*(x-1)/M + (v-1)*(y-1)/N));
            end
        end
        lena_dft(u, v) = suma;
    end
end
lena_dft_ordenada  =  fftshift(lena_dft);
tiempo_dft = toc; % Detiene temporizador y guarda el tiempo

% Tecnica 2: Implementacion de la Transformada de Fourier por Descomposicion Fila-Columna

tic; % Iniciar temporizador
fc1 = zeros(M, N);
fc2 = zeros(M, N);

for u = 1:M
    for v = 1:N
        suma = 0;
        for x = 1:N
            suma = suma + double(lenita(u, x)) * exp(-1i*2*pi*(v-1)*(x-1)/N);
        end
        fc1(u, v) = suma;
    end
end

for u = 1:M
    for v = 1:N
        suma = 0;
        for y = 1:M
            suma = suma + fc1(y, v) * exp(-1i*2*pi*(u-1)*(y-1)/M);
        end
        fc2(u, v) = suma;
    end
end
lena_fc_ordenada   =  fftshift(fc2);
tiempo_fc = toc; % Detener temporizador y guardar tiempo

% Técnica 3: FFT2 de MATLAB

tic; 
lenita_gris = rgb2gray(lenita);            % Convertir a escala de grises
lena_fft2 = fft2(lenita_gris);             % Calcular la DFT usando FFT2
lena_fft2_ordenada =  fftshift(lena_fft2); 
tiempo_fft2 = toc; 

% Visualización de las imágenes

figure ('Name','Transformadas de Fourier')
subplot(2,2,1), imshow(log(1 + abs(lena_dft_ordenada)), []),  title('Implementacion DFT');
subplot(2,2,2), imshow(log(1 + abs(lena_fc_ordenada)), []),   title('DFT Descomposicion Fila-Columna');
subplot(2,2,3.5), imshow(log(1 + abs(lena_fft2_ordenada)), []), title('DFT con FFT2 de MATLAB');

% Mostrar tiempos
disp(['Tiempo DFT: ', num2str(tiempo_dft), ' segundos']);
disp(['Tiempo Fila-Columna: ', num2str(tiempo_fc), ' segundos']);
disp(['Tiempo FFT2 MATLAB: ', num2str(tiempo_fft2), ' segundos']);
