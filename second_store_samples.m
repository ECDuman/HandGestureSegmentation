% stores each signature sample in a values folder as mat file
  clear all;clc;
% path for writing values of samples
  global DIAGPATH
  DIAGPATH = 'values';
  
% load the user info
  load('UserInfo'); 
  NoSbj=size(id,1);

% location of data 
  DataLoc = 'C:\Users\me95\PHD-WORK\DOWNLOADED_BIOSECURE_DS2_SIG\';

% read ans store
  for i=1:NoSbj
      if i==1
       SmpNames=cell(size(1));
      end
      % location of person
      SbjLoc=char(strcat(DataLoc,'user',id(i,1)));
      for j=1:2
          % session of person
          SesLoc=[SbjLoc,'\session000',int2str(j),'\*.svc'];
          SesLoc2=[SbjLoc,'\session000',int2str(j),'\'];
          filelist = dir(SesLoc);
          SmpNamesx={filelist.name};
          SmpNamesx = sort_nat(SmpNamesx);
          SmpNames=cat(2, SmpNames,SmpNamesx);%store all names to one array
          NoOfSmp= size(SmpNamesx,2);
          for k=1:NoOfSmp
              loc=[SesLoc2,'\',char(SmpNamesx(k))];
              file = fopen(loc,'r');
              [col1,col2,col3 ,col4 ,col5 ,col6 ,col7 ] = textread(loc);
              % first row which indicates the number of rows in a file
              x=col1(1,1); 
              % take out first row which indicates the number of rows in a file
              col1=col1(2:x+1,:);col2=col2(2:x+1,:);col3=col3(2:x+1,:);col4=col4(2:x+1,:);col5=col5(2:x+1,:);col6=col6(2:x+1,:);col7 =col7(2:x+1,:);
              fclose(file);
              SmpValues = [col1,col2,col3,col4,col5,col6,col7];
              savefile =[char(SmpNamesx(k)),'-Values.mat'];
              w = cd;
              cd(DIAGPATH);
              save (savefile,'SmpValues'); % save data as mat file 
              cd(w);
          end
      end
  end
  SmpNames=SmpNames(1,2:end)';
  save SampleInfo SmpNames
  
%--------------------------------------------------------------------------



  








