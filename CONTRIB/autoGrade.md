	The purpose of this assignment is to facilitate testing of student homework solutions for IFT383. Software testing is a huge part
of the software development lifecyle, and although not the most exciting aspect, is integral for developing workable software. The larger a
project gets, the more complext it becomes, and the easier it is to overlook all pathways during development. 

	One method of software development is called test driven development, where the developer writes a series of tests, and continues to make 
changes to the program until those tests are passed. The developer then writes more tests, and continues the process until the product
is completed. Although this may be a verbose process, it could be a valuable tool for students, as it makes it easier for them to thoroughly 
check over their work as their work progresses without much marginal effort.
	To use the script, the user only needs to navigate to the desired assignment using their browser, open their browser's developer console,
run the script, and follow the on screen instructions. The script will prompt the user to copy/paste javascript code into their browser's developer console,
so that each essay-style question will be downloaded, moved, and converted to the appropriate file type. The script then cleans up after itself, and runs
the student's solutions against what the expected output should be using Linux's diff command. One of the nice aspects of how the script is designed,
is that there is no need to worry about specific naming conventions to automatically grade (only line formatting, but this could in theory be worked
around by using a program's readline function and format line by line). Another nice aspect of how this script is designed is that it can uses "black
box" testing (you only worry about what goes in and comes out) and should only pass/fail.
	I went about designing my script in various iterations, considering a few of the problems I wanted to solve along the way. The first problem was
not wanting to have to copy and paste each solution into individual files. Curl could (in theory) be a solution to this, and then parsing the downloaded
html file for the desired content, but there were too many considerations involving authentication in Canvas and making sure that the correct assignment
was selected. The obvious solution was to use javascript to select the appropriate element(s) from an assignment page's DOM. From there each desired
element can be downloaded on the the local filesystem. Due to security concerns, you can't simply add your own pre-defined javascript functions to just
any webpage, so I decided to have the user copy/paste the script into thier browser's developer console.
	The next steps were to move and convert the downloaded txt files into the desired filetype. Fortunately, predicting the filetype needed for each
assignement is pretty easy. Once that was complete, the scripts merely needed to be compared against expected solutions-- many of which aren't possible
to do without violating academic integrity (such as printing out the system's data/time), so I decided to remove all of the solutions to completely 
reduce any chance of violating academic honesty.
	Testing was done througout the development process, since experience has taught me that it is easier to build and test in small increments--
as it also allows you to focus on different scopes at a time and have a solid understanding of how a system works. I spent a lot of time worrying
about having the script create a specific file structure based on each assignment, instead of just creating a consistant file structure that would
make things much more simple (especially when it comes to cleaning up afterwards). Some aspects of this script went a little outside of the scope for this
course, but I felt it was nice to tie previous knowledge with newly gained knowledge and how how different systems can work together.
