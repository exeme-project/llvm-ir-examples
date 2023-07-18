@str.0 = constant [17 x i8] c"Enter a number: \00" ; '\00' is the null terminator
@str.1 = constant [27 x i8] c"Your number squared is: %d\00" ; '\00' is the null terminator
@str.2 = constant [3 x i8] c"%d\00" ; '\00' is the null terminator

declare i64 @printf(i8*, ...) ; external declaration for the printf function
declare i64 @scanf(i8*, ...) ; external declaration for the scanf function

; declaration of main function
define i64 @main() { ; return type is i64, no parameters
    %1 = getelementptr [17 x i8], [17 x i8]* @str.0, i64 0, i64 0 ; convert [17 x i8]* to i8*
    %2 = getelementptr [27 x i8], [27 x i8]* @str.1, i64 0, i64 0 ; convert [27 x i8]* to i8*
    %3 = getelementptr [3 x i8], [3 x i8]* @str.2, i64 0, i64 0 ; convert [3 x i8]* to i8*

    %4 = call i64 (i8*, ...) @printf(i8* %1) ; call printf with %1
    %5 = alloca i64 ; allocate space on the stack for an i64
    %6 = call i64 (i8*, ...) @scanf(i8* %3, i64* %5) ; call scanf with the format string as %3 and the paramter as %5
    %7 = load i64, i64* %5 ; load the value of %5 from the stack to the register %7
    %8 = mul i64 %7, %7 ; square the value of %7
    %9 = call i64 (i8*, ...) @printf(i8* %2, i64 %8) ; call printf with the format string as %2 and the parameter as %8

    ret i64 0 ; return a success code
}