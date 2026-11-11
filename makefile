.PHONY: all clean version

CXX := g++
CXXFLAGS := -Wall -Wextra -std=c++17

all: address main.exe

ip:
	@curl --fail --silent --show-error https://api.ipify.org > ip

host:
	@hostname > host

address: host ip
	@for /f %%h in (host) do @for /f %%i in (ip) do @echo %%h@%%i>address

main.exe: main.cpp
	$(CXX) $(CXXFLAGS) main.cpp -o main.exe

clean:
	-@del /Q ip host address main.exe 2>NUL

version:
	@echo $(MAKE_VERSION)
