#include <iostream>

using namespace std;

int main(int argc, char* argv[]) {
	if(argc != 2) {
		return 1;//error - no argument word to count length
	}
	int i = 0;
	char *c = argv[1];
	while(c[i]!='\0') ++i;
	//here is writting to file or something
	return 0;//success!
}
