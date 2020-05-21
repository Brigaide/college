def foo(n):
    if n<1:
        print('')
    else:
        print('*',end='')
        foo( n-1 )
