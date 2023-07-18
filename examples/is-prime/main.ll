@str.0 = constant [17 x i8] c"Enter a number: \00"
@str.1 = constant [14 x i8] c"%d is prime!\0A\00" ; '\0A' is the newline character, '\00' is the null terminator
@str.2 = constant [18 x i8] c"%d is not prime!\0A\00"
@str.3 = constant [3 x i8] c"%d\00"

declare i64 @printf(i8*, ...) ; external declaration for the printf function
declare i64 @scanf(i8*, ...)

; definition of isPrime function
define i1 @isPrime(i64* %num) { ; return type is i1, parameter is i64*
    %1 = load i64, i64* %num ; load the value of num into %1

    %counter = alloca i64 ; allocate space on the stack for an i64
    store i64 0, i64* %counter ; store 0 into %counter

    ret i1 0
}


; definition of main function
define i64 @main() { ; return type is i64, no parameters
    %1 = getelementptr [17 x i8], [17 x i8]* @str.0, i64 0, i64 0 ; convert [17 x i8]* to i8*
    %2 = getelementptr [14 x i8], [14 x i8]* @str.1, i64 0, i64 0
    %3 = getelementptr [18 x i8], [18 x i8]* @str.2, i64 0, i64 0
    %4 = getelementptr [3 x i8], [3 x i8]* @str.3, i64 0, i64 0

    %5 = alloca i64 ; allocate space on the stack for an i64

    %6 = call i64 (i8*, ...) @printf(i8* %1) ; call printf with %1
    %7 = call i64 (i8*, ...) @scanf(i8* %4, i64* %5)
    %8 = call i1 @isPrime(i64* %5)

    %9 = load i64, i64* %5 ; load the value of %5 into %9

    br i1 %8, label %true, label %false

    true: ; true label
        %10 = call i64 (i8*, ...) @printf(i8* %2, i64 %9) ; call printf with %2 and %9
        br label %end ; branch to end label
    false: ; false label
        %11 = call i64 (i8*, ...) @printf(i8* %3, i64 %9)
        br label %end
    end: ; end label
        ret i64 0 ; return a success code
}