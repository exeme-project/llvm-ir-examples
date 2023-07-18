@str.0 = constant [40 x i8] c"Enter the number of terms to generate: \00" ; '\00' is the null terminator
@str.1 = constant [21 x i8] c"Fibonacci Sequence: \00"
@str.2 = constant [3 x i8] c"%d\00"
@str.3 = constant [5 x i8] c"%d, \00"

declare i64 @printf(i8*, ...) ; external declaration for the printf function
declare i64 @scanf(i8*, ...)

; definition of fibonacci function
define void @fibonacci(i64* %num) { ; return type is i64, parameter is i64*
    %1 = load i64, i64* %num ; load the value of %num into %1
    %2 = getelementptr [5 x i8], [5 x i8]* @str.3, i64 0, i64 0 ; convert [5 x i8]* to i8*

    %counter = alloca i64 ; allocate space on the stack for an i64
    %n.1 = alloca i64
    %n.2 = alloca i64

    store i64 2, i64* %counter ; store 0 into %counter
    store i64 0, i64* %n.1
    store i64 1, i64* %n.2

    %3 = call i64 (i8*, ...) @printf(i8* %2, i64 0) ; call printf with %2 and 0
    %4 = call i64 (i8*, ...) @printf(i8* %2, i64 1)

    br label %loop ; branch to the loop label

    loop: ; loop label
        %5 = load i64, i64* %counter ; load the value of %counter into %5
        %6 = icmp slt i64 %5, %1 ; compare %5 and %1

        br i1 %6, label %loop.body, label %loop.end ; branch to loop.body if %6 is true, otherwise branch to loop.end

    loop.body: ; loop.body label
        %7 = load i64, i64* %n.1 ; load the value of %n.1 into %7
        %8 = load i64, i64* %n.2
        %9 = add i64 %7, %8 ; add %7 and %8
        
        %10 = call i64 (i8*, ...) @printf(i8* %2, i64 %9) ; call printf with %10 and %9

        store i64 %8, i64* %n.1; store %8 into %n.1
        store i64 %9, i64* %n.2 

        %11 = add i64 %5, 1 ; add %5 and 1
        store i64 %11, i64* %counter ; store %11 into %counter

        br label %loop ; branch to the loop label

    loop.end: ; loop.end label
        ret void
}

; definition of main function
define i64 @main() { ; return type is i64, no parameters
    %1 = getelementptr [40 x i8], [40 x i8]* @str.0, i64 0, i64 0 ; convert [40 x i8]* to i8*
    %2 = getelementptr [21 x i8], [21 x i8]* @str.1, i64 0, i64 0
    %3 = getelementptr [3 x i8], [3 x i8]* @str.2, i64 0, i64 0

    %4 = alloca i64 ; allocate space on the stack for an i64

    %5 = call i64 (i8*, ...) @printf(i8* %1) ; call printf with %1
    %6 = call i64 (i8*, ...) @scanf(i8* %3, i64* %4)
    %7 = call i64 (i8*, ...) @printf(i8* %2)

    call void @fibonacci(i64* %4)

    ret i64 0 ; return a success code
}