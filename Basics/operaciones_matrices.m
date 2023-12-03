% Operaciones con Matrices
% By Daniel Alvarez


arreglo = rand (1,9);              % genera un arreglo de 9 datos al azar entre el 0 y el 1
RUT = [2 0 5 6 8 2 4 5 7];         % Arreglo con los dígitos de RUT (1x9)

suma = RUT + arreglo;              % Suma al arreglo RUT el arreglo generado al azar
resta = RUT - arreglo;             % Resta al arreglo RUT el arreglo al azar
mult = RUT.* arreglo;              % Mutiplica el arreglo RUT con el arreglo gernerado al azar

matriz_r = [suma;resta;mult];      % Genera una Matriz con los resultados anteriores

columna5 = matriz_r (:, 5);        % Selecciona todas las filas con : y con un 5 se extrae la quinta columna
matriz_mod = [matriz_r, columna5]; % Agrega al final de la matriz anterior la columna 5 de esta misma

matriz_2x15 = reshape(matriz_mod, 2, 15);   % Convierte la matriz de un tamaño 2x10 a 2x15

matriz_rep = repmat(matriz_2x15, 100, 10);  % Repite la matriz
size (matriz_rep);                          % Para verificar que el tamaño sea correcto (200x150)

matriz_max5 = randi(5,200,150);              % Genera una matriz aleatoria de 200x150 con valores de máximo 5
resultado = matriz_rep + matriz_max5;        % Suma la matriz al azar con la anterior

imagesc (resultado)                         % Se visualiza la matriz como una imagen
title ("Imagen Generada", color = [0 0 1])  % Le da un título a la imagen con color azul



