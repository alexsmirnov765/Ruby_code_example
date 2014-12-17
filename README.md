Ruby_code_example
=================

Description for 'room_example_code.rb':

This program is designed to find the length of path of laser beam within the rectangular room under following conditions:
1. There is only one laser beam source within the room (represented by '@' character within source text file);
2. The length of path should continue count until laser beam touches any room wall;
3. The room contains several types of reflecting surfaces - mirrors with different orientations etc. (represented by '^', 'v',
'<', '>', 'o', '/', '\' characters) and empty spaces (represented by '-' characters);
4. Finding possible infinite loop is out of scope of this task;

Requirements: the script requires source file describing internal room structure ('input007.txt') to be located
in the same folder as the script

Run with: $ ruby room_example_code.rb
