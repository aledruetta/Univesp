# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build

# Include any dependencies generated for this target.
include CMakeFiles/shadowmapping.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/shadowmapping.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/shadowmapping.dir/flags.make

CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o: CMakeFiles/shadowmapping.dir/flags.make
CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o: ../src/shadowmapping/shadowmapping.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o -c /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/shadowmapping/shadowmapping.cpp

CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/shadowmapping/shadowmapping.cpp > CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.i

CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/shadowmapping/shadowmapping.cpp -o CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.s

# Object files for target shadowmapping
shadowmapping_OBJECTS = \
"CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o"

# External object files for target shadowmapping
shadowmapping_EXTERNAL_OBJECTS =

../bin/shadowmapping: CMakeFiles/shadowmapping.dir/src/shadowmapping/shadowmapping.cpp.o
../bin/shadowmapping: CMakeFiles/shadowmapping.dir/build.make
../bin/shadowmapping: lib/libsb7.a
../bin/shadowmapping: CMakeFiles/shadowmapping.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/shadowmapping"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/shadowmapping.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/shadowmapping.dir/build: ../bin/shadowmapping

.PHONY : CMakeFiles/shadowmapping.dir/build

CMakeFiles/shadowmapping.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/shadowmapping.dir/cmake_clean.cmake
.PHONY : CMakeFiles/shadowmapping.dir/clean

CMakeFiles/shadowmapping.dir/depend:
	cd /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles/shadowmapping.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/shadowmapping.dir/depend
