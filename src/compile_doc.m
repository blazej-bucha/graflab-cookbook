% Converts all "howto*.m" files from this directory to live scripts, PDF and
% HTML files.


clear;
clc;


latex_dir = '../docs/latex';
if exist(latex_dir, 'dir') ~= 7
    mkdir(latex_dir);
end


html_dir = '../docs/html';
if exist(html_dir, 'dir') ~= 7
    mkdir(html_dir);
end


howtos = dir("./howto*.m");
for n = 1:length(howtos)

    % Get the name of the m-file
    file = howtos(n).name;
    fprintf("Converting ""%s""...\n", file);


    % Convert to a live script
    [path, name, ext] = fileparts(file);
    mlx = [name '.mlx'];
    fprintf("   Live Script ""%s""...\n", mlx);
    try
        matlab.internal.liveeditor.openAndSave(file, mlx);
    catch
        fprintf("WARNING: Conversion failed!\n");
    end


    % PDF file
    pdf{n} = [latex_dir '/' name '.pdf'];
    fprintf("   PDF ""%s""...\n", pdf{n});
    try
        matlab.internal.liveeditor.openAndConvert(file, pdf{n});
    catch
        fprintf("WARNING: Conversion failed!\n");
    end


    % HTML file
    html = [html_dir '/' name '.html'];
    fprintf("   HTML ""%s""...\n", html);
    try
        matlab.internal.liveeditor.openAndConvert(file, html);
    catch
        fprintf("WARNING: Conversion failed!\n");
    end

    fprintf("\n");

end


pdf_merged = '../docs/latex/graflab-cookbook.pdf';
fprintf("Merging all PDFs to ""%s""\n", pdf_merged);
try
    mergePDFs(pdf, pdf_merged);
catch
    fprintf("WARNING: Merging failed!\n");
end


fprintf("Done.\n");


% Merges the pdf-Documents in the input cell array fileNames into one
% single pdf-Document with file name outputFile.  The code is taken from
% "https://de.mathworks.com/matlabcentral/fileexchange/89127-merge-pdf-documents"
function mergePDFs(fileNames, outputFile)
    memSet = org.apache.pdfbox.io.MemoryUsageSetting.setupMainMemoryOnly();
    merger = org.apache.pdfbox.multipdf.PDFMergerUtility;
    cellfun(@(f) merger.addSource(f), fileNames)
    merger.setDestinationFileName(outputFile)
    merger.mergeDocuments(memSet)
end
