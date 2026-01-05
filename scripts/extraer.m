% Ruta a la carpeta de archivos
input_folder = '../data/raw';
output_file = '../data/processed/med_29_mayo_2025_extract.xlsx';

% Hojas a procesar
sheet_names = {'Banda Ancha Total', 'Espectro Total', 'Configuración', 'LN Total'};

% Número de archivos
num_files = 72;

% Inicializar estructuras para almacenar datos por hoja
all_data = cell(size(sheet_names));

for s = 1:length(sheet_names)
    all_data{s} = [];  % Lista vacía para acumular datos de esta hoja
end

% Iterar sobre los archivos
for k = 1:num_files
    disp("Copiando...")
    filename = sprintf('Medición%03d.xlsx', k);
    filepath = fullfile(input_folder, filename);

    for s = 1:length(sheet_names)
        sheet = sheet_names{s};
        
        % Leer la hoja completa
        data = readcell(filepath, 'Sheet', sheet);
        
        if k == 1
            % Guardar encabezado + primera fila de datos
            all_data{s} = data;
        else
            % Agregar solo la fila de datos (segunda fila)
            all_data{s}(end+1, :) = data(2, :);
        end
    end
end

for s = 1:length(sheet_names)
    % Obtener la hoja
    data_clean = all_data{s};
    
    % Reemplazar todos los elementos 'missing' por texto vacío
    for r = 1:size(data_clean,1)
        for c = 1:size(data_clean,2)
            if ismissing(data_clean{r,c})
                data_clean{r,c} = '';
            end
        end
    end
% Escribir al archivo
    writecell(data_clean, output_file, 'Sheet', sheet_names{s}, 'WriteMode', 'overwrite');
end

disp('Extracción completada.');
