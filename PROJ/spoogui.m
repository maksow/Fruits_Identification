%om  shri ganeshayaa namah
function spoogui
 figure('ColorMap',gray);
   
 
%%%  Txt = uicontrol('Style','Text','Position',[20,100,60,20]);
Txt = uicontrol('Style','Text','Position',[20,350,200,20]);
Txt1 = uicontrol('Style','Text','Position',[280,250,200,200]);


  SelectImage = uicontrol('Style','PushButton','String','Select Image','Position',[20,300,200,20],...
    'CallBack', @selectImagepressed);

  DetectImage= uicontrol('Style','PushButton','String','Detect Image','Position',[20,280,200,20],...
    'CallBack', @detectImagepressed);

  %%ToggleButton = uicontrol('Style','ToggleButton','String','Off','Position',[100,60,60,20],...
 %%   'CallBack', @ToggleButtonPressed);

  %%uicontrol('Style','PushButton','String','Close','Position',[100,20,60,20],...
  %%  'CallBack','close');
a1='apple.jpg';
window1=[280,250,200,200];
  
i1=imread(a1);
imshow(i1);



%  a1=imread('apple.jpg');
%   a1re=imresize(a1,[50,50]);
%  uicontrol('Style',imshow(a1re),'Position',[280,250,200,200])

% function ViewBox1(hObject, eventdata, handles)
% axes(handles.ViewBox1);
% imshow('apple.jpg')
% end;

 function ToggleButtonPressed(h, eventdata)

    if get(ToggleButton, 'Value') == 0
      set(ToggleButton, 'String', 'Off');
    else
      set(ToggleButton, 'String', 'On');
    end;  
  end;  

 
 
 
  function selectImagepressed(h, eventdata)
    set(Txt, 'String', 'Select Image');
  end;  
    
  function detectImagepressed(h, eventdata)
    set(Txt, 'String', 'Detect Image');
  end;  
  
  
  
  
  function [] = pb_call(varargin)
% Callback for the pushbutton.
S = varargin{3};  % Get the structure.
switch get(S.R,'visible')
    case 'on'
        st = 'off';
    case 'off'
        st = 'on';
    otherwise
        close(S.fh)  % It would be very strange to end up here.
        error('An unknown error occured in the callback')
end;
  end;

end
