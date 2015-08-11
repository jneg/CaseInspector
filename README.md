# CaseInspector
Script that verifies all test cases provided are valid.

This program takes two arguments:

1. Executable to test
2. Test directory

Example: ./CaseInspector.sh testExec tests

The executable must be a valid program with executable permissions.
The test directory can be path relative to the current directory, or an absolute path.

Each test case is a pair of .in file and .out file of equivalent base name.

The script will run through every .in file in the directory, and ensure that there is a designated .out file with the same base name. If so, it will run the program with the input from the designated .in file and diff it against its desired .out file. If the test case passes, no diff will be printed, otherwise the diff will be printed.
