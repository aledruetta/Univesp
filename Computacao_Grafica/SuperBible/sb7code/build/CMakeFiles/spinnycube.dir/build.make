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
include CMakeFiles/spinnycube.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/spinnycube.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/spinnycube.dir/flags.make

CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o: CMakeFiles/spinnycube.dir/flags.make
CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o: ../src/spinnycube/spinnycube.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o -c /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/spinnycube/spinnycube.cpp

CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/spinnycube/spinnycube.cpp > CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.i

CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/src/spinnycube/spinnycube.cpp -o CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.s

# Object files for target spinnycube
spinnycube_OBJECTS = \
"CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o"

# External object files for target spinnycube
spinnycube_EXTERNAL_OBJECTS =

../bin/spinnycube: CMakeFiles/spinnycube.dir/src/spinnycube/spinnycube.cpp.o
../bin/spinnycube: CMakeFiles/spinnycube.dir/build.make
../bin/spinnycube: lib/libsb7.a
../bin/spinnycube: CMakeFiles/spinnycube.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/spinnycube"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spinnycube.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/spinnycube.dir/build: ../bin/spinnycube

.PHONY : CMakeFiles/spinnycube.dir/build

CMakeFiles/spinnycube.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/spinnycube.dir/cmake_clean.cmake
.PHONY : CMakeFiles/spinnycube.dir/clean

CMakeFiles/spinnycube.dir/depend:
	cd /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build /home/alejandro/Devel/Univesp/Computacao_Grafica/SuperBible/sb7code/build/CMakeFiles/spinnycube.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/spinnycube.dir/depend

