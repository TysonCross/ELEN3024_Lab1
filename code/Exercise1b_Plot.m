%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
phi = (1 + sqrt(5))/2;
ratio = 1.5*phi/3;
offset = [ scr(3)/8 scr(4)/8]; 
fig1 =  figure('Position',...                               % draw figure
        [offset(1) offset(2) scr(3)*ratio scr(4)*ratio]);
set(fig1,'numbertitle','off',...                            % Give figure useful title
        'name','Lab 1 - Exercise 1b',...
        'Color','white',...
        'Units','normalized');
fontName='Helvetica';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')  

%% Colors
nice_blue =     [ 0.180     0.180     0.900     0.6 ];
nice_green =    [ 0.180     0.900     0.180     0.6 ];
nice_cyan =     [ 0.180     0.900     0.900     0.6 ];
nice_yellow =   [ 0.900     0.900     0.180     0.6 ];
nice_red =      [ 0.900     0.180     0.180     0.6 ];
pastel_blue =   [ 0.0000    0.4470    0.7410    0.8 ];
pastel_orange = [ 0.8500    0.3250    0.0980    0.8 ];
pastel_yellow = [ 0.9290    0.6940    0.1250    0.8 ];
pastel_purple = [ 0.4940    0.1840    0.5560    0.8 ];
pastel_green =  [ 0.4660    0.6740    0.1880    0.8 ];
sky_blue =      [ 0.3010    0.7450    0.9330    0.8 ];
brick_red =     [ 0.6350    0.0780    0.1840    0.8 ];
                    
line_thin = 1;
line_thick = 2;
marker_size = 4;

%% Plot setup
subplot_row = 3;
subplot_col = 1;
subplot_entries = subplot_row*subplot_col;

% Legend
legend1 = legend('hide');
set(legend1,...
     'Position',[0.760680992230167 0.751042709291727 0.118343198475919 0.125105584825402],...
     'Box','off');
hold on

%% Plot 1
ax1 = subplot(subplot_row,subplot_col,1);
hold on;
p1 = plot(message,...
    'Color',pastel_blue,...
	'LineWidth',line_thin,...
    'DisplayName','m(t)');
hold on;

% Axes and labels
ylabel('m(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);%,...
label_x1 = xlabel('t \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t1 = title({strcat("Message signal ", p1.DisplayName), " "});

%% Plot 2
ax2 = subplot(subplot_row,subplot_col,2);
hold on;

p2 = plot(carrier,...
    'Color',pastel_orange,...
	'LineWidth',line_thin,...
    'DisplayName','c(t)');
hold on;

% Axes and labels
ly2 = ylabel('c(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel('t \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t2 = title({strcat("Carrier signal ", p2.DisplayName), " "});

%% Plot 3
ax3 = subplot(subplot_row,subplot_col,3);
hold on;

p3 = plot(modulated_signal,...
    'Color',nice_red,... 
    'DisplayName','u(t)',...
	'LineStyle','-',...
	'LineWidth',line_thin);
hold on

% Axes and labels
ly3 = ylabel('u(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel('t \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t3 = title({strcat("Modulated Signal ", p3.DisplayName); " "});

%% Adjust figure
y_lim = [double(floor(min(modulated_signal))) double(ceil(max(modulated_signal)))];
set([ax1 ax2 ax3],...
    'FontSize',14,...
    'Box','off',...
    'XAxisLocation','origin',...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickDir','both',...
    'TickLabelInterpreter','tex',...
    'XTick',[0:8*pi*10:2*pi*f_m],...
    'XTickLabel',{'0','80 \pi','160 \pi','240 \pi'},...
    'XLim',[0 2000],...
    'YLim',y_lim);

ax1.Position = FillAxesPos(ax1,0.98,-0.01);
ax2.Position = FillAxesPos(ax2,0.98,-0.01);
ax3.Position = FillAxesPos(ax3,0.98,-0.01);

hold off;