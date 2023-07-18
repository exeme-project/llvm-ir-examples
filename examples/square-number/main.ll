@str.0 = constant [17 x i8] c"Enter a number: \00" ; '\00' is the null terminator
@str.1 = constant [28 x i8] c"Your number squared is: %d.\00" ; '\00' is the null terminator
@str.2 = constant [3 x i8] c"%d\00" ; '\00' is the null terminator

declare i64 @printf(i8*, ...) ; external declaration for the printf function
declare i64 @scanf(i8*, ...) ; external declaration for the scanf function

; declaration of square function
define i64 @square(i64* %num) { ; return type is i64, parameter is a pointer to an i64
    %1 = load i64, i64* %num ; load the value of %num into %1
    %2 = mul i64 %1, %1 ; multiply %1 by itself
    
    ret i64 %2 ; return the result
}

; declaration of main function
define i64 @main() { ; return type is i64, no parameters
    %1 = getelementptr [17 x i8], [17 x i8]* @str.0, i64 0, i64 0 ; convert [17 x i8]* to i8*
    %2 = getelementptr [28 x i8], [28 x i8]* @str.1, i64 0, i64 0 ; convert [27 x i8]* to i8*
    %3 = getelementptr [3 x i8], [3 x i8]* @str.2, i64 0, i64 0 ; convert [3 x i8]* to i8*

    %4 = alloca i64 ; allocate space on the stack for an i64

    %5 = call i64 (i8*, ...) @printf(i8* %1) ; call printf with %1
    %6 = call i64 (i8*, ...) @scanf(i8* %3, i64* %4) ; call scanf with the format string as %3 and the paramter as %5
    %7 = call i64 @square(i64* %4) ; call square with %5
    %8 = call i64 (i8*, ...) @printf(i8* %2, i64 %7) ; call printf with the format string as %2 and the parameter as %7

    ret i64 0 ; return a success code
}