import os

cwd = os.getcwd()  # Get the current working directory (cwd)
files = os.listdir(cwd)  # Get all the files in that directory
print("Files in %r: %s" % (cwd, files))

#Reading file
file1 = open("ExampleData.txt", "r")
content = file1.read()
file1.close()
print("hello")
contentList = content.split("\n")

#Creating variable to hold values
print(contentList[1])
varList = [[0 for x in range(len(contentList))] for y in range(len(content))]
timeList = [0 for x in range (len(varList))]
rpmList = [0 for x in range (len(varList))]
susDispList = [0 for x in range (len(varList))]
battVoltList = [0 for x in range (len(varList))]

count: int = 0

#for loop through content_list for second split
#Add data to arrays using this loop
print("Printing VarlistT******")
for i in range(len(contentList)):
    varList = contentList[i].split(",") #split() returns ???

    if i == count:
        count += 1
        timeList[i] = varList[0]
        rpmList[i] = varList[1]
        susDispList[i] = varList[2]
        battVoltList[i] = varList[3]

    print("Time: " + str(timeList[i]))
    print("RPM: " + str(rpmList[i]))
    print("SUS: " + str(susDispList[i]))
    print("Voltage: " + str(battVoltList[i]))



print("Finish printing VarList********")
print("time")
print(varList[0])
# create graph of respective variables
