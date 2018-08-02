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
subplot_row = 4;
subplot_col = 2;
subplot_entries = subplot_row*subplot_col;

% Legend
legend1 = legend('hide');
set(legend1,...
     'Position',[0.760680992230167 0.751042709291727 0.118343198475919 0.125105584825402],...
     'Box','off');
hold on

%% Plot 1 (Message signal)
ax1 = subplot(subplot_row,subplot_col,[1 2]);
hold on;
p1 = plot(t,message,...
    'Color',nice_red,...
	'LineWidth',line_thin,...
    'DisplayName','m(t)');
hold on;

% Axes and labels
ylabel('m(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);%,...
xlabel({'t \rightarrow','[seconds]'},...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t1 = title({strcat("Message signal ", p1.DisplayName), " "});

%% Plot 2 (Carrier signal)
ax2 = subplot(subplot_row,subplot_col,[3 4]);
hold on;

p2 = plot(t,carrier,...
    'Color',pastel_green,...
	'LineWidth',line_thin,...
    'DisplayName','c(t)');
hold on;

% Axes and labels
ylabel('c(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel({'t \rightarrow','[seconds]'},...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t2 = title({strcat("Carrier signal ", p2.DisplayName), " "});

%% Plot 3 (Modulated output)
ax3 = subplot(subplot_row,subplot_col,[5 6]);
hold on;

p3 = plot(t,modulated_signal,...
    'Color',pastel_blue,... 
    'DisplayName','u(t)',...
	'LineStyle','-',...
	'LineWidth',line_thin);
hold on

p3_a = plot(t,envelope1,...
    'Color',nice_red,... 
    'DisplayName','envelope',...
	'LineStyle',':',...
	'LineWidth',line_thin);
hold on

p3_b = plot(t,envelope2,...
    'Color',nice_red,... 
    'DisplayName','envelope',...
	'LineStyle',':',...
	'LineWidth',line_thin);
hold on

% Axes and labels
ylabel('u(t) \rightarrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel({'t \rightarrow','[seconds]'},...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t3 = title({strcat("Output modulated Signal ", p3.DisplayName); " "});

% Legend
legend3 = legend(ax3,'show',{p3.DisplayName,p3_a.DisplayName});
set(legend3,...
	'Orientation','horizontal',...
    'Location','south',...
    'Position',[0.451867363539147 0.31579955563624 0.0956213779781067 0.01956745623069],...
	'Box','off');
hold on

%% Plot 4 (Message frequency spectrum)
ax4 = subplot(subplot_row,subplot_col,7);
hold on;

p4 = plot(f,message_frequency,...
    'Color',pastel_purple,... 
    'DisplayName','M(f)',...
	'LineStyle','-',...
	'LineWidth',line_thin);
hold on

% Axes and labels
ylabel('M(f) \uparrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel({'f \rightarrow','[Hz]'},...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t4 = title({strcat("Message frequency ", p4.DisplayName); " "});

%% Plot 5 (Modulated Signal frequency spectrum)
ax5 = subplot(subplot_row,subplot_col,8);
hold on;

p5 = plot(f,modulated_frequency,...
    'Color',sky_blue,... 
    'DisplayName','U(f)',...
	'LineStyle','-',...
	'LineWidth',line_thin);
hold on

% Axes and labels
ylabel('U(f) \uparrow',...
    'FontName',fontName,...
    'FontSize',14);
xlabel({'f \rightarrow','[Hz]'},...
    'FontName',fontName,...
    'FontSize',14);

% Title and Annotations
t5 = title({strcat("Output frequency ", p4.DisplayName); " "});

%% Adjust figure
y_lim_c = [floor(min(carrier)) ceil(max(carrier))];
y_lim_m = [floor(min(message)) ceil(max(message))];
y_lim_u = [floor(min(modulated_signal)) ceil(max(modulated_signal))];
y_lim_f1 = [0 ceil(max(message_frequency))*1.05];
y_lim_f2 = [0 ceil(max(modulated_frequency))*1.05];

set([ax1 ax2 ax3 ax4 ax5],...
    'Box','off',...
    'XAxisLocation','origin',...
    'YMinorTick','off',...
    'XMinorTick','off',...
    'TickDir','both',...
    'TickLabelInterpreter','tex');

set([ax1 ax2 ax3],...
    'FontSize',12,...
    'XLim',[0 t(end)+(t(end)/numel(t)*100)],...
    'XTick',[0: t(end)/8 :t(end)]);

set(ax4,...
    'FontSize',12,...
    'YAxisLocation','origin',...
    'XLim',[f(1) f(end)]/100,...
    'XTick',[f(1): 2*f(end)/100 :f(end)]/10);

set(ax5,...
    'FontSize',12,...
    'YAxisLocation','origin',...
    'XLim',[f(1) f(end)]/2.5,...
    'XTick',[f(1): f(end)/10 :f(end)]/2.5);

set(ax1,'YLim',y_lim_m);
set(ax2,'YLim',y_lim_c);
set(ax3,'YLim',y_lim_u);
set(ax4,'YLim',y_lim_f1);
set(ax5,'YLim',y_lim_f2);

% xtickformat([ax1 ax2 ax3 ax4 ax5],'%g');
% ax1.XAxis.Exponent = 0;
% ax2.XAxis.Exponent = 0;
% ax3.XAxis.Exponent = 0;
% ax4.XAxis.Exponent = 0;
% ax5.XAxis.Exponent = 0;

ax1.XAxis.SecondaryLabel.Units='normalized';
ax1.XAxis.SecondaryLabel.Position = [0.972 0.5 0];
ax2.XAxis.SecondaryLabel.Units='normalized';
ax2.XAxis.SecondaryLabel.Position = [0.972 0.5 0];
ax3.XAxis.SecondaryLabel.Units='normalized';
ax3.XAxis.SecondaryLabel.Position = [0.972 0.5 0];

ax4.XAxis.Label.Units='normalized';
ax4.XAxis.Label.Position = [0.98 0.25 0];
ax5.XAxis.Label.Units='normalized';
ax5.XAxis.Label.Position = [0.98 0.25 0];

ax1.Position = FillAxesPos(ax1,0.98);
ax2.Position = FillAxesPos(ax2,0.98);
ax3.Position = FillAxesPos(ax3,0.98);
ax4.Position = FillAxesPos(ax4,1.1);
ax5.Position = FillAxesPos(ax5,1.1);

hold off;