function []=ApplyConstrastFilter()
 

%isufdgsodhfsdogj
prompt= 'Use "a" or "b" settings (a= for phantom/cage, b = for distortion mesh)?';
filtertype= inputdlg(prompt)
filtertype = char(filtertype)

%ASK user which directory contains the BMPs they would like convert into TIF
dirpath = uigetdir('C:\Users\Vivian\Google Drive\Project RSA\_RSA Trials');
cd(dirpath);
 files = dir('*.tif');
 


 
for k = 1:numel(files) %for each tif in directory:
	input_name = files(k).name
	[path, name, extension] = fileparts(input_name)
	output_name = fullfile(path, [name '.tif'])
	I= imread(input_name); 
	
		%for x-ray of phantom/cage
		if filtertype == 'a' 
			I=rgb2gray(I); %convert to grayscale
			Ia=imadjust(I,[.2 .5],[0 1] ); imshow(Ia);
			output_name = fullfile(path, [name 'filterA.tif'])
		end
		
		%for distortion meshes:
		if filtertype == 'b' 
		I=rgb2gray(I);  %convert to grayscale
		Ia=imadjust(I,[0 .6],[0 1],35);imshow(Ia);
			output_name = fullfile(path, [name 'filterB.tif'])
		end	
		
imwrite(Ia, output_name);
		
end

system(sprintf('explorer.exe "%s\"', dirpath)) %open directory for user after completion


