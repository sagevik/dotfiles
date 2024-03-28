# Python script for comparing two text files

import sys
import os
import time
from datetime import *

def main():

    fileA = ""
    fileB = ""

    if len(sys.argv) < 3:
        print("Specify two files to compare")
        exit()
    elif len(sys.argv) > 4:
        print("Use only two arguments")
        exit()
    else:
        fileA = sys.argv[1]
        fileB = sys.argv[2]

    if not fileA.endswith(".txt") and not fileB.endswith(".txt"):
        print("Can only open files of type .txt")
        exit()

    end = False
    for a in range(1,3):
        if not os.path.exists(sys.argv[a]):
            end = True
            print("%s does not exist" %sys.argv[a])
    if end:
        exit()

    print("Comparing %s and %s" %(fileA, fileB))

    file1 = open(fileA, 'r')
    file2 = open(fileB, 'r')

    fsd1 = []
    fsd2 = []
    for line1 in file1:
        fsd1.append(line1)

    for line2 in file2:
        fsd2.append(line2)

    for x in range(len(fsd1)):
        f1 = fsd1[x].strip("\n")
        f2 = fsd2[x].strip("\n")
        equal = (f1 == f2)
        if not equal:
            print("Line from %s: %s \nLine from %s: %s \nFiles equal: %s" %(
                  fileA, fsd1[x].strip("\n"), fileB, fsd2[x].strip("\n"), equal))

    file1.close()
    file2.close()
#---Functions---

def fileList(file_path):
    """
    Returns list of files in folder given by file_path
    """
    resultList = []
    for file in os.listdir(file_path):
        resultList.append(file_path + file)
    if not resultList:
        print ('No files')
    return resultList



def modification_date(filename):
    t = os.path.getmtime(filename)
    return datetime.fromtimestamp(t)



#---End Functions---

if __name__ == "__main__":
    main()
