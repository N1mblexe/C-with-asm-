#include <stdio.h>

extern void print_string_asm(const char* str);

int main()
{
	char *str = "Aminakekee";

	print_string_asm(str);
	return 0;
}
