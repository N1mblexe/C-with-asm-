extern void print_string_asm(const char* str);

int main()
{
	char *str = "later nerds";

	print_string_asm(str);
	return 0;
}
