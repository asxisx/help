# Prerequisites
- **Cmake** | Download from [here](https://cmake.org/download/)
- **Ninja** | Download from [here](https://ninja-build.org/)
- **Visual Studio Code 2022 Community Edition** | Download from [here](https://visualstudio.microsoft.com/vs/)
    - Choose following options while adding features:
        - Desktop Development with C++
        - MSVC Build Tools (version as per need)

-----

# Steps

1. I used `winget` to install cmake.
   ```
   winget install Kitware.Cmake
   ```
2. Installed Ninja and set it in `PATH`.
3. Cloned the VowpalWabbit repo.
   ```
   git clone --recursive https://github.com/VowpalWabbit/vowpal_wabbit.git
   cd vowpal_wabbit
   ```
## There are [multiple ways to build Vowpal Wabbit](https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Building) and I chose `vcpkg`

4. Run this cmake command
   ```
   cmake -S . -B build -DCMAKE_BUILD_TYPE:STRING="Release" -DCMAKE_TOOLCHAIN_FILE:FILEPATH="./ext_libs/vcpkg/scripts/buildsystems/vcpkg.cmake" -DFMT_SYS_DEP:BOOL="ON" -DRAPIDJSON_SYS_DEP:BOOL="ON" -DSPDLOG_SYS_DEP:BOOL="ON" -DVW_BOOST_MATH_SYS_DEP:BOOL="ON" -DVW_GTEST_SYS_DEP:BOOL="ON" -DVW_ZLIB_SYS_DEP:BOOL="ON" -DBUILD_TESTING:BOOL="OFF" -A x64 -G "Visual Studio 17 2022" -DVCPKG_TARGET_TRIPLET=x64-windows -DVW_INSTALL:BOOL="ON"
   cmake --build build
   ```
   - where `-DVW_INSTALL:BOOL="ON"` to use `vw` command line tool. ([mentioned here](https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Installing))
   - change `-G` version as per your Visual Studio
   - `-A x64` in cases for windows x64 only, otherwise it defaults to x32.

Once successfully completed, an output like below will be shown along with the warnings.
 
  ```
  # outut (lastline) after running the first "cmake -S command ..."
  -- Build files have been written to: C:/poc/vowpal_wabbit/build

  # output (last few lines) after running the command "cmake --build build"
  vw_slim.vcxproj -> C:\poc\vowpal_wabbit\build\vowpalwabbit\slim\Debug\vw_slimd.lib
  Building Custom Rule C:/poc/vowpal_wabbit/vowpalwabbit/spanning_tree/CMakeLists.txt
  spanning_tree.cc
  vw_spanning_tree.vcxproj -> C:\poc\vowpal_wabbit\build\vowpalwabbit\spanning_tree\Debug\vw_spanning_treed.lib
  Building Custom Rule C:/poc/vowpal_wabbit/vowpalwabbit/spanning_tree_bin/CMakeLists.txt
  spanning_tree_main.cc
  vw_spanning_tree_bin.vcxproj -> C:\poc\vowpal_wabbit\build\vowpalwabbit\spanning_tree_bin\Debug\spanning_tree.exe
  Building Custom Rule C:/poc/vowpal_wabbit/CMakeLists.txt
  ```
  

5. Run the final command to install the build.
   ```
   cmake --install build
   # To make build at a certain path use "--prefix"
   ```
------

## But now, ERRORS.
I am using _VowpalWabbit Version: 9.9.0_ on _WinSDK Version: 10.0.16299.0_.

1. First error was this:
   ```
   CMake Error at build/vowpalwabbit/allreduce/cmake_install.cmake:39
   (file):file INSTALL cannot find "C:/poc/vowpal_wabbit/build/vowpalwabbit/allreduce/Release/vw_allreduce.lib": No error.
   Call Stack (most recent call first):
   build/vowpalwabbit/cmake_install.cmake:38 (include)
   build/cmake_install.cmake:82 (include)
   ```
   Because all my build was successflly completed, I was confused. Then I used `Find` in Powershell and got this:

   ```
   PS C:\poc\vowpal_wabbit> cmake --build build
   MSBuild version 17.9.8+b34f75857 for .NET Framework
   1>Checking Build System
   Building Custom Rule C:/poc/vowpal_wabbit/vowpalwabbit/io/CMakeLists.txt
   io_adapter.cc
   errno_handling.cc
   logger.cc
   vw_io.vcxproj -> C:\poc\vowpal_wabbit\build\vowpalwabbit\io\Debug\vw_iod.lib
   Building Custom Rule C:/poc/vowpal_wabbit/vowpalwabbit/allreduce/CMakeLists.txt
   allreduce_sockets.cc
   allreduce_threads.cc
   vw_allreduce.vcxproj -> C:\poc\vowpal_wabbit\build\vowpalwabbit\allreduce\Debug\vw_allreduced.lib
   ```
   I'm not sure why but it went to the wrong path (`Debug` instead of `Release`) with th wrong name (`allreduced` instead of `allreduce`).
   So i simply changed the file name, created `Release` folder and pasted all files inside debug.

2. Second issue was this:

   ```
   cmake --install build
   -- Install configuration: "Release"
   -- Up-to-date: C:/Program Files/vowpal_wabbit/lib/pkgconfig/libvw_c_wrapper.pc
   -- Up-to-date: C:/Program Files/vowpal_wabbit/lib/cmake/VowpalWabbit/VowpalWabbitTargets.cmake
   -- Up-to-date: C:/Program Files/vowpal_wabbit/lib/cmake/VowpalWabbit/VowpalWabbitTargets-release.cmake
   -- Up-to-date: C:/Program Files/vowpal_wabbit/lib/cmake/VowpalWabbit/VowpalWabbitConfigVersion.cmake
   -- Up-to-date: C:/Program Files/vowpal_wabbit/lib/cmake/VowpalWabbit/VowpalWabbitConfig.cmake
   -- Up-to-date: C:/Program Files/vowpal_wabbit/include/nonstd/
   -- Up-to-date: C:/Program Files/vowpal_wabbit/include/nonstd//string_view.hpp
   -- Installing: C:/Program Files/vowpal_wabbit/lib/vw_allreduce.lib
   -- Up-to-date: C:/Program Files/vowpal_wabbit/include
   -- Installing: C:/Program Files/vowpal_wabbit/include/vw
   -- Installing: C:/Program Files/vowpal_wabbit/include/vw/allreduce
   -- Installing: C:/Program Files/vowpal_wabbit/include/vw/allreduce/allreduce.h
   -- Installing: C:/Program Files/vowpal_wabbit/include/vw/allreduce/allreduce_type.h
   CMake Error at build/vowpalwabbit/c_wrapper/cmake_install.cmake:51 (file):
   file INSTALL cannot find
   "C:/poc/vowpal_wabbit/build/vowpalwabbit/c_wrapper/Release/vw_c_wrapper.dll":
   File exists.
   Call Stack (most recent call first):
   build/vowpalwabbit/cmake_install.cmake:39 (include)
   build/cmake_install.cmake:82 (include)
   ```
   Again the file was inside `/build/vowpalwabbit/c_wrapper/Debug` instead `/build/vowpalwabbit/c_wrapper/Release`.
   So i created the folder and pasted all files inside Debug.

------
## `vw.exe` utility path

```
vowpal_wabbit/build/vowpalwabbit/cli/Release/vw.exe
```

------

# Important Links

- [Building VowpalWabbit](https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Building)
- [Can't install Vowpalwabbit using pip on Windows 10](https://github.com/VowpalWabbit/vowpal_wabbit/issues/1893)
- [Vowpal Wabbit Python Support](https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Python#support)
- [Official Get Started](https://vowpalwabbit.org/start.html)
