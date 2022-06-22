%EGR 690 Project Code
%Formula SAE Data Collection Project
%Example Code for Processing Data from RaceCapture Unit
%Written by Matthew Burns

close all;
clear all;
clc;

%Make sure the data file looks identical to the name you have below
%Your file should be in the matlab folder that this program is in
%Racecapture Pro 3 auto names datalogged files in the format 
%rc_0.log with each additional file on the SD card increasing by 1 so it will look
%like rc_0.log...rc_1.log...rc_2.log...rc_3.log...etc.

%get name of file into matlab
%edit the file name below to choose the file for analysis
datafile='rc_0.log';

%Pulls the information from the logged datafile into a matrix in matlab
Data = readmatrix(datafile);

%Need to match up the logged data columns correctly to their label
%First two columns are simple and are Interval and UTC time respectively
%and these do not change, next are the analog inputs
%If settings are changed in the RaceCapturePro then these column values
%will have to be updated to match
IntervalColumn = 1;
UTC_Column = 2;
Analog1Column = 3;
Analog2Column = 4;
Analog3Column = 5;
Analog4Column = 6;
Analog8Column = 7;
BatteryChargeColumn=8;
Accel_X_Column = 9;
Accel_Y_Column = 10;
Accel_Z_Column = 11;
Gyro_Yaw_Column = 12;
Gyro_Pitch_Column = 13;
Gyro_Roll_Column = 14;
G_Sum_Column = 15;
G_Sum_Max_Column = 16;
G_Sum_Pct_Column = 17;
RPM_Column = 18;
TPS_COlumn = 19;
InjectorPW_Column = 20;
IgnTiming_Column = 21;
Baro_Column = 22;
MAP_Column = 23;
Lambda_Column = 24;
IAT_Column = 25;
Coolant_Column = 26;
Latitude_Column = 27;
Longitude_Column = 28;
Speed_Column = 29;
Altitude_Column = 30;
GPSSats_Column = 31;
GPSQual_Column = 32;
GPSDOP_Column = 33;

%Unix Time Stamp
%Gives Start Time of Logging
%Will give a 31-December-1969 19:00:00 as start time if GPS does not have a
%signal

X=Data(1,2)/1000;
date_time = datetime(X,'ConvertFrom','posixtime','TimeZone','America/New_York');
fprintf('Start of Log Time is : ');
disp(date_time(1))


%Also default voltage positions of sensors must be established to
%understand which direction the sensor is moving and by how much.
%Set these values by taking one set of measurements when the vehicle is not
%moving and is simply stationary with the sensors attached. 
Analog1DefaultPosition=2.5;
Analog2DefaultPosition=2.5;
Analog3DefaultPosition=2.5;
Analog4DefaultPosition=2.5;

%get the number of logged data points
dataSize = size(Data);

%originalTime convertes uses the starting interval number as zero and counts up in ms
%until data logging stops. As such the start time is subtracted
%from each other interval time and divided by 1000 to give the interval 
%value in seconds
originalTime=Data(1,IntervalColumn);
xseries=(Data(:,1)-originalTime)/1000;

%Analog Sensor 1
figure('Name','Voltage Analog Input 1')
plot(xseries,Data(:,Analog1Column))
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Raw Voltage Data: Analog Input 1 (Front Right)');
yline(Analog1DefaultPosition);

figure('Name','Position Analog Input 1')
Y_MoveA1= (Data(:,Analog1Column) * 4)/5;
plot(xseries,Y_MoveA1);
yline((Analog1DefaultPosition*4)/5);
xlabel('Time(s)');
ylabel('Distance(in)');
title('Position Data Analog Input 1 (Front Right)');

%Analog Sensor 2
figure('Name','Voltage Analog Input 2')
plot(xseries,Data(:,Analog2Column))
yline(Analog2DefaultPosition);
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Raw Voltage Data: Analog Input 2 (Front Left)');

figure('Name','Position Analog Input 2')
Y_MoveA2= (Data(:,Analog2Column) * 4)/5;
plot(xseries,Y_MoveA2);
yline((Analog2DefaultPosition*4)/5);
xlabel('Time(s)');
ylabel('Distance(in)');
title('Position Data Analog Input 2 (Front Left)');

%Analog Sensor 3
figure('Name','Voltage Analog Input 3')
plot(xseries,Data(:,Analog3Column))
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Raw Voltage Data: Analog Input 3 (Rear Left)');
yline(Analog3DefaultPosition);

figure('Name','Position Analog Input 3')
Y_MoveA3= (Data(:,Analog3Column) * 4)/5;
plot(xseries,Y_MoveA3);
yline((Analog3DefaultPosition*4)/5);
xlabel('Time(s)');
ylabel('Distance(in)');
title('Position Data Analog Input 3 (Rear Left)');

%Analog Sensor 4
figure('Name','Voltage Analog Input 4')
plot(xseries,Data(:,Analog4Column))
yline(Analog4DefaultPosition);
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Raw Voltage Data: Analog Input 4 (Rear Right)');

figure('Name','Position Analog Input 4')
Y_MoveA4= (Data(:,Analog4Column) * 4)/5;
plot(xseries,Y_MoveA4);
yline((Analog4DefaultPosition*4)/5);
xlabel('Time(s)');
ylabel('Distance(in)');
title('Position Data Analog Input 4 (Rear Right)');

%%
%Accelerometer X-axis G-force
figure('Name','G Force X Axis');
plot(xseries,Data(:,Accel_X_Column))
xlabel('Time(s)');
ylabel('G Force(G)');
title('G Force X Axis');

%Accelerometer Y-axis G-force
figure('Name','G Force Y Axis');
plot(xseries,Data(:,Accel_Y_Column))
xlabel('Time(s)');
ylabel('G Force(G)');
title('G Force Y Axis');

%Accelerometer Z-axis G-force
figure('Name','G Force Z Axis');
plot(xseries,Data(:,Accel_Z_Column))
xlabel('Time(s)');
ylabel('G Force(G)');
title('G Force Z Axis');

%Gyro Yaw 
figure('Name','Gyro Yaw');
plot(xseries,Data(:,Gyro_Yaw_Column))
xlabel('Time(s)');
ylabel('Deg/Sec');
title('Gyro Yaw');

%Gyro Pitch 
figure('Name','Gyro Pitch');
plot(xseries,Data(:,Gyro_Pitch_Column))
xlabel('Time(s)');
ylabel('Deg/Sec');
title('Gyro Pitch');

%Gyro Roll
figure('Name','Gyro Roll');
plot(xseries,Data(:,Gyro_Roll_Column))
xlabel('Time(s)');
ylabel('Deg/Sec');
title('Gyro Roll');

%G Sum
figure('Name','G-Sum');
plot(xseries,Data(:,G_Sum_Column))
xlabel('Time(s)');
ylabel('G''s');
title('G Sum');

%Speed
%Note Elements with a slower refresh rate should use markers for indication
%as without them the graph will appear blank at first glance
figure('Name','Speed(mph)');
plot(xseries,Data(:,Speed_Column),'b*')
xlabel('Time(s)');
ylabel('Speed(mph)');
title('Speed Value');