#include <stdio.h>

int main(void) {
	int number;

	printf("Enter a number: ");
	scanf("%d", &number);
	printf("Your number squared is: %d.\n", number * number);

	return 0;
}
