###################################################################
# Wade Callahan
# DAQ GUI
# This program is used for parsing through data and graphing the 
# desired data.
###################################################################

import numpy as np
import csv
from matplotlib import pyplot as plt 

# Change file name here
DAQ_File = "rc_0.log"
#################################################################################
# Open file
file = open(DAQ_File)
# Read in file
csvreader = csv.reader(file)
# Remove the header
header = next(csvreader)
# Place the date in rows
rows = []
for row in csvreader:
    rows.append(row)
# print(rows)
# Close the file
file.close()
##################################################################################
# Need to match up the logged data columns correctly to their label
# First two columns are simple and are Interval and UTC time respectively
# and these do not change, next are the analog inputs
# If settings are changed in the RaceCapturePro then these column values
# will have to be updated to match
##################################################################################
IntervalColumn = 0
UTC_Column = 1
Analog1Column = 2
Analog2Column = 3
Analog3Column = 4
Analog4Column = 5
Analog8Column = 6
BatteryChargeColumn=7
Accel_X_Column = 8
Accel_Y_Column = 9
Accel_Z_Column = 10
Gyro_Yaw_Column = 11
Gyro_Pitch_Column = 12
Gyro_Roll_Column = 13
G_Sum_Column = 14
G_Sum_Max_Column = 15
G_Sum_Pct_Column = 16
RPM_Column = 17
TPS_COlumn = 18
InjectorPW_Column = 19
IgnTiming_Column = 20
Baro_Column = 21
MAP_Column = 22
Lambda_Column = 23
IAT_Column = 24
Coolant_Column = 25
Latitude_Column = 26
Longitude_Column = 27
Speed_Column = 28
Altitude_Column = 29
GPSSats_Column = 30
GPSQual_Column = 31
GPSDOP_Column = 32

# Seperates the data into columns
col = np.transpose(rows)
print((col[UTC_Column]))

plt.title("Speed Vs Time")
plt.xlabel("Time")
plt.ylabel("Speed")
plt.plot(col[UTC_Column], col[0])
plt.show()




