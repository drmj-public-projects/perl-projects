# Task Manager CLI — Project Summary

This small project is a command-line task manager written in Perl.
It allows users to manage a simple to-do list directly from the terminal using a text file for persistent storage.

--------------------------------------------------
MAIN PURPOSE
--------------------------------------------------

The application demonstrates:

- command-line argument handling
- file reading and writing
- conditional logic
- loops
- basic data persistence
- simple task state management

It is a beginner-friendly example of how to build a small CRUD-style console application.

--------------------------------------------------
FEATURES
--------------------------------------------------

1. Add Tasks

Users can create new tasks from the terminal.

Example:

    perl task.pl add "Buy groceries"

The task is appended to tasks.txt.

Stored format:

    0|Buy groceries

Where:

- 0 = incomplete
- 1 = completed

--------------------------------------------------

2. List Tasks

Users can display all stored tasks.

Example:

    perl task.pl list

Output:

    [1] [ ] Buy groceries
    [2] [X] Study Perl

Visual indicators:

- [ ] → pending
- [X] → completed

--------------------------------------------------

3. Mark Tasks as Completed

The extended "done" command updates a task’s status safely.

Example:

    perl task.pl done 2

This changes the task status from:

    0|Study Perl

to:

    1|Study Perl

--------------------------------------------------
FILE STORAGE SYSTEM
--------------------------------------------------

The application uses a plain text file:

    tasks.txt

Each line represents one task:

    status|task_description

Example:

    0|Buy groceries
    1|Finish homework

This lightweight approach avoids databases and keeps the project easy to understand.

--------------------------------------------------
TECHNICAL CONCEPTS DEMONSTRATED
--------------------------------------------------

The project teaches several important programming concepts in Perl:

1. Command-line arguments

Using:

    @ARGV

to receive user input from the terminal.

--------------------------------------------------

2. File handling

Using:

    open()
    close()

for reading and writing files.

--------------------------------------------------

3. String processing

Using:

    split()
    chomp()

to parse task data.

--------------------------------------------------

4. Conditional logic

Using:

    if / elsif / else

to determine which command to execute.

--------------------------------------------------

5. Loops

Using:

    while

to iterate through tasks.

--------------------------------------------------
SECURITY AND GOOD PRACTICES INCLUDED
--------------------------------------------------

The improved version follows safer programming practices:

- input validation
- numeric verification
- safe file handling
- existence checks
- separation of concerns
- defensive programming

Examples:

- preventing invalid task IDs
- preventing missing arguments
- handling file errors properly
- limiting split() operations safely

--------------------------------------------------
EDUCATIONAL VALUE
--------------------------------------------------

This project is useful for learning:

- backend fundamentals
- scripting
- terminal applications
- persistent storage
- state management
- procedural programming

It is also a good foundation for future improvements.

--------------------------------------------------
POSSIBLE FUTURE IMPROVEMENTS
--------------------------------------------------

The project could be extended with:

- delete task command
- edit task command
- task priorities
- due dates
- colored terminal output
- JSON storage
- SQLite integration
- object-oriented Perl
- unit testing
- logging
- interactive menu system

--------------------------------------------------
EXAMPLE WORKFLOW
--------------------------------------------------

    perl task.pl add "Learn Perl"
    perl task.pl add "Build CLI app"

    perl task.pl list

    perl task.pl done 1

    perl task.pl list

Final output:

    [1] [X] Learn Perl
    [2] [ ] Build CLI app

--------------------------------------------------
CONCLUSION
--------------------------------------------------

This project is a lightweight terminal-based task manager that demonstrates core Perl programming concepts through a practical real-world example. It combines file persistence, command processing, and task management in a simple but extensible architecture.