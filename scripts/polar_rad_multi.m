%---------------------------------------------------------------
% Facultad de Ciencias, UNAM
% Semestre 2025-2
% Introduccion a la Acustica Contemporanea
% por: Edgar Munoz Sanchez
% --------------------------------------------------------------
% PRACTICA 6
% --------------------------------------------------------------
%Codigo para generar patrones de radiacion, espectros LZeq por cada angulo
%de medicion y grafica de desviaciones
% OBJETIVO: Obtener el patron de radiacion de una fuente sonora
% omnidireccional (FSO). 

clear; close all; clc;

% Archivo
filename = '..\data\processed\Data_29_mayo_2025.xlsx';

% Leer encabezados desde la primera fila
raw_header = readcell(filename);
labels_raw = raw_header(1, 12:29); % A partir de la 11va columna: frecuencias 100-5k

% Leer datos reales omitiendo las 2 primeras filas
data = readmatrix(filename, 'NumHeaderLines', 2);
azimut = deg2rad(data(:,1));     % ACIMUT en radianes
distancia = data(:,2);           % DISTANCIA
presiones = data(:, 12:29);      % Columnas LZeq*

% Calcular rlim comun
presion_min = min(presiones(:));
presion_max = max(presiones(:));
rlim_val = [0, 80];

% Crear carpeta
output_folder = '../figuras/polar';
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% Mapa de color (rojo a azul)
cmap = flipud(jet(size(presiones,2)));

% %% Grafica compuesta
disp("Graficando polar compuesta...")
fig = figure('Visible','off');
pax = polaraxes(fig);
hold(pax, 'on');
for i = 1:size(presiones,2)
    polarplot(pax, azimut, presiones(:,i), 'Color', cmap(i,:), 'LineWidth', 1.5);
end
rlim(pax, rlim_val);
title(pax, 'Patrones de radiacion 2D (todas las frecuencias)');
colormap(cmap);
cb = colorbar('Ticks', linspace(0,1,6), 'TickLabels', {'100Hz','200Hz', '400Hz', '800Hz', '1.6kHz','5kHz'});
cb.Label.String = 'Frecuencia';
cb.Location = 'eastoutside';
saveas(fig, fullfile(output_folder, '00_compuesto_polar.png'));
close(fig);

%% Graficas individuales
for i = 1:size(presiones,2)
    disp("Graficando polar...")
    label_raw = labels_raw{i};
    label_clean = strrep(label_raw, '_', '.');  % ejemplo: LZeq12.5Hz
    parts = regexp(label_clean, '(LZeq)\s*([0-9\.kK]+)', 'tokens');
    if ~isempty(parts)
        freq_label = parts{1}{2};
        label_display = sprintf('LZeq - %s', freq_label);
        filename_label = sprintf('LZeq-%s', freq_label);
    else
        label_display = label_clean;
        filename_label = label_clean;
    end

    fig_ind = figure('Visible','off');
    pax_ind = polaraxes(fig_ind);
    polarplot(pax_ind, azimut, presiones(:,i), 'LineWidth', 2, 'Color', cmap(i,:));
    rlim(pax_ind, rlim_val);
    title(pax_ind, sprintf('Patron de radiacion - %sHz', label_display), 'Interpreter', 'none');
    filename = sprintf('%02d_%sHz.png', i, filename_label);
    saveas(fig_ind, fullfile(output_folder, filename));
    close(fig_ind);
end

%% Crear carpeta para histogramas
hist_folder = '../figuras/histogram';
if ~exist(hist_folder, 'dir')
    mkdir(hist_folder);
end

%% Extraer solo los valores de frecuencia para etiquetas
label_ticks = cell(size(labels_raw));
for i = 1:length(labels_raw)
    str = strrep(labels_raw{i}, '_', '.');
    tokens = regexp(str, '([\d\.]+[kK]?[Hh]?[zZ]?)', 'match');
    if ~isempty(tokens)
        label_ticks{i} = tokens{1};
    else
        label_ticks{i} = str;
    end
end

%% Histograma general (promedio por frecuencia)
disp("Graficando espectro promedio...")
mean_vals = mean(presiones, 1);
fig_hist = figure('Visible','off');
bar(mean_vals, 'FaceColor', [0.3 0.8 0.7]);
xticks(1:length(label_ticks));
xticklabels(label_ticks);
xtickangle(90);
xlabel('Frecuencia (Hz)');
ylabel('LZeq promedio (dB)');
title('Promedio de presion por banda de frecuencia');
set(gca, 'FontSize', 8); % Etiquetas mas pequenas
grid on;
ylim([0, 80])
saveas(fig_hist, fullfile(hist_folder, 'histograma_promedios.png'));
close(fig_hist);

%% Histogramas individuales por angulo
for i = 1:length(azimut)
    disp("Graficando espectro...")
    az_deg = round(rad2deg(azimut(i)));
    fig_ind = figure('Visible','off');
    bar(presiones(i,:), 'FaceColor', [0.3 0.8 0.7]);
    xticks(1:length(label_ticks));
    xticklabels(label_ticks);
    xtickangle(90);
    xlabel('Frecuencia (Hz)');
    ylabel('LZeq (dB)');
    title(sprintf('Azimut %d°', az_deg));
    set(gca, 'FontSize', 8);
    grid on;
    ylim([0, 80])
    
    filename = sprintf('Azimut_%03ddeg.png', az_deg);
    saveas(fig_ind, fullfile(hist_folder, filename));
    close(fig_ind);
end

%% Graficar las desviaciones positivas y negativas 
clc; clear;

% Leer archivo
filename = '../data/processed/Data_29_mayo_2025.xlsx';

% Leer encabezados (frecuencias)
raw_labels = readcell(filename);

% Leer datos numericos
data = readmatrix(filename);
FSOspswcab = data(2:72, 8:28);  % Solo datos de LZeq por frecuencia
ef = data(1, 8:28);  % Desde la 3ra columna (frecuencias)

% Supongamos que FSOspswcab contiene 72 filas (angulos de 5°) y 21 columnas (bandas de 50 a 5000 Hz)
% Inicializacion
for m = 1:21
    % Promedio global por banda
    L360b(m) = mean(FSOspswcab(:, m)); 

    % Promedios por arco de 30°
    b = 1;
    for a = 1:11
        L30_ib(a,m) = mean(FSOspswcab(b:b+5, m));  % Cada arco abarca 6 datos (6x5° = 30°)
        b = b + 6;
        % Indice de Direccionalidad
        IDb(a,m) = L360b(m) - L30_ib(a,m);
    end

    % Maximos y minimos del ID por banda
    IDmaxb(m) = max(IDb(:,m));
    IDminb(m) = min(IDb(:,m));

    % Maximos y minimos por arco para cada banda
    MaxL30_ib(m) = max(L30_ib(:,m));
    MinL30_ib(m) = min(L30_ib(:,m));
end

% Desviaciones maximas respecto al promedio global
MaxLeqb = MaxL30_ib - L360b;
MinLeqb = MinL30_ib - L360b;

% Promedio general de la banda de 5000 Hz
PromZLeqb = mean(FSOspswcab(:,21));


% Limites ISO 140 (18 bandas) y 3382 (16 bandas)
lp140 = [ 2  2  2  2  2  2  2  2  2  5  8  8  8  8  8  8  8  8];
ln140 = -lp140;
lp3382 = [ 1  1  1  1  1  1  1  3  5  6  6  6  6  6  6  6];
ln3382 = -lp3382;

figure(1)
clf
hold on

% Frecuencias para ISO
f140 = ef(4:21);
f3382 = ef(5:20);

% Graficar limites ISO 140 (rojo)
h1 = plot(f140, lp140, 'r', 'LineWidth', 3); 
plot(f140, ln140, 'r', 'LineWidth', 3)

% Graficar limites ISO 3382 (negro)
h2 = plot(f3382, lp3382, 'k', 'LineWidth', 3);
plot(f3382, ln3382, 'k', 'LineWidth', 3)

% Graficar desviaciones experimentales (azul)
h3 = plot(ef, IDmaxb(1:21), 'b', 'LineWidth', 2);
plot(ef, IDmaxb(1:21), 'bo', 'LineWidth', 2)
plot(ef, IDminb(1:21), 'b', 'LineWidth', 2)
plot(ef, IDminb(1:21), 'bo', 'LineWidth', 2)
plot(ef,IDminb(1:21),'bo','LineWidth',2)
title('Desviacion del LZeq en las bandas de frecuencias',...
      'fontsize',12)
grid

% Configurar ejes logaritmicos
set(gca, 'XScale', 'log')
xticks(ef)
xticklabels(string(ef)) % Mostrar etiquetas de frecuencia como texto plano
xtickangle(90)
xlabel("Frecuencia [Hz]")
ylabel("Desviacion en dB")
% Agregar leyenda con solo una linea de cada tipo
legend([h3, h1, h2], {'Desviaciones experimentales', 'Norma ISO 140', 'Norma ISO 3382'}, ...
       'Location', 'southoutside', 'Orientation', 'horizontal', 'Box', 'off')
saveas(figure(1), 'desviaciones.png');
close(figure(1));
